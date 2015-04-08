#!/bin/sh

print_head() {
    echo "">ttt.json
    echo "{">ttt.json
}

print_middle() {
    echo "middle">>ttt.json
}

print_tail() {
    echo "tail">>ttt.json
    echo '"server_port"'>>ttt.json
    echo "}">>ttt.json
    echo "}">>ttt.json
    echo "}">>ttt.json
    echo "}">>ttt.json
    echo "}">>ttt.json
}

LOGTIME=$(date "+%Y-%m-%d %H:%M:%S")
wget -4 --spider --quiet --tries=1 --timeout=3 www.google.co.jp
if [ "$?" == "0" ]
then
    echo '['$LOGTIME'] No Problem.'
    exit 0
else
    wget -4 --spider --quiet --tries=1 --timeout=3 www.baidu.com
    if [ "$?" == "0" ] then
        echo '['$LOGTIME'] Problem decteted, restarting shadowsocks.'
        #/etc/init.d/shadowsocks restart
    else
        echo '['$LOGTIME'] Network Problem. Do nothing.'
    fi
fi

#print_head
#print_middle
#print_tail
