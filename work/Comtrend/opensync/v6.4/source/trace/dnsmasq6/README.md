---
markmap:
  color:
    - blue
  initialExpandLevel: 4
  # other options
---

# [go back](../index.html)
# dnsmasq6
# trace dnsmasq6.conf
- dnsmasq6.conf 
  - `enable-ra`
    - `dnsmasq6_server_write_config()`
       - `dnsmasq6_server_apply_ev()`
- `dnsmasq6_server_apply_ev()`
  - `cs f e dnsmasq6_server_apply_ev`
  - `dnsmasq6_server_global_apply()`
    - `cs f e dnsmasq6_server_global_apply`
    - `...`
    - `dnsmasq6_radv_apply()`
      - `osn_ip6_radv_apply()`
- `osn_ip6_radv_apply()`
   - `inet_base_radv_commit()`
     - `inet_base_service_commit()` 
       - INET_BASE_RADV
         - `cs f e INET_BASE_RADV`
           - `inet_base_radv()`
           - `inet_base_radv_prefix()`
           - `...`
- `inet_base_radv_prefix()`
  - `cs f e inet_base_radv_prefix`
    - `inet_base_init()`
      - `self->inet.in_radv_prefix_fn`
        - `cs f e in_radv_prefix_fn`
          `inet_radv_prefix()`
- `inet_radv_prefix()`
  - `cs f e inet_radv_prefix`
    - `nm2_ipv6_routeadv_prefixes_update()`
      - `nm2_ipv6_routeadv_get()`
        - `callback_IPv6_RouteAdv()`
- `cs f e OVSDB_TABLE_MONITOR.*IPv6`
  - `nm2_ipv6_routeadv_init()`
    - `OVSDB_TABLE_MONITOR(IPv6_RouteAdv, false);`

# [ovsh](ovsh/index.html)
## [IPv6_RouteAdv](ovsh/IPv6_RouteAdv/index.html)
# [conf](conf/index.html)
## [sample](conf/sample/index.html)
# [enable-ra](enable-ra/index.html)
