#/bin/bash



str="192.168.1.1"
servers=(
"192.168.1.1"
"192.168.1.2"
"192.168.1.3"
)

numbers=(
312
54235
534
324
64
1
)

sed -e "s/\"server\":\".*\"/\"server\":\"${str}\"/" config.json
echo ${servers[0]}

minn=1000000
for number in "${numbers[@]}"
do
	if test $[number] -lt $[minn]
	then
		echo $minn
		echo $number
		minn=$number
	fi
done
echo $minn
