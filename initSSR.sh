echo 'install python'
echo $(yum -y install python-setuptools && easy_install pip)
#echo 'install git'
#echo $(yum -y install git)

echo 'clone shadowsocksr from github'
git clone -b manyuser https://github.com/mgshuffle/shadowsocksr.git;

$(mv ./shadowsocksr ~/)
$(chmod +x ~/shadowsocksr/initmujson.sh)
$(bash ~/shadowsocksr/initmujson.sh)
$(bash ~/shadowsocksr/logrun.sh)