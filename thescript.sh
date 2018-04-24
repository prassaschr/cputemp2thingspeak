#!/bin/bash
#cpuTemp0=$(cat /sys/class/thermal/thermal_zone0/temp)
cpuTemp0=$(cat /sys/class/hwmon/hwmon0/temp1_input)
cpuTemp1=$(($cpuTemp0/1000))
cpuTemp2=$(($cpuTemp0/100))
cpuTempM=$(($cpuTemp2 % $cpuTemp1))

echo CPU temp"="$cpuTemp1"."$cpuTempM"C"
curl -X POST "https://api.thingspeak.com/update?api_key=XXXXXXXXXXXXXXXXXXXXX&field1="$cpuTemp1"."$cpuTempM
