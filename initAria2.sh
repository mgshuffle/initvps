#！/bin/bash

$(yum -y install aria2);

mkdir /home/Downloads
mkdir /root/.aria2;
cp ./aria2.conf /root/.aria2/aria2.conf;
touch /root/.aria2/aria2.session;
echo 'adding RPC listening port 6800'
echo $(firewall-cmd --permanent --zone=public --add-port=6800/tcp)
echo 'firewall reloading'
echo $(firewall-cmd --reload)
$(aria2c)