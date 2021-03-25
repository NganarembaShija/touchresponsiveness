# Installing sudo in Termux
pkg install tsu -y

# Rem Build.prop Tweaks

#Mounting...

sudo mount -o rw,remount / &> /dev/null
sudo chmod +x Installer.sh > /dev/null 2>&1

# Adding build.prop tweaks for Touch responsiveness

# Backing up original build.prop

sudo tee /sdcard/build.prop.backup /system/build.prop.backup < /system/build.prop > /dev/null

# Applying Tweaks

sudo cat build.prop >> /system/build.prop

echo -e "Done!\e[1;91m Please Reboot your phone\e[0m \n\n"
