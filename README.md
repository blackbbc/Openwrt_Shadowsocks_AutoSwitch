#Shadowsocks_AutoSwitch
> If you have multiple shadowsocks servers, you can use this shell script to auto Detect and switch to the quickest server.(Just prevent Deterioration(劣化))


###Usage
Add the following command to your `crontab`
```
0 * * * * * sh /root/auto_switch.sh >> /var/log/shadowsocks_watchdog.log
0 1 * * * echo "" > /var/log/shadowsocks_watchdog.log
```

[https://raw.githubusercontent.com/vokins/simpleu/master/hosts](https://raw.githubusercontent.com/vokins/simpleu/master/hosts)
