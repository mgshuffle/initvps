#！/bin/bash

$(yum -y install nginx);

echo 'copy configuration files'
$(mv -f ./nginx.conf /etc/nginx/)
$(mv -f ./conf.d/* /etc/nginx/conf.d/)
echo 'clone project ariaNG'
$(git clone https://github.com/mgshuffle/AriaNg.git)
echo 'copy ariaNG page'
$(mv ./AriaNG /usr/share/nginx/)

echo 'adding listening port 80'
echo $(firewall-cmd --permanent --zone=public --add-port=80/tcp)
echo 'firewall reloading'
echo $(firewall-cmd --reload)