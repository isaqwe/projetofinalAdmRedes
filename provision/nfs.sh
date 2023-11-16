#!/bin/bash
# Instalação e configuração do servidor NFS

sudo apt-get update
sudo apt-get install -y nfs-kernel-server

# Configuração do compartilhamento NFS
sudo mkdir -p /mnt/shared
echo "/mnt/shared 192.168.50.0/24(rw,sync,no_subtree_check)" | sudo tee -a /etc/exports

# Reiniciar o serviço NFS
sudo systemctl restart nfs-kernel-server
