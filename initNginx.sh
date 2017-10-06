#！/bin/bash

$(yum -y install nginx);

echo 'copy configuration files'
echo $(mv -f ./nginx.conf /etc/nginx/)
echo $(mv -f ./conf.d/* /etc/nginx/conf.d/)
echo 'clone project ariaNG'
echo $(git clone https://github.com/mgshuffle/AriaNg.git)
echo 'copy ariaNG page'
echo $(mv ./AriaNG /usr/share/nginx/)

echo 'adding listening port 80'
echo $(firewall-cmd --permanent --zone=public --add-port=80/tcp)
echo 'firewall reloading'
echo $(firewall-cmd --reload)

$(nginx)
$(nginx -t)
$(nginx -s reload)