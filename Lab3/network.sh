#!/bin/bash


ip=$(ifconfig | grep "inet " | awk '{print $2}')
gateway=$(route -n | awk '$1 == "0.0.0.0" {print $2}')
dns=$(cat /etc/resolv.conf | grep 'nameserver' | awk '{print $2}')

echo "IP address: $ip "
echo "Gateway: $gateway "
echo "DNS: $dns "

