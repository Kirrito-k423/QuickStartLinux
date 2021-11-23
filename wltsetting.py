# -*- coding: utf-8 -*-
"""
Created on Thu May  5 14:56:19 2016

@author: Venique

支持命令行参数arg:  用户名 密码 出口

p.s：出口号从0开始记
"""
import sys
import http
from http import cookiejar
import urllib

print(sys.argv)
cookie = http.cookiejar.CookieJar()
openner = urllib.request.build_opener(urllib.request.HTTPCookieProcessor(cookie))  

if len(sys.argv)==1:
    name = input("用户名：")
    password = input("密码：")
    outport = input("出口(默认为8,移动出口。)：")
else:
    name = sys.argv[1]
    password = sys.argv[2]
    outport = sys.argv[3]

if outport == "":
    outport = 8

data = {"name":"","password":"","go":"登录账户".encode("gb2312"),"ip":"","url":"URL","cmd":"login"}

web = urllib.request.urlopen("http://wlt.ustc.edu.cn/cgi-bin/ip");
str = web.read().decode("gb2312")

if "非科大IP地址" in str:
    print("非科大IP地址")
else:
    pos = str.find("ip value=")
    str = str[pos+9:]
    ip = str[:str.find(">")]
    
    data["name"] = name
    data["password"] = password
    data["ip"] = ip
    
    data_url = urllib.parse.urlencode(data)
    
    web = openner.open("http://wlt.ustc.edu.cn/cgi-bin/ip",bytes(data_url,'gb2312'))
    
    print("提交登陆申请:",web.status,web.reason)
    
    ss = web.read().decode("gb2312")
    
    if ss.find("用户名不存在") != -1:
        print("用户名不存在")
    elif ss.find("用户名或密码错误") != -1:
        print("用户名或密码错误")
    else:    
        web = openner.open("http://wlt.ustc.edu.cn/cgi-bin/ip")
        web = openner.open(r"http://wlt.ustc.edu.cn/cgi-bin/ip?cmd=set&url=URL&type={0}&exp=0&go=+%BF%AA%CD%A8%CD%F8%C2%E7+".format(outport))
        print("提交设置网络通申请：",web.status,web.reason)

#input("Ruby is so cute!")
