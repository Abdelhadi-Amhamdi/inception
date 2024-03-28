#!/bin/bash

service vsftpd start

mkdir -p /home/$FTP_USER/ftp

sed -i -r "s/#write_enable=YES/write_enable=YES/1"   /etc/vsftpd.conf
sed -i -r "s/#chroot_local_user=YES/chroot_local_user=YES/1"   /etc/vsftpd.conf
 
adduser $FTP_USER --disabled-password
echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd
echo "$FTP_USER" >> /etc/vsftpd.userlist

chown nobody:nogroup /home/$FTP_USER/ftp
chmod a-w /home/$FTP_USER/ftp
mkdir -p /home/$FTP_USER/ftp/files
chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp/files

# sed -i "s/listen=NO/listen=YES/1" /etc/vsftpd.conf

echo "
pasv_enable=YES
allow_writeable_chroot=YES
local_root=/home/$FTP_USER/ftp
pasv_min_port=10000
pasv_max_port=10005
listen_address=0.0.0.0
userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf

service vsftpd stop

/usr/sbin/vsftpd