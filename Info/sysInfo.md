# sysInfo
```
neofetch
```
```
lspci command : List all PCI devices.
lshw command : List all hardware.
dmidecode command : List all hardware data from BIOS.
ifconfig command : Outdated network config utility.
ip command : Recommended new network config utility.
```
## cpu 

### cpu type
```
cat /proc/cpuinfo
lscpu
cat /proc/cpuinfo |grep MHz|uniq //查看频率
```
[stack](https://unix.stackexchange.com/questions/468766/understanding-output-of-lscpu)
“CPU(s): 56” represents the number of logical cores, which equals “Thread(s) per core” × “Core(s) per socket” × “Socket(s)”.

 One socket is one physical CPU package (which occupies one socket on the motherboard); 
 
 each socket hosts a number of physical cores, and each core can run one or more threads. 
 
 In your case, you have two sockets, each containing a 14-core Xeon E5-2690 v4 CPU, and since that supports hyper-threading with two threads, each core can run two threads.

“NUMA node” represents the memory architecture; “NUMA” stands for “non-uniform memory architecture”. In your system, each socket is attached to certain DIMM slots, and each physical CPU package contains a memory controller which handles part of the total RAM. As a result, not all physical memory is equally accessible from all CPUs: one physical CPU can directly access the memory it controls, but has to go through the other physical CPU to access the rest of memory. In your system, logical cores 0–13 and 28–41 are in one NUMA node, the rest in the other. So yes, one NUMA node equals one socket, at least in typical multi-socket Xeon systems.

`Stepping`It is a version number. The processor design is tweaked or fixed over the course of the product lifetime, and the stepping number identifies how old (or new) it is.
### cpu temperature 温度
```
sudo apt-get install lm-sensors hddtemp
sensors
```
### L2/ L3 cache
```
lstopo-no-graphics
sudo dmidecode -t cache
getconf -a | grep CACHE #是字节
```
## memory
```
cat /proc/meminfo
free -h
```

## architecture
```
uname -a
```
### how to check linux is centos or ubuntu
Ubuntu
```
cat /etc/version
lsb_release -a
```
CentOS
```
cat /etc/issue
```
```
Use /etc/os-release
awk -F= '/^NAME/{print $2}' /etc/os-release

Use the lsb_release tools if available
lsb_release -d | awk -F"\t" '{print $2}'
```
## PCIE

### 2/3/4
```
$ lspci -vv | grep -E 'PCI bridge|LnkCap'
00:1c.0 PCI bridge: Intel Corporation C620 Series Chipset Family PCI Express Root Port #1 (rev f9) (prog-if 00 [Normal decode])
02:00.0 PCI bridge: ASPEED Technology, Inc. AST1150 PCI-to-PCI Bridge (rev 04) (prog-if 00 [Normal decode])
17:00.0 PCI bridge: Intel Corporation Sky Lake-E PCI Express Root Port A (rev 04) (prog-if 00 [Normal decode])
3c:10.0 PCI bridge: PLX Technology, Inc. PEX 8747 48-Lane, 5-Port PCI Express Gen 3 (8.0 GT/s) Switch (rev ca) (prog-if 00 [Normal decode])
5e:00.0 PCI bridge: Intel Corporation Device 37c0 (rev 09) (prog-if 00 [Normal decode])
```
```
$ sudo dmidecode | grep "PCI"
                PCI is supported
        Descriptor 9: PCI parity error
        Designation: CPU2 Slot4 PCI-E 3.0 X16
        Type: x16 PCI Express 3 x16
        Designation: CPU2 Slot5 PCI-E 3.0 X8
        Type: x8 PCI Express 3 x8
```

### PCI device
```
lspci
```
## GPU
```
nvidai-smi
sudo lshw -numeric -C display
lspci -vnn | grep nvidia -A 12
```

## InfiniBand / IB
```
ibstat

> ibv_devinfo
hca_id: mlx5_0
        transport:                      InfiniBand (0)
        fw_ver:                         16.25.6000
        node_guid:                      ec0d:9a03:008b:fa8c
        sys_image_guid:                 ec0d:9a03:008b:fa8c
        vendor_id:                      0x02c9
        vendor_part_id:                 4119
        hw_ver:                         0x0
        board_id:                       LNV0000000007
        phys_port_cnt:                  1
        Device ports:
                port:   1
                        state:                  PORT_ACTIVE (4)
                        max_mtu:                4096 (5)
                        active_mtu:             4096 (5)
                        sm_lid:                 1
                        port_lid:               52
                        port_lmc:               0x00
                        link_layer:             InfiniBand
```

## Linux core version
```
cat /proc/version
Linux version 4.15.0-139-generic (buildd@lgw01-amd64-035) (gcc version 7.5.0 (Ubuntu 7.5.0-3ubuntu1~18.04)) #143-Ubuntu SMP Tue Mar 16 01:30:17 UTC 2021
```

## io speed
https://www.cnblogs.com/xiangsikai/p/8305030.html

## Disk

### disk speed

```
apt install hdparm
sudo hdparm -Tt /dev/sda
```


### Hard drive capacity
```
df -h
du -h --max-depth=1
du -h --max-depth=1|awk '$1 ~ /[0-9]*G/ {print $1,$2}'|sort -n -r
sudo fdisk -l
$ df -h /
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda2       880G  672G  164G  81% /
```

### disk quota
```
quota
lfs quota -uh sca3173 ~ # Beijing cluster
diskUsage 3 hours 统计一次
```
### file nums
```
for D in *; do echo $D; find $D -type f| wc -l; done
```

### 磁盘挂载时间
```
sudo tune2fs -l /dev/sda5
```

### Hard drive / SSD
```
cat /sys/block/sda/queue/rotational
```
You should get 1 for hard disks and 0 for a SSD.
```
$ lsblk
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
loop0    7:0    0   99M  1 loop /snap/core/11081
loop2    7:2    0 99.2M  1 loop /snap/core/10958
sda      8:0    0  1.1T  0 disk
├─sda1   8:1    0  512M  0 part /boot/efi
└─sda2   8:2    0  1.1T  0 part /
```
where RO(ROTA) means rotational device (0代表false=HDD，1代表true=SSD)。可见该盘是机械硬盘。

获取磁盘是否可翻转（rotational）即可知道了，可以翻转就是HDD，反之，不可翻转就属于SSD了
```
ubuntu@ubuntu:/dev$ cat /sys/block/sda/queue/rotational
0
ubuntu@ubuntu:/dev$ cat /sys/block/sdb/queue/rotational
1
```

上面的sda,代表第一块SCSI disk。同理第二块第三块SCSI disk叫做sdb,sdc。

sda1, sda2是sda这块磁盘的第一和二块分区。

对于老的IDE/ATA-1 drives盘叫做 hda (and hdb, hdc, etc.)

### USB 判断
一般U盘会被LINUX认为SCSI设备,如果有SCSI设备那么U盘一般是最后一个SCSI设备. 
```
ubuntu@ubuntu:/dev$ udevadm info --query=all --name=sdc1 | grep -iE "ID_FS_TYPE|USB|BUS|scsi|vfat|fat32"
P: /devices/pci0000:00/0000:00:14.0/usb2/2-4/2-4:1.0/host14/target14:0:0/14:0:0:0/block/sdc/sdc1
S: disk/by-id/usb-Netac_OnlyDisk_3035308571996406-0:0-part1
S: disk/by-path/pci-0000:00:14.0-usb-0:4:1.0-scsi-0:0:0:0-part1
E: DEVLINKS=/dev/disk/by-label/UBUNTU\x2018_0 /dev/disk/by-partuuid/010502f2-d31d-4129-aede-922e0984998e /dev/disk/by-partlabel/Main\x20Data\x20Partition /dev/disk/by-path/pci-0000:00:14.0-usb-0:4:1.0-scsi-0:0:0:0-part1 /dev/disk/by-id/usb-Netac_OnlyDisk_3035308571996406-0:0-part1 /dev/disk/by-uuid/6859-B039
E: DEVPATH=/devices/pci0000:00/0000:00:14.0/usb2/2-4/2-4:1.0/host14/target14:0:0/14:0:0:0/block/sdc/sdc1
E: ID_BUS=usb
E: ID_FS_TYPE=vfat
E: ID_FS_VERSION=FAT32
E: ID_PATH=pci-0000:00:14.0-usb-0:4:1.0-scsi-0:0:0:0
E: ID_PATH_TAG=pci-0000_00_14_0-usb-0_4_1_0-scsi-0_0_0_0
E: ID_USB_DRIVER=usb-storage
E: ID_USB_INTERFACES=:080650:
E: ID_USB_INTERFACE_NUM=00

ubuntu@ubuntu:/dev$ udevadm info --query=all --name=sdb1 | grep -iE "ID_FS_TYPE|USB|BUS|scsi|vfat|fat32"
E: ID_BUS=ata
E: ID_FS_TYPE=ext4
```
removable为1那就是U盘，为0就不属于U盘了。
```
ubuntu@ubuntu:/dev$ cat /sys/block/sda/removable
0
ubuntu@ubuntu:/dev$ cat /sys/block/sdc/removable
1
```


## Network card
```
# lspci | egrep -i ‘network|ethernet’ (Lists PCI network devices in the system)

# lshw -class network (Lists network interfaces)

# cat /proc/net/dev (Shows network device status information)
```
### IP
```
hostname -I | awk '{print $1}'
nmcli -p device show
ip a |less
ifconfig
ip route | grep default
```
## Motherboard model
```
$ sudo dmidecode -t 2
# dmidecode 3.2
Getting SMBIOS data from sysfs.
SMBIOS 3.1.1 present.

Handle 0x0002, DMI type 2, 15 bytes
Base Board Information
        Manufacturer: Supermicro
        Product Name: X11DPG-OT-CPU
        Version: 1.00
        Serial Number: VM183S036911
        Asset Tag: Default string
        Features:
                Board is a hosting board
                Board is replaceable
        Location In Chassis: Default string
        Chassis Handle: 0x0003
        Type: Motherboard
        Contained Object Handles: 0
```

## Fans
```
sudo apt-get install lm-sensors
sudo sensors-detect # set config
sensors
```
### Fan Speed
```
sensors | grep -i fan

This will output fan speed

or install psensor using:

sudo apt-get install psensor
One can also use hardinfo

sudo apt-get install hardinfo
```
## Power / battery 
```
sudo apt-get install gnome-power-manager
upower -monitor-detail
```

```
sudo apt-get install acpi

$ git clone https://github.com/Juve45/batstat.git
$ cd batstat/bin/
$ sudo cp batstat /usr/local/bin/
$ sudo chmod +x /usr/local/bin/batstat

batstat
```

## 查看系统开机重启历史及原因
```
uptime -s
who -b
who -r
last reboot
last -F
sudo less /var/log/massage 或者 /var/log/syslog
# shaojiemike @ snode6 in ~ [7:23:17]
$ last -x|grep generi
runlevel (to lvl 3)   5.4.0-128-generi Wed Oct 19 03:00   still running
reboot   system boot  5.4.0-128-generi Wed Oct 19 02:58   still running
runlevel (to lvl 3)   5.4.0-128-generi Mon Oct 10 16:10 - 03:00 (8+10:49)
reboot   system boot  5.4.0-128-generi Mon Oct 10 16:08   still running
shutdown system down  5.4.0-107-generi Mon Oct 10 16:06 - 16:08  (00:01)
```

安装lastcomm来查看最后的指令,可以查看用户和terminal的命令
```
apt-get install acct
```

### 查看systemd journal
下面判断是否开启
```
# shaojiemike @ snode6 in ~ [7:34:17]
$ ls /var/log/journal
425611be53af4a899bc0f238fd7848bb

# shaojiemike @ snode6 in ~ [7:35:55]
$ journalctl --list-boots
Hint: You are currently not seeing messages from other users and the system.
      Users in groups 'adm', 'systemd-journal' can see all messages.
      Pass -q to turn off this notice.
-8 f16af93f830841ff8d21709c4cc7e941 Fri 2022-08-05 11:03:53 UTC—Fri 2022-08-12 06:25:57 UTC
-7 595fd39b8721481f90dc054976f3317a Mon 2022-08-15 05:33:40 UTC—Tue 2022-08-16 10:54:00 UTC
-6 2a5dffb9d6f1422ba4a4c48c020a25ef Tue 2022-08-16 11:00:57 UTC—Wed 2022-08-17 14:41:38 UTC
-5 cdcedf349d1547baa953c06381e50402 Wed 2022-08-17 15:10:32 UTC—Thu 2022-09-15 06:28:33 UTC
-4 6a91b63ea2654554ace92be2a2b0c6c9 Tue 2022-09-20 08:48:38 UTC—Fri 2022-10-07 10:34:57 UTC
-3 b85a79afd1074c818098e2c38b80dc31 Fri 2022-10-07 10:38:52 UTC—Fri 2022-10-07 15:30:24 UTC
-2 bdf1456c96f24f3db940e8c83da10f2a Sun 2022-10-09 11:39:53 UTC—Mon 2022-10-10 16:06:35 UTC
-1 e7b27e2353744f6e974aa78c1f5dfa97 Thu 2022-10-13 07:52:27 UTC—Wed 2022-10-19 02:47:10 UTC
 0 3e40684f9cb147119c9cdfb1bee15624 Wed 2022-10-19 03:58:07 UTC—Wed 2022-10-19 06:28:24 UTC
```
未开启，开启的办法
```
$ sudo mkdir /var/log/journal
$ sudo systemd-tmpfiles --create --prefix /var/log/journal 2>/dev/null
$ sudo systemctl -s SIGUSR1 kill systemd-journald
```
或者修改 `/etc/systemd/journald.conf`

```
$ journalctl -b -1 -n
```

### 判断是不是正常重启
When an unexpected **power off or hardware failure** occurs the filesystems will not be properly **unmounted** so in the next boot you may get logs like this:
```
EXT4-fs ... INFO: recovery required ... 
Starting XFS recovery filesystem ...
systemd-fsck: ... recovering journal
systemd-journald: File /var/log/journal/.../system.journal corrupted or uncleanly shut down, renaming and replacing.
```
When the system powers off because user **pressed the power button** you get logs like this:
```
systemd-logind: Power key pressed.
systemd-logind: Powering Off...
systemd-logind: System is powering down.
```