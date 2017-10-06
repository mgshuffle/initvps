#！/bin/bash

sshport=86;

systemctl enable firewalld;
systemctl start firewalld;
echo 'firewall setting '
echo 'adding ssh port'
echo $(firewall-cmd --permanent --zone=public --add-port=$sshport/tcp)
echo 'delete origin ssh port 22'
echo $(firewall-cmd --permanent --remove-port=22/tcp)
echo 'port 22 forward setting'
echo $(firewall-cmd --permanen --zone=public --add-forward-port=port=22:proto=tcp:toport=22:toaddr=127.0.0.1)
echo 'firewall reloading'
echo $(firewall-cmd --reload)
echo 'firewall status:'
firewall-cmd --list-all;


echo 'change ssh port'
sed -i "17a port $sshport" /etc/ssh/sshd_config;
systemctl restart sshd;

bash ./initSSR.sh