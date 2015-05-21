#/bin/sh
servers=" \
vip-sg04-1.ssv4.net \
vip-tw01-1.ssv4.net \
vip-jp02-1.ssv4.net \
vip-jp04-1.ssv4.net \
vip-jp05-1.ssv4.net \
vip-hk01-1.ssv4.net \
vip-hk03-1.ssv4.net \
vip-hk04-1.ssv4.net \
"

minn=1000000
for server in $servers
do
    ping -c 1 -W 1 $server > /dev/null
    if [ "$?" = "0" ]
    then
        avgPing=`ping -c 4 ${server} | tail -1| awk '{print $4}' | cut -d '/' -f 2`
        avgPing=${avgPing%.*}
        if [ $avgPing -lt $minn ]
        then
            minn=$avgPing
            bestServer=$server
        fi
    fi
done

sed -i -e "s/remote_server .*/remote_server '${bestServer}'/" /etc/config/shadowsocks
/etc/init.d/shadowsocks restart
