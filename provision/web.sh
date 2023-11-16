#!/bin/bash
# Instalação e configuração do servidor web (Nginx)

sudo apt-get update
sudo apt-get install -y nginx

# Configuração do servidor web
echo "Hello from Web Server" | sudo tee /var/www/html/index.html

# Reiniciar o serviço Nginx
sudo systemctl restart nginx
