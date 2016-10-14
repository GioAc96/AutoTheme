#!/bin/bash
DARK='Arc-Dark'
BRIGHT='Arc'

godark() {
	notify-send "Going Dark!"
	gsettings set org.gnome.desktop.interface gtk-theme $DARK
	gsettings set org.gnome.desktop.wm.preferences theme $DARK
	gsettings set org.gnome.gedit.preferences.editor scheme 'cobalt'
}

gobright() {
	notify-send "Going Bright!"
	gsettings set org.gnome.desktop.interface gtk-theme $BRIGHT
	gsettings set org.gnome.desktop.wm.preferences theme $BRIGHT
	gsettings set org.gnome.gedit.preferences.editor scheme 'kate'	
}

hour=$(date "+%-H")
curtheme=$(gsettings get org.gnome.desktop.interface gtk-theme)
if [ "$hour" -gt "21" ] || [ $hour -lt "7" ]; then
	if [ "$curtheme" != "$DARK" ]; then
		godark
		notify-send "Going dark!"
	fi
else
	if [ "$curtheme" != "$BRIGHT" ]; then
		gobright 
		notify-send "Going bright!"
	fi
fi
