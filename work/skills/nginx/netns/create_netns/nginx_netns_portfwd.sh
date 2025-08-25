#!/bin/bash

# include variables
. nginx_netns_vars

#echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward
sudo sysctl -w net.ipv4.ip_forward=1

# NAT: DNAT inbound to the namespace IP
sudo iptables -t nat -D PREROUTING -p tcp --dport 80 -j DNAT --to-destination $NS_IP:80
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination $NS_IP:80

# Allow forwarding between host veth and ns veth
sudo iptables -D FORWARD -p tcp -d $NS_IP --dport 80 -j ACCEPT
sudo iptables -D FORWARD -p tcp -s $NS_IP --sport 80 -j ACCEPT
sudo iptables -A FORWARD -p tcp -d $NS_IP --dport 80 -j ACCEPT
sudo iptables -A FORWARD -p tcp -s $NS_IP --sport 80 -j ACCEPT

# (Optional but helpful) SNAT so replies go back cleanly via host veth
sudo iptables -t nat -D POSTROUTING -p tcp -d $NS_IP --dport 80 -j SNAT --to-source $HOST_IP
sudo iptables -t nat -A POSTROUTING -p tcp -d $NS_IP --dport 80 -j SNAT --to-source $HOST_IP

