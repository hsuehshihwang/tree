#!/bin/bash

# names
. nginx_netns_vars

# remove netns
sudo ip netns del $NS

# create netns
sudo ip netns add $NS
sudo ip -n $NS link set lo up

# veth pair
sudo ip link add $HOST_IF type veth peer name $NS_IF
sudo ip link set $NS_IF netns $NS

# address & bring up
sudo ip addr add $HOST_IP/$HOST_MASK dev $HOST_IF
sudo ip link set $HOST_IF up
sudo ip -n $NS addr add $NS_IP/$NS_MASK dev $NS_IF
sudo ip -n $NS link set $NS_IF up

# default route inside namespace (via host-side veth)
sudo ip -n $NS route add default via 10.200.1.1
exit 0; 
