# vpn

# clash for linux

http://xuekaiwen.com.cn/index.php/archives/25/
## download tar
```
wget https://github.com/Dreamacro/clash/releases/download/v1.6.0/clash-linux-amd64-v1.6.0.gz
gzip -d clash-linux-amd64-v1.6.0.gz
chmod +x clash-linux-amd64-v1.6.0
./clash-linux-amd64-v1.6.0
```

## config file
第一次运行clash 会创建~/.config/clash 文件夹，以及其中的两个文件config.yaml 和 Country.mmdb，Country.mmdb不用管，config.yaml 是我们需要修改的配置文件，默认下载下来的config.yaml没用，需要通过wget 或 curl 从订阅地址处获取配置文件
```
mkdir ~/install/clash
mv clash-linux-amd64-v1.6.0 clash
rm ~/.config/clash/config.yaml 
wget --no-check-certificate -O ~/.config/clash/config.yaml https://dogess.app/link/Wck6HIGAybK1sLFR?clash=1
```

## proxy function
```
 #YJH proxy
 export proxy_addr=localhost
 export proxy_http_port=7890 #下载的配置文件的端口
 export proxy_socks_port=7890
 function set_proxy() {
     export http_proxy=http://$proxy_addr:$proxy_http_port
     export https_proxy=http://$proxy_addr:$proxy_http_port
     export all_proxy=socks5://$proxy_addr:$proxy_socks_port
     }
 function unset_proxy() {
         unset http_proxy
         unset https_proxy
         unset all_proxy
 }
 function test_proxy() {
     curl -v https://www.google.com 2>&1 | egrep 'HTTP/(2|1.1) 200'
     }
     # set_proxy # 如果要登陆时默认启用代理则取消注释这句
```

## start proxy
```
set_proxy
test_proxy
```

# 使用clash为局域网内所有设备添加网络代理

https://zhuanlan.zhihu.com/p/169524202



