---
markmap:
  color:
    - blue
  initialExpandLevel: 4
  # other options
---

# [go back](../index.html)
# IPv6_RouteAdv
## schema / columns
```bash
ovsdb-client list-columns  IPv6_RouteAdv
Column            Type                                                                    
----------------- ------------------------------------------------------------------------
current_hop_limit {"key":"integer","min":0}                                               
max_adv_interval  {"key":{"maxInteger":1800,"minInteger":4,"type":"integer"},"min":0}     
retrans_timer     {"key":"integer","min":0}                                               
dnssl             {"key":{"maxLength":253,"minLength":1,"type":"string"},"max":16,"min":0}
reachable_time    {"key":{"maxInteger":3600000,"minInteger":0,"type":"integer"},"min":0}  
home_agent        {"key":"boolean","min":0}                                               
default_lifetime  {"key":{"maxInteger":65535,"minInteger":0,"type":"integer"},"min":0}    
_uuid             "uuid"                                                                  
interface         {"key":{"refTable":"IP_Interface","type":"uuid"}}                       
_version          "uuid"                                                                  
managed           {"key":"boolean","min":0}                                               
prefixes          {"key":{"refTable":"IPv6_Prefix","type":"uuid"},"max":64,"min":0}       
preferred_router  {"key":{"enum":["set",["high","low","medium"]],"type":"string"}}        
mtu               {"key":{"minInteger":1280,"type":"integer"},"min":0}                    
other_config      {"key":"boolean","min":0}                                               
status            {"key":{"enum":["set",["disabled","enabled","error"]],"type":"string"}} 
rdnss             {"key":{"refTable":"IPv6_Address","type":"uuid"},"max":16,"min":0}      
min_adv_interval  {"key":{"maxInteger":1350,"minInteger":3,"type":"integer"},"min":0}     
```
## test samples
```bash
ovsh u IPv6_RouteAdv \
  -w if_name==br-home \
  enable:=true \
  managed:=false other_config:=false \
  prefixes:='["2001:db8:1::/64"]' \
  min_interval:=200 max_interval:=600 router_lifetime:=1800 \
  rdnss:='["2001:4860:4860::8888","2001:4860:4860::8844"]' \
  dnssl:='["lan.example"]'
```
```bash
ovsh i IPv6_RouteAdv \if_name:=br-home \
  if_name:=br0 \
  managed:=false \
  other_config:=false \
  prefixes:='["2001:db8:1::/64"]' \
  rdnss:='["2001:4860:4860::8888","2001:4860:4860::8844"]' \
  dnssl:='["lan.example"]' \
  min_interval:=200 \
  max_interval:=600 \
  router_lifetime:=1800

```
