#!/bin/bash
#
# [PlexGuide Menu]
#
# GitHub:   https://github.com/Admin9705/PlexGuide.com-The-Awesome-Plex-Server
# Author:   Admin9705 - Deiteq
# URL:      https://plexguide.com
#
# PlexGuide Copyright (C) 2018 PlexGuide.com
# Licensed under GNU General Public License v3.0 GPL-3 (in short)
#
#   You may copy, distribute and modify the software as long as you track
#   changes/dates in source files. Any modifications to our software
#   including (via compiler) GPL-licensed code must also be made available
#   under the GPL along with build & install instructions.
#
#################################################################################
export NCURSES_NO_UTF8_ACS=1
domain=$( cat /var/plexguide/server.domain )

HEIGHT=12
WIDTH=38
CHOICE_HEIGHT=6
BACKTITLE="Visit PlexGuide.com - Automations Made Simple"
TITLE="App Selection for Primary Domain"

 OPTIONS=(A "Heimdall"
          B "HTPCManager"
          C "Muximux"
          D "Ombi"
          E "Organizr"
          Z "Exit")

CHOICE=$(dialog --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

case $CHOICE in
        A)         
            program="heimdall"
            echo "$program" > /var/plexguide/tld.choice
            bash /opt/plexguide/menus/tld/rebuild.sh
            dialog --msgbox "\n$program is now your supported by your Top Level Domain!" 0 0
            ;;
        B)
            program="htpcmanager"
            echo "$program" > /var/plexguide/tld.choice
            bash /opt/plexguide/menus/tld/rebuild.sh
            dialog --msgbox "\n$program is now your supported by your Top Level Domain!" 0 0
            ;;
        C)
            program="muximux"
            echo "$program" > /var/plexguide/tld.choice
            bash /opt/plexguide/menus/tld/rebuild.sh
            dialog --msgbox "\n$program is now your supported by your Top Level Domain!" 0 0
            ;;
        D)
            program="ombi"
            echo "$program" > /var/plexguide/tld.choice
            bash /opt/plexguide/menus/tld/rebuild.sh
            dialog --msgbox "\n$program is now your supported by your Top Level Domain!" 0 0
            ;;
        E)
            program="organizr"
            echo "$program" > /var/plexguide/tld.choice
            bash /opt/plexguide/menus/tld/rebuild.sh
            dialog --msgbox "\n$program is now your supported by your Top Level Domain!" 0 0
            ;;
        Z)
            exit 0 ;;
esac

#recall itself to loop unless user exits
bash /opt/plexguide/menus/tld/main.sh
