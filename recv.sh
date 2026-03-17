#! /bin/sh

if [ "$REMOTE_ADDR" != "172.20.40.3" ]
then
	printf 'HTTP/1.1 200 Forbidden\r\n'
	printf 'Content-Type: text/plain; charset=utf-8\r\n'
	printf '\r\n'
	printf 'Ignore\r\n'
	exit 1
fi

datafile="./data.txt"

printf 'HTTP/1.1 200 OK\r\n'
printf 'Content-Type: text/plain; charset=utf-8\r\n'
printf '\r\n'

tee -a "$datafile"
