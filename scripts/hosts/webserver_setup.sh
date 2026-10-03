#!/bin/bash
# WEBSERVER-1325 - IP fija + Apache con HTTPS
# Ejecutar como root (sudo -i)
set -e

# 1) Hostname
hostnamectl set-hostname WEBSERVER-1325

# 2) Evitar que cloud-init sobrescriba la red
echo 'network: {config: disabled}' > /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg

# 3) IP fija (copia el archivo webserver_50-cloud-init.yaml de este repo)
cp webserver_50-cloud-init.yaml /etc/netplan/50-cloud-init.yaml
chmod 600 /etc/netplan/50-cloud-init.yaml
netplan apply

# 4) Apache con SSL (certificado autofirmado snakeoil de Ubuntu)
apt update
apt install -y apache2
a2enmod ssl
a2ensite default-ssl
systemctl restart apache2

# 5) Pagina de prueba
cp index.html /var/www/html/index.html

# 6) Verificacion
ip a show ens3
ss -tlnp | grep 443
curl -k https://localhost
