#!/bin/bash
# Instalação e configuração do servidor FTP (vsftpd)

sudo apt-get update
sudo apt-get install -y vsftpd

# Configuração do servidor FTP
sudo sed -i 's/#write_enable=YES/write_enable=YES/' /etc/vsftpd.conf

# Reiniciar o serviço FTP
sudo systemctl restart vsftpd
