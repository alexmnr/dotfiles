#!/bin/zsh

temp=$(sudo vcgencmd measure_temp | egrep -o '[0-9]*\.[0-9]*')

echo $temp
