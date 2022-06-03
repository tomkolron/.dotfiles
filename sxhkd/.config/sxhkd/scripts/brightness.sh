#!/bin/bash

brightness=$(xrandr --verbose |grep Brightness |grep -o '[0-9].*')
brightness=$(bc -l <<<"${brightness}*100" | cut -d'.' -f1)
if [ "`echo "${brightness} <= 40" | bc`" -eq 1 ]
then
  text=""
fi
if [ "`echo "${brightness} >= 50" | bc`" -eq 1 ]
then
  text=""
fi
if [ "`echo "${brightness} >= 60" | bc`" -eq 1 ]
then
  text=""
fi
if [ "`echo "${brightness} >= 70" | bc`" -eq 1 ]
then
  text=""
fi
if [ "`echo "${brightness} >= 80" | bc`" -eq 1 ]
then
  text=""
fi
if [ "`echo "${brightness} >= 90" | bc`" -eq 1 ]
then
  text=""
fi
if [ "`echo "${brightness} == 100" | bc`" -eq 1 ]
then
  text=""
fi
if [ "`echo "${brightness} > 100" | bc`" -eq 1 ]
then
  text="+"
fi

output="${text} ${brightness}"

if [ $1 -eq 1 ]
then
  if [ "`echo "${brightness} < 130" | bc`" -eq 1 ]
  then
    xrandr --output HDMI-0 --brightness $(echo "$(xrandr --verbose |grep Brightness |grep -o '[0-9].*')+0.1" | bc)
    polybar-msg action "#custom_bright.hook.0"
  fi
fi

if [ $1 -eq 0 ]
then
  echo $output
fi

if [ $1 -eq -1 ]
then
  if [ "`echo "${brightness} > 40" | bc`" -eq 1 ]
  then
    xrandr --output HDMI-0 --brightness $(echo "$(xrandr --verbose |grep Brightness |grep -o '[0-9].*')-0.1" | bc)
    polybar-msg action "#custom_bright.hook.0"
  fi
fi
