# Rem Build.prop Tweaks

#Mounting...

su -c mount -o rw,remount / &> /dev/null
su -c chmod +x Installer.sh > /dev/null 2>&1

# Adding build.prop tweaks for Touch responsiveness

# Backing up original build.prop

su -c tee /sdcard/build.prop.backup /system/build.prop.backup < /system/build.prop > /dev/null

# Applying Tweaks

su -c cat build.prop >> /system/build.prop

echo -e "Done!\e[1;91mPlease Reboot your phone\e[0m \n\n"
