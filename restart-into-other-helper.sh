#!/bin/bash
# reboot-into-other-helper -- restarts and preselects the specified grub
# menu entry

list_grub_entries() {
  grep menuentry /boot/grub/grub.cfg | tr \' \"  | cut -f 2-2 -d\"
}

if [ -z "$1" ]; then
  echo "Usage: $0 <grub menuenty title>"
  exit 1
fi
# check $1 is a valid menuentry
if ! list_grub_entries | grep -qxF "$1"; then
  echo "$0: Must specify a valid grub menu entry"
  exit 1
fi
if ! [ `id -u` -eq 0 ]; then
  echo "$0: Must be superuser"
  exit 1
fi

grub-reboot "$1"
shutdown -r now
