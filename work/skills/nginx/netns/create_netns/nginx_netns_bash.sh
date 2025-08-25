#!/bin/bash
. nginx_netns_vars
sudo ip netns exec $NS bash
