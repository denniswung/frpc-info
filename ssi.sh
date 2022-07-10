#!/bin/bash
source /etc/profile

echo "install ss"
apt install shadowsocks-libev -y

echo "install brook"
bash <(curl https://bash.ooo/nami.sh)

nami install brook

echo "INIT"
cd /etc/shadowsocks-libev/

curl -O https://github.com/xuanfau/frpc-info/blob/main/config.json

echo "Start"
sudo /etc/init.d/shadowsocks-libev start

nohup brook relay -f :5001 -t 127.0.0.1:35697 > /dev/null 2>&1 &

echo "DONE!"
