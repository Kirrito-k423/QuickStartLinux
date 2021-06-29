# 网站能够ping通， curl不下来？

```
curl -v www.baidu.com
```
ping是网络层的icmp协议，curl是http，基于tcp的文本协议。没有太大的关联。

可以先检查DNS，再检查端口

nmap -vv -sS IP地址

用nmap检查一下，你的机器80端口是不是开放的。

## check net port
https://www.cnblogs.com/limingluzhu/p/4932476.html
```
netstat -nat | grep <端口号> # 如命令 `netstat -nat | grep 3306`
netstat -nat |grep LISTEN
lsof -n -P -i TCP -s TCP:LISTEN
telnet 127.0.0.1 80
nc  -w 10 -n -z 127.0.0.1 1990-1999

netstat -nat |awk '{print $6}'|sort|uniq -c|sort -rn
netstat -nat | grep "192.168.106.241:1191" |awk '{print $5}'|awk -F: '{print $1}'|sort|uniq -c|sort -nr|head -20
```

## check DNS server
```
cat /etc/resolv.conf
cat /etc/sysconfig/network-scripts/ifcfg-eno4 |grep DNS
nslookup www.baidu.com
```

## firewall
https://www.cnblogs.com/zxg-blog/p/9835263.html
iptables防火墙
```
service iptables status  
```
firewall防火墙
```
systemctl status firewalld
firewall-cmd --state
firewall-cmd --list-all-zones
firewall-cmd --list-all
```
