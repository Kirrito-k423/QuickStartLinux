# 用于监视各IP和端口的流量

https://blog.csdn.net/star1210644725/article/details/109824296

```
iftop -i eth0 -nNB -m 10M
```

按下L显示流量刻度

按下T显示总量

按下t，发送和接受合成一行

按下l, 输入172.17.1.158，筛选指定IP 172.17.1.158

按下p,显示端口

## wget 与ping 走的哪个ip和端口
ping 好像没端口

## 没ifconfig

安装 apt install net-tools