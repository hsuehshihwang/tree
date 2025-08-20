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
