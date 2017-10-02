#！/bin/bash

$(yum install aria2);

mkdir /root/.aria2;
cp ./aria2.conf /root/.aria2/aria2.conf;
touch /root/.aria2/aria2.session;
echo 'adding RPC listening port'
echo $(firewall-cmd --permanent --zone=public --add-port=6800/tcp)
echo 'firewall reloading'
echo $(firewall-cmd --reload)