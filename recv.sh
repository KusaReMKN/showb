#! /bin/sh

datafile="./data.txt"

printf 'HTTP/1.1 200 OK\r\n'
printf 'Content-Type: text/plain; charset=utf-8\r\n'
printf '\r\n'

tee -a "$datafile"
