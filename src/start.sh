#!/bin/bash -e

touch /var/log/charon.log
iptables -t nat -A POSTROUTING -s $VPN_SUBNET -j MASQUERADE
sysctl -w net.ipv4.ip_forward=1
ipsec start
tail -f /var/log/charon.log
