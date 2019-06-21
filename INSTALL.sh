

sudo apt install usbmount samba rsync dosfstools ntfs-3g
sudo rsync -av etc/ /etc/
sudo rsync -av lib/ /lib/

sudo systemctl daemon-reload
systemctl enable purgeusbshares.service
sudo service systemd-udevd --full-restart

mkdir -p /etc/samba/auto

grep /etc/samba/auto/ /etc/samba/smb.conf || {
echo "
include = /etc/samba/auto/usb0.conf
include = /etc/samba/auto/usb1.conf
include = /etc/samba/auto/usb2.conf
include = /etc/samba/auto/usb3.conf
include = /etc/samba/auto/usb4.conf
include = /etc/samba/auto/usb5.conf
include = /etc/samba/auto/usb6.conf
include = /etc/samba/auto/usb7.conf
" >> /etc/samba/smb.conf
/etc/init.d/smbd restart 
}

