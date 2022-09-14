# userInfo

## List Usernames using awk
```
cat /etc/passwd
cat /etc/passwd | awk -F: '{print $1}'
```

## current user in which group
```
# shaojiemike @ node5 in ~ [20:25:31]
$ id
用户id=1011(shaojiemike) 组id=1012(shaojiemike) 组=1012(shaojiemike),27(sudo)

$ groups shaojiemike
shaojiemike : acsastaff sudo
```

## 查看sudo权限
### sudoers
```
$ sudo cat /etc/sudoers
#
# This file MUST be edited with the 'visudo' command as root.
#
# Please consider adding local content in /etc/sudoers.d/ instead of
# directly modifying this file.
#
# See the man page for details on how to write a sudoers file.
#
Defaults        env_reset
Defaults        mail_badpass
Defaults        secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"

# Host alias specification

# User alias specification

# Cmnd alias specification

# User privilege specification
root    ALL=(ALL:ALL) ALL

# Members of the admin group may gain root privileges
%admin ALL=(ALL) ALL

# Allow members of group sudo to execute any command
%sudo   ALL=(ALL:ALL) NOPASSWD:ALL
chivier ALL=(ALL:ALL) NOPASSWD:ALL
zhenwei ALL=(ALL:ALL) NOPASSWD:ALL
# See sudoers(5) for more information on "#include" directives:

#includedir /etc/sudoers.d
```
### sudo组继承权限
```
# shaojiemike @ node5 in ~ [20:25:26]
$ cat /etc/group|grep super
sudo:x:27:user,chivier,zbw,zyy,pac2020,dnailz,ibug,rabbit,monsoon,oroggs,shaojiemike,supertan,micheallei,wyt2000,blankpower,libreliu,pac21,yfy,qcjiang
supertan:x:1013:
```

## 查看用户创建日期(以 oroggs为例)
### 查看上次密码修改时间 
```
$ sudo chage --list oroggs
Last password change                                    : 11月 21, 2020
Password expires                                        : never
Password inactive                                       : never
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
```

### 查看bash_logout
```
$ stat /home/oroggs/.bash_logout
  File: /home/oroggs/.bash_logout
  Size: 220             Blocks: 8          IO Block: 4096   regular file
Device: 802h/2050d      Inode: 17303550    Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1002/  oroggs)   Gid: ( 1002/  oroggs)
Access: 2021-08-05 15:15:18.710925595 +0000
Modify: 2020-02-02 14:46:42.390274014 +0000
Change: 2020-02-02 14:46:42.390274014 +0000
 Birth: -
```

### linux即时聊天
```
A> w |grep ud
udfrt    pts/26   202.141.183.48   11:20    8:16   0.16s  0.16s -zsh
A> tty
/dev/pts/30
A> write udfrt pts/26
Are you online? You can use "write A pts/30" to talk with me.

May I ask who I am talking to? What's your WeiXin number?
```
```
sudo apt-get install ytalk # 是两窗口的
ytalk supertan
```
