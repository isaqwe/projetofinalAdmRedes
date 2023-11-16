#!/bin/bash
# Instalação e configuração do servidor DNS (bind9)

sudo apt-get update
sudo apt-get install -y bind9

# Configuração do servidor DNS
cat <<EOF | sudo tee /etc/bind/named.conf.local
zone "example.com" {
  type master;
  file "/etc/bind/db.example.com";
};
EOF

cat <<EOF | sudo tee /etc/bind/db.example.com
$TTL 604800
@ IN SOA ns1.example.com. admin.example.com. (
                              3 ; Serial
                         604800 ; Refresh
                          86400 ; Retry
                        2419200 ; Expire
                         604800 ) ; Negative Cache TTL
;
@ IN NS ns1.example.com.

ns1 IN A 192.168.50.2
EOF

# Reiniciar o serviço DNS
sudo systemctl restart bind9
