#!/bin/bash
# Pruebas desde el Usuario hacia el Servidor Web (a traves del tunel IPsec)
ping -c 4 10.13.25.130
traceroute 10.13.25.130
curl -k https://10.13.25.130
ping -c 4 8.8.8.8
# Con la VPN caida (Bring Down en el FW1) las tres primeras fallan
# y ping 8.8.8.8 sigue respondiendo.
