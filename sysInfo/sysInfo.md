# sysInfo

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

## PCIE

### 2/3/4
```
$ lspci -vv | grep -E 'PCI bridge|LnkCap'
00:1c.0 PCI bridge: Intel Corporation C620 Series Chipset Family PCI Express Root Port #1 (rev f9) (prog-if 00 [Normal decode])
00:1c.5 PCI bridge: Intel Corporation C620 Series Chipset Family PCI Express Root Port #6 (rev f9) (prog-if 00 [Normal decode])
02:00.0 PCI bridge: ASPEED Technology, Inc. AST1150 PCI-to-PCI Bridge (rev 04) (prog-if 00 [Normal decode])
17:00.0 PCI bridge: Intel Corporation Sky Lake-E PCI Express Root Port A (rev 04) (prog-if 00 [Normal decode])
3a:00.0 PCI bridge: Intel Corporation Sky Lake-E PCI Express Root Port A (rev 04) (prog-if 00 [Normal decode])
3b:00.0 PCI bridge: PLX Technology, Inc. PEX 8747 48-Lane, 5-Port PCI Express Gen 3 (8.0 GT/s) Switch (rev ca) (prog-if 00 [Normal decode])
3c:08.0 PCI bridge: PLX Technology, Inc. PEX 8747 48-Lane, 5-Port PCI Express Gen 3 (8.0 GT/s) Switch (rev ca) (prog-if 00 [Normal decode])
3c:10.0 PCI bridge: PLX Technology, Inc. PEX 8747 48-Lane, 5-Port PCI Express Gen 3 (8.0 GT/s) Switch (rev ca) (prog-if 00 [Normal decode])
5d:02.0 PCI bridge: Intel Corporation Sky Lake-E PCI Express Root Port C (rev 04) (prog-if 00 [Normal decode])
5e:00.0 PCI bridge: Intel Corporation Device 37c0 (rev 09) (prog-if 00 [Normal decode])
5f:03.0 PCI bridge: Intel Corporation Device 37c5 (rev 09) (prog-if 00 [Normal decode])
85:00.0 PCI bridge: Intel Corporation Sky Lake-E PCI Express Root Port A (rev 04) (prog-if 00 [Normal decode])
ae:00.0 PCI bridge: Intel Corporation Sky Lake-E PCI Express Root Port A (rev 04) (prog-if 00 [Normal decode])
d7:00.0 PCI bridge: Intel Corporation Sky Lake-E PCI Express Root Port A (rev 04) (prog-if 00 [Normal decode])
d7:01.0 PCI bridge: Intel Corporation Sky Lake-E PCI Express Root Port B (rev 04) (prog-if 00 [Normal decode])
```
```
$ sudo dmidecode | grep "PCI"
                PCI is supported
        Descriptor 9: PCI parity error
        Descriptor 10: PCI system error
        Designation: CPU2 Slot1 PCI-E 3.0 X16
        Type: x16 PCI Express 3 x16
        Designation: CPU2 Slot2 PCI-E 3.0 X16
        Type: x16 PCI Express 3 x16
        Designation: CPU2 Slot3 PCI-E 3.0 X16
        Type: x16 PCI Express 3 x16
        Designation: CPU2 Slot4 PCI-E 3.0 X16
        Type: x16 PCI Express 3 x16
        Designation: CPU2 Slot5 PCI-E 3.0 X8
        Type: x8 PCI Express 3 x8
        Designation: CPU1 Slot6 PCI-E 3.0 X8
        Type: x8 PCI Express 3 x8
        Designation: PCH Slot7 PCI-E 3.0 X4
        Type: x8 PCI Express 3 x8
        Designation: CPU1 Slot8 PCI-E 3.0 X16
        Type: x16 PCI Express 3 x16
        Designation: CPU1 Slot9 PCI-E 3.0 X16
        Type: x16 PCI Express 3 x16
        Designation: CPU1 Slot10 PCI-E 3.0 X16
        Type: x16 PCI Express 3 x16
        Designation: CPU1 Slot11 PCI-E 3.0 X16
        Type: x16 PCI Express 3 x16
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