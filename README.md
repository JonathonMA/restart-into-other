# Restart into Other

There's nothing worse than rebooting to change OS, walking off while the
shutdown and POST is in progress, and coming back just as you boot right
back into the environment you just left.

You can solve that with grub-reboot, but wouldn't it be cooler to select
your next OS right from the restart menu?

Restart into Other is a simple tool that prompts you to select one of
your grub2 menu entries. It will then select that menu entry using
grub-reboot and restart.

## Pre-setup: configure for grub-reboot

Edit /etc/default/grub

Make sure GRUB\_DEFAULT is set to saved:

    GRUB_DEFAULT=saved

If you had to change it, run update-grub

    $ sudo update-grub

Configure the default on all non-preselected boots:

    $ sudo grub-set-default <whatever GRUB_DEFAULT was>

## Installation

Install the shell scripts and put the .desktop file into /usr/share/indicators/session/applications

    $ sudo make install
