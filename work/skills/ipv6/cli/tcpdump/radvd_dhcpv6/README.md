---
markmap:
  color:
    - blue
  initialExpandLevel: 4
  # other options
---

# [go back](../index.html)
# icmpv6 RA and dhcpv6
```bash
tcpdump -i eth0 -n "(icmp6 and ip6[40] == 134) or (udp port 546 or udp port 547)"

```
