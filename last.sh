#! /bin/sh

datafile="./data.txt"

printf 'HTTP/1.1 200 OK\r\n'
printf 'Content-Type: text/plain; charset=utf-8\r\n'
printf '\r\n'

awk '$2 != 0 {line=$0} END{print line}' "$datafile"
