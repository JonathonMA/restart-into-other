#!/bin/bash
# restart-into-other -- select a grub menu entry and then restarts into it

# regex to filter out boring entries
REJECT="memtest|(recovery mode)"

list_grub_entries() {
  grep menuentry /boot/grub/grub.cfg | tr \' \"  | cut -f 2-2 -d\" |\
  grep -vE "$REJECT"
}

# display a list selection 
num_entries=`list_grub_entries | wc -l`
widest_entry=`list_grub_entries | tr -c '\n' ' ' | sort | tail -1 | wc -c`
height=$[ $num_entries * 23 + 88 ]
width=$[ $widest_entry * 8 ]
entry=$(list_grub_entries | zenity --list --hide-header \
  --text="Reboot using which GRUB entry?" --column="OS" \
  --height $height --width $width)

if [ -z "$entry" ]; then
  : # nothing selected or cancel: do nothing
else
  gksudo -- restart-into-other-helper "$entry"
fi
