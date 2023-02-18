#!/bin/bash

ip=$(ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' | awk '{print $2}' | cut -d':' -f2)
gateway=$(route -n | awk '$1 == "0.0.0.0" {print $2}')
dns=$(cat /etc/resolv.conf | grep 'nameserver' | awk '{print $2}')

message="IP address: $ip\nGateway: $gateway\nDNS: $dns"

echo "$message" | mailx -s "Network Information" k213607@nu.edu.pk
