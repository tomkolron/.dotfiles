#!/bin/bash
if [ $1 -eq 1 ]
then
  xrandr --output HDMI-0 --brightness $(echo "$(xrandr --verbose |grep Brightness |grep -o '[0-9].*')+0.2" | bc)
fi

if [ $1 -eq 0 ]
then
  echo "$(xrandr --verbose |grep Brightness |grep -o '[0-9].*')"
fi

if [ $1 -eq -1 ]
then
  xrandr --output HDMI-0 --brightness $(echo "$(xrandr --verbose |grep Brightness |grep -o '[0-9].*')-0.2" | bc)
fi
