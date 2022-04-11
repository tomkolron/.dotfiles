#!/bin/bash

upower -i /org/freedesktop/UPower/devices/mouse_hidpp_battery_0 | sed -n '/percentage:/p' | sed 's/[^0-9]*//g'
