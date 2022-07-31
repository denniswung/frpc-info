#!/bin/bash
source /etc/profile

echo "Passwd Changing..."

echo "root:xhbf2002" | chpasswd

echo "install brook"
bash <(curl https://bash.ooo/nami.sh)

nami install brook

echo "Fowarding"

nohup brook wsserver --listen :5001 --password xhbf2002 > brookwsserver.log 2>&1 &

echo "Done!"

cat brookwsserver.log

netstat -tunlp
