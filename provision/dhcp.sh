#!/bin/bash
# Instalação e configuração do servidor DHCP

sudo apt-get update
sudo apt-get install -y isc-dhcp-server

# Configuração do servidor DHCP
cat <<EOF | sudo tee /etc/dhcp/dhcpd.conf
subnet 192.168.50.0 netmask 255.255.255.0 {
  range 192.168.50.100 192.168.50.200;
  option routers 192.168.50.1;
  option domain-name-servers 8.8.8.8, 8.8.4.4;
  option domain-name "example.com";
}
EOF

# Reiniciar o serviço DHCP
sudo systemctl restart isc-dhcp-server
