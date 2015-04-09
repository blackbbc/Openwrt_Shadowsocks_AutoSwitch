#Openwrt Shadowsocks AutoSwitch
> If you have multiple shadowsocks servers, you can use this shell script to auto Detect and switch to the quickest server.(Just prevent Deterioration(劣化))

###**Importent**
**Just for openwrt**

###Usage
1. In the `auto_switch.sh`, modify the servers to your own servers
2. Add the following command to your `crontab`
```
0 * * * * * sh /root/auto_switch.sh >> /var/log/shadowsocks_watchdog.log
0 1 * * * echo "" > /var/log/shadowsocks_watchdog.log
```


----------

For more Information, please read
[小米路由器  --->   FuckGFW路由器](http://sweetll.me/2015/04/%E5%B0%8F%E7%B1%B3%E8%B7%AF%E7%94%B1%E5%99%A8mini-%E9%85%8D%E7%BD%AE%E8%87%AA%E5%8A%A8fuckgfw%E8%B7%AF%E7%94%B1%E5%99%A8/)

<del>Ignore the following link</del>
[https://raw.githubusercontent.com/vokins/simpleu/master/hosts](https://raw.githubusercontent.com/vokins/simpleu/master/hosts)
