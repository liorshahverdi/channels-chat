#!/bin/bash

start() {
	docker run -p 6379:6379 -d redis:5
	python3 manage.py runserver
}

stop() {
	docker stop $(docker ps | tail -n1 | awk '{print $1}')
	kill $(ps -ef | grep runserver | head -n1 | awk '{print $2}')
}

case "$1" in
   start) start ;;
   stop)  stop;;
   *) echo "usage $0 start|stop" >&2
      exit 1
      ;;
esac