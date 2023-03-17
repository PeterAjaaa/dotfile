DIRECTORY=./i3-config-backup
if [ ! -d "$DIRECTORY" ];
then
	mkdir $DIRECTORY
fi
cp ~/.config/i3/config ./i3-config-backup/config-performance
cp ./i3-config-backup/config-beauty ~/.config/i3/config
