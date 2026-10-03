#!/bin/bash
# Usuario (Ubuntu Cloud 24.04) - recibe IP por DHCP del FW1 en la VLAN 10
ip a show ens3        # 10.13.25.10/25
ip route              # default via 10.13.25.1
ping -c 4 8.8.8.8     # salida a Internet por NAT del FW1
sudo apt update
sudo apt install -y traceroute curl
