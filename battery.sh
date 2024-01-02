#!/bin/sh

acpi | awk '{if($3 == "Not"){print "o"$5}else if($3=="Discharging,"){print "-"$4} else {print "+"$4}}' | sed -E 's/(.*),/\1/g'
