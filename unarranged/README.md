---
markmap:
  color:
    - blue
  initialExpandLevel: 2
  # other options
---



# Often to Use



## nfs



### Installation

```bash
sudo apt-get update 
sudo apt-get install nfs-kernel-server
```



### exportfs

```bash
sudo vim /etc/exports
/home/ralph/work/test/nfs/shared  *(rw,sync,no_subtree_check,no_root_squash)
sudo chmod -R 777 /home/ralph/work/test/nfs/shared
# or more securely
sudo chown -R nobody:nogroup /home/ralph/work/test/nfs/shared
sudo exportfs -ra
sudo exportfs -v
```



## pstore / ramoops



### persistent_ram (reserved ram) testing



```bash
echo -n 'MARK123' | dd of=/dev/mem bs=1 seek=$((0xb900000)) oflag=seek_bytes
hexdump -C /dev/mem -s $((0xb900000)) -n 16

# read
for i in $(seq 0 28); do
  offset=$((0xb900000 + i * 0x4000))
  echo "== Chunk $i @ 0x$(printf '%x' $offset) =="
  hexdump -C /dev/mem -s $offset -n 4096
done

# write mark 
for i in $(seq 0 28); do
  offset=$((0xb900000 + i * 0x4000))
  echo -n "CHUNK$i" | dd of=/dev/mem bs=1 seek=$offset oflag=seek_bytes
done


```



```bash
== Chunk 24 @ 0xb960000 ==                                                    
0b960000  00 00 00 00 06 00 00 00  06 00 00 00 4d 41 52 4b  |............MARK|
0b960010  31 0a 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |1...............|
0b960020  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*     

echo -n 'MARK1' | dd of=/dev/mem bs=1 seek=$((0xb960000)) oflag=seek_bytes
hexdump -C /dev/mem -s $((0xb960000)) -n 4096


echo -ne "\x44\x42\x47\x43\x06\x00\x00\x00\x00\x00\x00\x00\x00\x06\x00\x00\x41\x4d\x4b\x52\x0a\x31\x00\x00" | hexdump

#################################################################################################


# write mark 
for i in $(seq 0 28); do
  offset=$((0xb900000 + i * 0x4000))
  echo -n "DBGC" | dd of=/dev/mem bs=1 seek=$offset oflag=seek_bytes
done

echo -ne "\x44\x42\x47\x43\x06\x00\x00\x00\x00\x00\x00\x00\x06\x00\x00\x00\x4d\x41\x52\x4b\x31\x0a\x00\x00" | dd of=/dev/mem bs=1 seek=$((0xb970000)) oflag=seek_bytes
hexdump -C /dev/mem -s $((0xb970000)) -n 4096

modprobe ramoops


# write mark 
for i in $(seq 0 28); do
  offset=$((0xb900000 + i * 0x4000))
  echo -ne "DBGC\x49\x00\x00\x00\x49\x00\x00\x00====[  473.650922] wl1.2: dhd_prot_ioctl: status ret value is -43 cmd=263" | dd of=/dev/mem bs=1 seek=$offset oflag=seek_bytes
done

echo -ne "DBGC\x49\x00\x00\x00\x49\x00\x00\x00====[  473.650922] wl1.2: dhd_prot_ioctl: status ret value is -43 cmd=263" | dd of=/dev/mem bs=1 seek=$((0xb970000)) oflag=seek_bytes

#################################################################################################

modprobe ramoops mem_address=0xb900000 mem_size=0x80000 record_size=0x4000 console_size=0x4000 pmsg_size=0x10000

echo -ne "\x44\x42\x47\x43\x06\x00\x00\x00\x00\x00\x00\x00\x06\x00\x00\x00\x4d\x41\x52\x4b\x31\x0a\x00\x00" | dd of=/dev/mem bs=1 seek=$((0xb970000)) oflag=seek_bytes
hexdump -C /dev/mem -s $((0xb970000)) -n 4096
```





```bash
0b900000-0b903fff : persistent_ram
0b904000-0b907fff : persistent_ram
0b908000-0b90bfff : persistent_ram
0b90c000-0b90ffff : persistent_ram
0b910000-0b913fff : persistent_ram
0b914000-0b917fff : persistent_ram
0b918000-0b91bfff : persistent_ram
0b91c000-0b91ffff : persistent_ram
0b920000-0b923fff : persistent_ram
0b924000-0b927fff : persistent_ram
0b928000-0b92bfff : persistent_ram
0b92c000-0b92ffff : persistent_ram
0b930000-0b933fff : persistent_ram
0b934000-0b937fff : persistent_ram
0b938000-0b93bfff : persistent_ram
0b93c000-0b93ffff : persistent_ram
0b940000-0b943fff : persistent_ram
0b944000-0b947fff : persistent_ram
0b948000-0b94bfff : persistent_ram
0b94c000-0b94ffff : persistent_ram
0b950000-0b953fff : persistent_ram
0b954000-0b957fff : persistent_ram
0b958000-0b95bfff : persistent_ram
0b95c000-0b95ffff : persistent_ram
0b960000-0b963fff : persistent_ram
0b964000-0b967fff : persistent_ram
0b968000-0b96bfff : persistent_ram
0b96c000-0b96ffff : persistent_ram
0b970000-0b97ffff : persistent_ram
0d000000-0fcfffff : System RAM    
10000000-1fffffff : System RAM    
```





## Syslogd Notes

```bash
killall -9 syslogd
syslogd -O - -n &
```



## WiFi / Network debug



### Common to use

```bash
iw dev 
iw dev wl0 info
iw phy phy0 info
wpa_cli -i wl1 status
hostapd_cli -i wl0.1 all_sta

hostapd_cli -p /var/run/hostapd-wl0 -i wl0.3 all_sta 
```



```bash
ovsdb-client dump
ovsh s Wifi_VIF_Config
grep -rs we.piranha  /var/run
```



```bash
hostapd -g /var/run/hostapd/global -B -P /var/run/hostapd-global.pid -s
```



```bash
iptables -t filter -A NM_MSS_CLAMP -o eth1 -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu



```



```bash
ovsh s Wifi_VIF_Config -w if_name==wl0.2 wpa_psks if_name
--------------------------------------------
if_name  | wl0.2                           |
wpa_psks | ["map",[["key--1","welcome8"]]] |
--------------------------------------------

ovsh u Wifi_VIF_Config -w if_name==wl0.2 wpa_psks:='["map",[["key--1","welcome8"]]]'
ovsh s Wifi_VIF_Config -w if_name==wl0.2 wpa_psks if_name
```



```bash
mdm setpv Device.X_COMTREND_COM_AppCfg.EnableWatchdog 0
echo i > /proc/sysrq-trigger
```



```bash
strace -f -p $(pidof xm) -s 128 -o /tmp/trace.log &
strace -f -p $(pidof wm) -s 128 -o /tmp/trace2.log &
```





### opensync leaf

```bash
wpa_cli -i wl1 status
```



#### connected info

```bash
bssid=02:90:4c:2c:30:03
freq=2412
ssid=we.backhaul
id=0
id_str=id_0
mode=station
wifi_generation=6
pairwise_cipher=CCMP
group_cipher=CCMP
key_mgmt=WPA2-PSK
wpa_state=COMPLETED
ip_address=169.254.2.223
address=4c:19:5d:d5:63:c2
uuid=69529711-3537-5952-b9af-18f4a2e4371b
```





## dropbear Notes



```bash
dropbear -R -p 3333
```



### Permission Issue

```bash
[16142] Jun 24 02:30:01 User account 'root' is locked
[16142] Jun 24 02:30:06 User account 'root' is locked
[16142] Jun 24 02:30:07 Exit before auth from <192.168.99.90:59672>: (user 'root', 2 fails): Exited normally
```

#### Check /etc/shadow

```bash
ls /etc/shadow
cat /etc/shadow
```





## RPi4 Cheatsheet



### How to reset the USB console cable

```bash
find /sys -name ttyUSB0
cd /sys/class/tty
realpath ttyUSB0
/sys/devices/platform/scb/fd500000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/usb1/1-1/1-1.1/1-1.1:1.0/ttyUSB0/tty/ttyUSB0
cd /sys/devices/platform/scb/fd500000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/usb1
echo 0 > authorized
echo 1 > authorized

```



## OpenSync v6.4 Test



### /etc/inittab reload

```bash
kill -HUP 1
```



### Kill all processes

```bash
mdm setpv Device.X_COMTREND_COM_AppCfg.EnableWatchdog 0
sync
echo i > /proc/sysrq-trigger

```





## Broadcom SDK Notes



### mdm



```bash
mdm getpv Device.Ethernet.Interface.1.Name
mdm getpv Device.Ethernet.Interface.2.Name

mdm getpv Device.X_COMTREND_COM_AppCfg.EnableWatchdog
mdm setpv Device.X_COMTREND_COM_AppCfg.EnableWatchdog 0
sync
killall -9 ssk 

```







## OSRT FRV Notes



### Port Forwarding / UPNP testing



```bash
OSRT1 info: 
MAC: A0:18:42:17:88:6A
wl0: A0:18:42:17:88:6B
wl1: A0:18:42:17:88:6C
client connect -bssid A0:18:42:17:88:6C w1
client connect -bssid A0:18:42:17:88:6C w2

```





### Debug for FRV4.0.0



#### Port Forwarding 

```bash
ovsh i IP_Port_Forward \
protocol:="tcp" \
src_ifname:="eth0" \
src_port:=8080 \
dst_ipaddr:="192.168.1.100" \
dst_port:=80 \
nat_loopback:=true


ovsh i IP_Port_Forward \
protocol:="tcp" \
src_ifname:="eth0" \
src_port:=5469 \
dst_ipaddr:="192.168.40.133" \
dst_port:=5222 \
nat_loopback:=true


ovsh d IP_Port_Forward \
protocol:="tcp" \
src_ifname:="eth0" \
src_port:=5469 \
dst_ipaddr:="192.168.40.133" \
dst_port:=5222 \
nat_loopback:=true


ovsh s IP_Port_Forward
```





#### Opensync log

```bash
ovsh s AW_Debug
ovsh u Connection_Manager_Uplink -w if_name==eth0 has_L3:=true
ovsh U AW_Debug -w name==CM log_severity:=CRIT
ovsh U AW_Debug -w name==SM log_severity:=CRIT
ovsh U AW_Debug -w name==QM log_severity:=CRIT
ovsh U AW_Debug -w name==WM log_severity:=CRIT
ovsh U AW_Debug -w name==SM log_severity:=INFO
ovsh U AW_Debug -w name==NM log_severity:=CRIT
ovsh U AW_Debug -w name==WANO log_severity:=CRIT
ovsh U AW_Debug -w name==OM log_severity:=CRIT
ovsh U AW_Debug -w name==FSM log_severity:=CRIT
ovsh U AW_Debug -w name==NM log_severity:=INFO
ovsh U AW_Debug -w name==NFM log_severity:=INFO
cat /var/log/messages | grep " CM" | tail
```





#### speedtest

```bash
/usr/opensync/bin/ookla --selection-details -fhuman-readable \
      --ca-certificate=/usr/opensync/certs/opensync_ca.pem -c http://www.speedtest.net/api/embed/j3vehztsj2kg9nf9/config
      
# new versiion
/usr/opensync/bin/ookla --interface=eth0 --unit=Mbps --fhuman-readable \
    -c 'http://www.speedtest.net/api/embed/plume/config?serverSideUpload=true&threadnum=4'
```





#### br0 no ipv6 address



```bash
ip -6 addr add fe80::10/64 dev br0
```





### FRV config



```bash
config get --full
```



### Switch

```bash
Port 3: GW WAN  
```



### FRV Command Cheatsheet

#### If something wrong...

```bash
switch recovery
switch up all
server dhcp-reservation
rpower cycle all
```



## consold debug shell mode

```bash
version --debug m5SDM4LKvv
version --debug 23KcykMddk
sh
```



## OVSDB cheatsheet



### Connection_Manager_Uplink 

```bash
ovsh s Connection_Manager_Uplink
ovsh i Connection_Manager_Uplink if_name:='eth0.1' has_L2:='true' has_L3:='true' network_state:='up' priority:=100
ovsh i Connection_Manager_Uplink if_name:='eth0.1' if_type:='eth' has_L2:='true' has_L3:='true' priority:=100
```





## SSH to open local port to connect  remote server



```bash
localPort=8080
remoteServerIP=192.168.2.254
remoteServerPort=80
sshServerLogin=user
sshServerIP=remote_pc
ssh -f -N -L $localPort:$remoteServerIP:$remoteServerPort $sshServerLogin@$sshServerIP
ssh -f -N -L 8080:192.168.1.1:80 nuc
```





# OpenSync v6.4 Notes



## Gateway Offline Inforamtion

```bash
想要 gateway offline 的功能, 請在 target file 中加上 CONFIG_PM_GW_OFFLINE_CFG=y
```





# Broadcom SDK 5.02L.07 Notes



```bash
# generate kernel config
make pre_kernelbuild 
```





# OpenSync Commands Usage



```bash
ovsh s Manager
ovsh s AWLAN_Node
ovsh s Connection_Manager_Uplink

```





# OpenSync Security Notes



## cryptsetup

```bash
# autodetect
dependson: public/libs/popt-1.18 public/libs/lvm2 public/libs/jsonc public/libs/uuid public/libs/openssl
```

```bash
cryptsetup luksOpen --key-file /tmp/keyfile /usr/opensync/certs/luks devluks && mount /dev/mapper/devluks /var/certs
```



## openssl 

```bash
openssl s_client -connect wildfire.plumenet.io:443 -servername wildfire.plumenet.io -CAfile /var/certs/ca.pem -cert /var/certs/client.pem -key /var/certs/client_dec.key -verify_quiet
```





# How to use syslogd to log to stdout



```bash
killall -9 syslogd
# foreground mode
syslogd -n -O -
# background mode
syslogd -O -
```



# Comtrend Device Information

---

## PBL-6201 (NL-3124u_OS / OSP / CTU)

---


### MAC / OpenSync ID

---

```bash
# Comtrend Beta Cloud
ID: 1C6499C256A2
1c:64:99:c2:56:a2
# Comtrend OpenSync Cloud
Original: 
ID: 1C6499C256DE
mac: 1c:64:99:c2:56:de
```

---

### Console debug command for OSP Firmware

---

```bash
> version --debug m5SDM4LKvv
> version --debug 23KcykMddk
> sh
```



# OpenSync speedtest ookla test

```bash
#!/bin/bash
/tmp/ookla --interface=eth0.1 \
    --unit=Mbps -fhuman-readable \
    -c 'http://www.speedtest.net/api/embed/plume/config?serverSideUpload=true&threadnum=4'
```

# [nfs](nfs/index.html)
