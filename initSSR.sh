echo 'install python'
echo $(yum -y install python-setuptools && easy_install pip)

echo 'clone shadowsocksr from github'
git clone -b manyuser https://github.com/mgshuffle/shadowsocksr.git;

$(mv ./shadowsocksr ~/)
$(chmod +x ~/shadowsocksr/initmujson.sh)