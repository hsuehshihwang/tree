---
markmap:
  color:
    - blue
  initialExpandLevel: 5
  # other options
---

# [go back](../index.html)
# case id: 2476779
## status
- failed
## description
- `w1 <-> gw`
- `l1 <-> gw`
- `e2 <-> l1`
- `e2 sends upnp`
## test steps
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
- check status
  - `ssh leaf1`
    - `wpa_cli -i wl0 status`
# [steps](steps/index.html)
## [003-e2-send-upnp-port-forward](steps/003-e2-send-upnp-port-forward/index.html)
## [004-check-status](steps/004-check-status/index.html)
## [001-w1-connect-to-gw](steps/001-w1-connect-to-gw/index.html)
## [002-e2-connect-to-l1](steps/002-e2-connect-to-l1/index.html)
