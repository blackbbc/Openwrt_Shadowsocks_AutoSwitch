#/bin/bash
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

sed -i -e "s/\"server\":\".*\"/\"server\":\"${bestServer}\"/" config.json
