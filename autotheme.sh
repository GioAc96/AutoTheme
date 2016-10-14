#!/bin/bash

godark() {
	notify-send "Going Dark!"
	gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Dark'
	gsettings set org.gnome.desktop.wm.preferences theme 'Arc-Dark'
	gsettings set org.gnome.gedit.preferences.editor scheme 'cobalt'
}

gobright() {
	notify-send "Going Bright!"
	gsettings set org.gnome.desktop.interface gtk-theme 'Arc'
	gsettings set org.gnome.desktop.wm.preferences theme 'Arc'
	gsettings set org.gnome.gedit.preferences.editor scheme 'kate'	
}

hour=$(date "+%-H")
curtheme=$(gsettings get org.gnome.desktop.interface gtk-theme)
if [ "$hour" -gt "21" ] || [ $hour -lt "7" ]; then
	if [ "$curtheme" != "'Arc-Dark'" ]; then
		godark
		notify-send "Going dark!"
	fi
else
	if [ "$curtheme" != "'Arc'" ]; then
		gobright 
		notify-send "Going bright!"
	fi
fi
