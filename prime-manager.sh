#!/bin/bash

PMRC_LOCATION=~/.config/prime-manager/prime-managerrc
PROGRAM_LIST=~/.config/prime-manager/prime-manager.conf

echo "" > $PMRC_LOCATION

for program in $(cat $PROGRAM_LIST)
do
	echo "alias $program=\"prime-run $program\"" >> $PMRC_LOCATION
	
	desktop-file-install --dir=$HOME/.local/share/applications /usr/share/applications/$program.desktop
	sed -i 's/Exec=/Exec=prime-run /g' $HOME/.local/share/applications/$program.desktop
done
