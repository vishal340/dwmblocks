#!/bin/sh

strength=$(cat /proc/net/wireless | awk '/wlan0/ {print $3} ' | sed 's/\.//g')
strength=$(((strength * 100) / 70))

a=$(cat /sys/class/net/wlan0/statistics/rx_bytes)
b=$(cat /sys/class/net/wlan0/statistics/tx_bytes)
sleep 5
in=$(cat /sys/class/net/wlan0/statistics/rx_bytes)
out=$(cat /sys/class/net/wlan0/statistics/tx_bytes)
a=$((($in - $a) / 5120))
b=$((($out - $b) / 5120))
if [ $((a)) -ge 1024 ]; then
	a=$((a / 1024))"."$(((a % 1024) / 103))"M"
else
	a=$a"K"
fi

if [ $((b)) -ge 1024 ]; then
	b=$((b / 1024))"."$(((b % 1024) / 103))"M"
else
	b=$b"K"
fi

echo $strength" "$a"/"$b
