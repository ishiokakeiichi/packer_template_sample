echo "set Proxy to yum.conf"
echo $http_proxy

echo `export`


egrep "proxy=" /etc/yum.conf  |egrep -v "^\s*#" > /dev/null 2>&1;
if [ $? -eq 0 ]; then
	sed -i  sed "s|proxy=.*|proxy=${http_proxy}|" /etc/yum.conf
else
	echo "proxy=${http_proxy}" >> /etc/yum.conf
fi

echo "Allow no tty sudo"
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

echo "Install epel repository"
rpm -iv http://ftp.iij.ad.jp/pub/linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm

echo "Install Base pacages from repository"
yum clean all
yum check-update
yum -y install tree
yum -y install gcc make gcc-c++ kernel-devel-`uname -r` zlib-devel openssl-devel readline-devel sqlite-devel perl wget
yum -y install curl bind-utils file git mailx man ntp openssh-clients patch rsync screen sysstat dstat htop traceroute vim-enhanced


#curl -L https://www.chef.io/chef/install.sh | sudo bash
