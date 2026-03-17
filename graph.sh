#! /bin/sh

datafile="./data.txt"

printf 'HTTP/1.1 200 OK\r\n'
printf 'Content-Type: image/svg+xml; charset=utf-8\r\n'
printf '\r\n'

gnuplot <<EOF
set terminal svg size 1024,256 name "瞬時電力" rounded
set xdata time
set timefmt "%s"
set format x "%H:%M"
set title "瞬時電力"
set xlabel "時刻（UTC）"
set ylabel "計測値 [W]"
set nokey
plot[][0:] "< sed 's/\t0\t/\tNaN\t/' $datafile" using 1:2 with lines;
EOF
