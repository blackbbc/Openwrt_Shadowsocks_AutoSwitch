#!/bin/sh

restartShadowSocks() {
    echo "hello World"
    servers=(
    "sg04.shadowsocks.com.cn"
    "tw01.shadowsocks.com.cn"
    "jp02.shadowsocks.com.cn"
    "jp03.shadowsocks.com.cn"
    )

    index=0
    minn=1000000
    bestServer=${servers[0]}
    for server in "${servers[@]}"
    do
        avgPing=`ping -c 4 ${server} | tail -1| awk '{print $4}' | cut -d '/' -f 2`
        if [ $(echo "$avgPing < $minn" | bc) -ne 0 ]
        then
            minn=$avgPing
            bestServer=${servers[$index]}
        fi
        index=$((index+1))
    done

    #sed -i -e "s/\"server\":\".*\"/\"server\":\"${bestServer}\"/" config.json
    sed -i -e "s/remote_server .*/remote_server '${bestServer}'/" shadowsocks
    /etc/init.d/shadowsocks restart
}

restartShadowSocks

LOGTIME=$(date "+%Y-%m-%d %H:%M:%S")
ping -q -c 5 www.google.com
if [ "$?" == "0" ]
then
    echo "['$LOGTIME'] No Problem."
    exit 0
else
    ping -q -c 5 www.baidu.com
    if [ "$?" == "0" ]
    then
        echo "['$LOGTIME'] Problem decteted, restarting shadowsocks."
        restartShadowSocks
    else
        echo '['$LOGTIME'] Network Problem. Do nothing.'
    fi
fi
