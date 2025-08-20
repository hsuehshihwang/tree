---
markmap:
  color:
    - blue
  initialExpandLevel: 4
  # other options
---

# [go back](../index.html)
# opensync
---
# ovsh
## show
### simple
- `ovsh s Manager`
### filter rows
- `ovsh s Manager is_connected`
- `ovsh s Manager is_connected status`
### get value
- `ovsh s Manager is_connected status -r`
### json
- `ovsh s Manager is_connected -j`
### filter name and value
- `ovsh s Manager -w is_connected==true is_connected status`
## update
## Manager
## AWLAN_Nodes
## Netfilters
## IPv4_Neighbors
---
# opensync v6.4
---
# FRV 4.0.0
## cloud
### bssid
- `cloud home-bssids-get`
  - Get 2.4G / 5G bssid: mac address form
## client
### connect
- wifi 
  - `client connect --bssid <gw_node_bssid> w1`
- eth
  - `client eth-connect l1 e2`
### ssh
- `client ssh w1`
- `client ssh e2`
## test case
### case id: 2451393 (upnp)
#### w1 connect to home-ap
- w1 connect to gw
  - `cloud home-bssids-get`
  - `client connect --bssid <gw_node_bssid> w1`
- e2 connect to l1
  - `client eth-connect l1 e2`
- e2 send upnp port forward
  - `client ssh e2`
    - `ip -4 -br a`
    - `upnpc -a <client_e2_ip> 5469 5469 TCP`
    - `upnpc -a <client_e2_ip> 5469 5469 UDP`
### case id: 2476779 (upnp)
---
# OSRT
# osrt1
## env
- IP: `192.168.188.101`
## config/locations
- PBL-6201_OSRT1_DEV.yaml
## config/model_properties
