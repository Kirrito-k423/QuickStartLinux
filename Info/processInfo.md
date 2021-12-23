# processInfo

```
pidof firefox
ps aux | grep -i firefox
pgrep firefox
```

## 查看可执行文件路径
```
top 得知 PID
$ sudo ps 2278618
    PID TTY      STAT   TIME COMMAND
2278618 pts/29   Rl+  8420:06 ./d2

sudo ls -l  /proc/2278618
```
其中

cwd符号链接的是进程运行目录；

exe符号连接就是执行程序的绝对路径；

cmdline就是程序运行时输入的命令行命令；

environ记录了进程运行时的环境变量；

fd目录下是进程打开或使用的文件的符号连接。

## kill 正则表达时 MPI

ps aux | grep apache | awk '{print $2}' | xargs kill -9 # 列出 PID 並砍掉 Process

https://blog.longwin.com.tw/2012/06/linux-kill-process-by-name-2012/
