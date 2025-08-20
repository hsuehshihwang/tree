---
markmap:
  color:
    - blue
  initialExpandLevel: 2
  # other options
---

# [go back](../index.html)
# wifi
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
## [iw](tools/iw/index.html)
### [phy](tools/iw/phy/index.html)
### [dev](tools/iw/dev/index.html)
## [tcpdump](tools/tcpdump/index.html)
# [mac80211_hwsim](mac80211_hwsim/index.html)
## [wpa2](mac80211_hwsim/wpa2/index.html)
# [ssh_tcpdump_wireshark](ssh_tcpdump_wireshark/index.html)
## [scripts](ssh_tcpdump_wireshark/scripts/index.html)
### [macos](ssh_tcpdump_wireshark/scripts/macos/index.html)
### [ubuntu](ssh_tcpdump_wireshark/scripts/ubuntu/index.html)
