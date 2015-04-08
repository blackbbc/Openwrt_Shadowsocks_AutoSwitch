#/bin/sh
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
    avgPing=`ping -c 4 ${server} | tail -1| awk '{print $4}' | cut -d '/' -f 2`
    avgPing=${avgPing%.*}
    if [ $avgPing -lt $minn ]
    then
        minn=$avgPing
        bestServer=$server
    fi
done

sed -i -e "s/remote_server .*/remote_server '${bestServer}'/" /etc/config/shadowsocks
/etc/init.d/shadowsocks restart
