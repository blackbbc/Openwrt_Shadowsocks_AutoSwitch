#Shadowsocks_AutoSwitch
> If you have multiple shadowsocks servers, you can use this shell script to auto Detect and switch to the quickest server.(Just prevent Deterioration(劣化))


###Usage
1. In the `auto_switch.sh`, modify the servers to your own servers
2. Add the following command to your `crontab`
```
0 * * * * * sh /root/auto_switch.sh >> /var/log/shadowsocks_watchdog.log
0 1 * * * echo "" > /var/log/shadowsocks_watchdog.log
```


----------


<del>Ignore the following link</del>
[https://raw.githubusercontent.com/vokins/simpleu/master/hosts](https://raw.githubusercontent.com/vokins/simpleu/master/hosts)
