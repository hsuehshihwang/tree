---
markmap:
  color:
    - blue
  initialExpandLevel: 4
  # other options
---

# [go back](../index.html)
# odhcp6c.sh
## path
- `/usr/opensync/bin/odhcp6c.sh`
  - original SDK iproute2 not expires not supported
    - versions
      - iproute2-4.3.0: not supported
      - iproute2-6.16.0: supported
    - problem sample line in odhc6c.sh
      - `ip6route_replace unreachable "$addr" proto ra expires "$valid"`

