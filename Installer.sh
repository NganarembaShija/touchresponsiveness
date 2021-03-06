apply(){

# Installing sudo in Termux
  # Checking if sudo is already installed
  if [ "$(dpkg -s tsu 2>/dev/null | wc -l)" -gt 0 ];
  then
      echo "Setting Permission..."
  else
       pkg install tsu -y
  fi

# Rem Build.prop Tweaks

# Setting Permission
sudo chmod -R o+rwx /system/build.prop

# Backing up original build.prop
if [ -d "/sdcard/RemBackup" ];
then
  echo "Backing up build.prop..."
else
mkdir /sdcard/RemBackup
fi 

if [ -f "/sdcard/RemBackup/build.prop.backup" ] || [ -f "/system/build.prop.backup" ] || [ -f "~/build.prop.backup" ];
then
    echo
else
sudo tee /sdcard/RemBackup/build.prop.backup /system/build.prop.backup ~/build.prop.backup < /system/build.prop &> /dev/null
fi

# Applying Tweaks

sudo cat build.prop >> /system/build.prop

# Setting Permission to default

sudo chmod -R o-rwx /system/build.prop

echo -e "\e[1;92mDone!\e[1;91m Please Reboot your phone\e[0m \n\n"
}

# Main Menu
clear
echo -ne "\e[1;93mRem Touch Responsiveness Setup Script\n\n\e[1;92m1. Apply Settings\n\e[1;91m2. Restore Default Settings\e[1;95m\n\nEnter choice: \e[0m"
read choice
if [ $choice -eq 1 ];
then
  apply
elif [ $choice -eq 2 ];
then
  sudo chmod o+rwx /system/build.prop
  sudo cat /system/build.prop.backup > /system/build.prop
  sudo chmod o-rwx /system/build.prop
  echo -e "\n\n\e[1;92m Restored Successfully\e[0m\n\n"
fi

