#Getting Storage Permission
termux-setup-storage

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

# Backing up original build.prop
if [ -d "/sdcard/RemBackup" ];
then
  echo "Backing Up..."
else
mkdir /sdcard/RemBackup
fi 

sudo tee /sdcard/RemBackup/build.prop.backup /system/build.prop.backup < /system/build.prop > /dev/null

# Applying Tweaks

sudo cat build.prop >> /system/build.prop

# Setting Permission to default

sudo chmod -R o-rwx /system/build.prop

echo -e "\e[1;92mDone!\e[1;91m Please Reboot your phone\e[0m \n\n"
