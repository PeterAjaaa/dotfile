DIRECTORY=./i3-config-backup
if [ ! -d "$DIRECTORY" ];
then
	mkdir $DIRECTORY
fi
cp ~/.config/i3/config ./i3-config-backup/config-beauty
cp ./i3-config-backup/config-performance ~/.config/i3/config
