---
markmap:
  color:
    - blue
  initialExpandLevel: 4
  # other options
---

# [go back](../index.html)
# dnsmasq6.conf sample
```bash
# Enable IPv6 RA
enable-ra

# Define DHCPv6 range (addresses given out)
dhcp-range=::100,::1ff,constructor:br-lan,64,12h

# OR use stateless (RA gives prefix, clients use SLAAC)
dhcp-range=::,constructor:br-lan,ra-stateless,12h

# Advertise DNS servers via RA
ra-param=br-lan,0,0   # (managed=0, other=0) for SLAAC only
# Options:
#   first "0" = Managed Address Config flag (M bit)
#   second "0" = Other Config flag (O bit)

# Send RDNSS (DNS info in RA)
ra-names
```
