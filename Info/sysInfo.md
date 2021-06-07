# sysInfo
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
```

### L2/ L3 cache
```
lstopo-no-graphics
```
## memory
```
cat /proc/meminfo
```

## architecture
```
uname -a
```
### how to check linux is centos or ubuntu
Ubuntu
```
cat /etc/version
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

## Disk

### Hard drive capacity
```
df -h
du -h --max-depth=1
sudo fdisk -l
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
where ROTA means rotational device
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



