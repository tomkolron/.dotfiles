#!/bin/env bash

#kill shiity program
pkill python3 binpython3

#mine
alias mine ~/programs/1.61/mine_etc.sh

# starts the green clip daemon
greenclip daemon &

# makes mouse disappear after 5 seconds
unclutter -grab &

# sets wallpaper using feh
nitrogen --restore

#language toggle
setxkbmap -option grp:alt_shift_toggle -layout us,il

# polybar
$HOME/.config/i3/bin/launchbar.sh

# Fix cursor
xsetroot -cursor_name left_ptr

# kill if already running
killall -9 picom xfce4-power-manager ksuperkey dunst sxhkd conky eww

# Launch Conkeww
sed -i "s/colors\/color-.*/colors\/color-nord.yuck\")/g" $HOME/.config/conkeww/eww.yuck

# sets superkey
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &

# start hotkey daemon
sxhkd &

# Launch notification daemon
dunst -config $HOME/.config/i3/dunstrc &

# start compositor and power manager
xfce4-power-manager &

while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom --config $HOME/.config/i3/picom.conf &

# start polkit
if [[ ! `pidof xfce-polkit` ]]; then
    /usr/lib/xfce-polkit/xfce-polkit &
fi

# replace neovim colorscheme
sed -i "s/theme =.*$/theme = \"nord\",/g" $HOME/.config/nvim/lua/custom/chadrc.lua

# change xfce4-terminal colorscheme
XFCE_TERM_PATH="$HOME/.config/xfce4/terminal"
cp "$XFCE_TERM_PATH"/colorschemes/nord "$XFCE_TERM_PATH"/terminalrc

# change cava colorscheme
CAVA_PATH="$HOME/.config/cava"
cp "$CAVA_PATH"/colorschemes/nord "$CAVA_PATH"/config

if [ ! $(pgrep "xidlehook") ]; then
  notify-send "setting lock time"
  xidlehook --not-when-fullscreen --timer 900 'alacritty -e cmatrix -C cyan' '' &
fi

# make caps lock key escapse
setxkbmap -option "caps:escape"
