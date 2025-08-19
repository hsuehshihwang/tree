---
markmap:
  color:
    - blue
  initialExpandLevel: 2
  # other options
---

# wifi
# [go back](../index.html)
---
# rfkill
## list
- `rfkill`
## unblock
- `rfkill unblock 1 -o SOFT`
---
# iw
## dev
## phy
## ap
## sta
- `sudo iw phy phy0 interface add sta0 type station`
- `sudo iw dev sta0 del`
## monitor
- `sudo iw phy phy0 interface add mon0 type monitor`
- `sudo iw dev mon0 del`
---
# wl
## cli
### vap
- `wl -i wl0 down; wl -i wl0 ssid -C 0 ""`
### country code
- `wl -i wl0 down; wl -i wl0 country US/857`
# [tools](tools/index.html)
## [hostapd](tools/hostapd/index.html)
### [conf](tools/hostapd/conf/index.html)
### [hostapd_cli](tools/hostapd/hostapd_cli/index.html)
## [netns](tools/netns/index.html)
### [monitor](tools/netns/monitor/index.html)
### [AP](tools/netns/AP/index.html)
### [client](tools/netns/client/index.html)
## [wpa_supplicant](tools/wpa_supplicant/index.html)
### [wpa_cli](tools/wpa_supplicant/wpa_cli/index.html)
### [conf](tools/wpa_supplicant/conf/index.html)
## [tcpdump](tools/tcpdump/index.html)
