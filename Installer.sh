#Getting Storage Permission
termux-setup-storage -y

# Installing sudo in Termux
  # Checking if sudo is already installed
  if [ "$(dpkg -s tsu 2>/dev/null | wc -l)" -gt 0 ];
  then
      echo "Sudo Already Installed"
  else
       pkg install tsu -y
  fi

# Rem Build.prop Tweaks

# Setting Permission
sudo chmod -R o+rwx /system/build.prop

# Adding build.prop tweaks for Touch responsiveness

# Backing up original build.prop
mkdir /sdcard/RemBackup

sudo tee /sdcard/RemBackup/build.prop.backup /system/build.prop.backup < /system/build.prop > /dev/null

# Applying Tweaks

sudo cat build.prop >> /system/build.prop

# Setting Permission to default

sudo chmod -R o-rwx /system/build.prop

echo -e "\e[1;92mDone!\e[1;91m Please Reboot your phone\e[0m \n\n"
