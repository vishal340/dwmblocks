#!/bin/sh

cat /sys/class/thermal/thermal_zone0/temp | sed -E 's/(..).*/\1/g'
