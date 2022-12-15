#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

$HOME/.config/bspwm/launchbar.sh &
# polybar &

#change your keyboard if you need it
setxkbmap -option grp:alt_shift_toggle -layout us,il

keybLayout=$(setxkbmap -v | awk -F "+" '/symbols/ {print $2}')

#disable caps lock
setxkbmap -option caps:escape

run sxhkd -c ~/.config/sxhkd/sxhkdrc &
greenclip daemon &

nitrogen --restore &
xsetroot -cursor_name left_ptr &

# picom --config $HOME/.config/bspwm/picom.conf --vsync &
picom &


#hide mouse when not moving - 'pacman -S unclutter'
# unclutter -grab &

#lock screen on idle timer
#options: --not-when-audio, --not-when-fullscreen
if [ ! $(pgrep "xidlehook") ]; then
  notify-send "setting lock time"
  xidlehook --not-when-fullscreen --timer 900 'i3lock -t -i $HOME/Pictures/wallpapers/lockImage.png' '' &
fi
