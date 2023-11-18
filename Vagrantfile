Vagrant.configure("2") do |config|
  # Configuração da VM DHCP
  config.vm.define "dhcp" do |dhcp|
    dhcp.vm.box = "ubuntu/focal64"
    dhcp.vm.network "private_network", type: "dhcp"
    dhcp.vm.hostname = "dhcp"
    
    dhcp.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install -y docker.io
      sudo usermod -aG docker vagrant
      sudo systemctl enable docker
      sudo systemctl start docker
      sudo docker run -d --name dhcp --network host -v /vagrant/dhcpd.conf:/etc/dhcp/dhcpd.conf -v "$(pwd)/data:/data" networkboot/dhcpd:latest
    SHELL
  end

  # Configuração da VM DNS
  config.vm.define "dns" do |dns|
    dns.vm.box = "ubuntu/focal64"
    dns.vm.network "forwarded_port", guest: 53, host: 53, protocol: "udp"
    dns.vm.hostname = "dns"

    dns.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install -y bind9

      # Configuração do BIND9
      echo 'options { directory "/var/cache/bind"; };' | sudo tee /etc/bind/named.conf.options

      # Adicione a configuração de zona DNS
      echo 'zone "example.com" { type master; file "/etc/bind/db.example.com"; };' | sudo tee -a /etc/bind/named.conf.local

      # Crie o arquivo de zona para example.com
      sudo tee /etc/bind/db.example.com > /dev/null <<'EOL'
      \$TTL    604800
      @       IN      SOA     ns1.example.com. admin.example.com. (
                      3       ; Serial
                      604800  ; Refresh
                      86400   ; Retry
                      2419200 ; Expire
                      604800 ) ; Negative Cache TTL
      ;
      @       IN      NS      ns1.example.com.
      @       IN      A       192.168.50.2
      ns1     IN      A       192.168.50.2
      www     IN      CNAME   example.com.
      mail    IN      MX      10 mail.example.com.
      mail    IN      A       192.168.50.3
EOL

      # Reinicie o BIND9 para aplicar as alterações
      sudo systemctl restart bind9
    SHELL
  end
# Configuração da VM Apache
  config.vm.define "web" do |web|
    web.vm.box = "ubuntu/focal64"
    web.vm.network "forwarded_port", guest: 80, host: 8080
    web.vm.hostname = "web"

    web.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install -y apache2
      echo "<html><body><h1>Hello from Apache on Vagrant!</h1></body></html>" | sudo tee /var/www/html/index.html
      sudo systemctl enable apache2
      sudo systemctl start apache2
    SHELL
  end
end
