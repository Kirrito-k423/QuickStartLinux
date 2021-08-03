# sysChange

## CPU Overclocking

## GPU Overclocking /frequency reduction

## Mem Overclocking

## Fans speed control

## Power 3000kw Limits

## 修改文件访问修改创建时间
```
touch -m -d "2018-05-20 08:00:00" install.log # 只变更文件的修改时间
touch -a -d "2017-05-10 09:00:00" install.log # 只变更文件的访问时间
touch -acmr anaconda-ks.cfg  install.log # 将一个文件的时间修改为同另一个文件的时间相同# 将install.log文件的时间修改成和anaconda-ks.cfg
touch -d "3 days ago" install.log;ls -l install.log # 另外touch 还支持像date 命令一样的参数修改文件时间

touch 参数
-a ： 仅修改access time

-c  ：仅修改时间，而不建立文件

-d  ：后面可以接日期，也可以使用 --date="日期或时间"　

-m ：仅修改mtime
```