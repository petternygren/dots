#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
#exec awesome
#exec openbox-session
#sxhkd &
#exec bspwm
exec compton -c -C &
#-t2 -l2 -r1 -o.25 
exec i3
