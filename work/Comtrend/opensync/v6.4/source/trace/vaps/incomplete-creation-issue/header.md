---
markmap:
  color:
    - blue
  initialExpandLevel: 100
  # other options
---

# [go back](../index.html)
# unarranged
## related files
- ./src/platform/bcm/src/lib/bcmwl/src/bcmwl_vap.c
## patches
```c
    if (WARN_ON(!WL(phy, "ssid", "-C", strfmta("%d", idx), "")))
        return false;
    sleep(1);  // <------- add delay
    if (WARN_ON(!WL(vif, "ap", "1")))
        return false;
```

