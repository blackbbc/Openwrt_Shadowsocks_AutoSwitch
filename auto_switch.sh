#!/bin/sh

restartShadowSocks() {
    servers=" \
    sg04.shadowsocks.com.cn \
    tw01.shadowsocks.com.cn \
    jp02.shadowsocks.com.cn \
    jp03.shadowsocks.com.cn \
    jp04.shadowsocks.com.cn \
    jp05.shadowsocks.com.cn \
    hk01.shadowsocks.com.cn \
    hk03.shadowsocks.com.cn \
    hk04.shadowsocks.com.cn \
    "
    minn=1000000
    for server in $servers
    do
        avgPing=`ping -q -c 4 ${server} | tail -1| awk '{print $4}' | cut -d '/' -f 2`
        avgPing=${avgPing%.*}
        if [ -n "$avgPing" ]
        then
            if [ $avgPing -lt $minn ]
            then
                minn=$avgPing
                bestServer=$server
            fi
        fi
    done
    sed -i -e "s/remote_server .*/remote_server '${bestServer}'/" /etc/config/shadowsocks
    /etc/init.d/shadowsocks restart
}

threshold=400
LOGTIME=$(date "+%Y-%m-%d %H:%M:%S")
testPing=`ping -q -c 4 www.google.com | tail -1| awk '{print $4}' | cut -d '/' -f 2`
testPing=${testPing%.*}

echo "['$LOGTIME'] Ping: $testPing"

if [ -n "$testPing" ] && [ $testPing -lt $threshold ]
then
    echo "['$LOGTIME'] No Problem."
    exit 0
else
    ping -q -c 4 www.baidu.com
    if [ $? -eq 0 ]
    then
        echo "['$LOGTIME'] Problem decteted, restarting shadowsocks."
        restartShadowSocks
    else
        echo '['$LOGTIME'] Network Problem. Do nothing.'
    fi
fi
