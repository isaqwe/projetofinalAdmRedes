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

      # Remova o contêiner existente, se houver
      sudo docker stop dhcp || true
      sudo docker rm dhcp || true

      # Baixe uma imagem diferente do contêiner DHCP (pode substituir por outra de sua escolha)
      sudo docker pull networkboot/dhcpd

      # Copie o arquivo dhcpd.conf para o diretório /tmp
      sudo cp /vagrant/dhcpd.conf /tmp/dhcpd.conf

      # Crie o novo contêiner, montando o diretório /data
      sudo docker run -d --name dhcp --network host -v /tmp:/data networkboot/dhcpd
    SHELL
  end

  # Configuração da VM DNS
  # Configuração da VM DNS
config.vm.define "dns" do |dns|
  dns.vm.box = "ubuntu/focal64"
  dns.vm.network "forwarded_port", guest: 53, host: 30053, protocol: "udp" # Porta 30053 no host

  dns.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install -y docker.io
    sudo usermod -aG docker vagrant
    sudo systemctl enable docker
    sudo systemctl start docker

    # Remova o contêiner existente, se houver
    sudo docker stop bind9-container || true
    sudo docker rm bind9-container || true
    sudo docker pull ubuntu/bind9
    # Baixe e inicie o contêiner BIND9
    sudo docker run -d --name bind9-container -e TZ=UTC -p 30053:53 ubuntu/bind9

    # Aguarde o serviço DNS iniciar completamente (pode levar alguns segundos)
    sleep 10

    # Instale o utilitário dnsutils no contêiner
    sudo docker exec bind9-container apt-get update
    sudo docker exec bind9-container apt-get install -y dnsutils

    # Configuração da zona example.com
    #sudo docker exec bind9-container tee /etc/bind/named.conf.local << EOF
#zone "example.com" {
  #type master;
  #file "/etc/bind/db.example.com";
#};
#EOF

   # sudo docker exec bind9-container tee /etc/bind/db.example.com << EOF
#\$TTL    86400
#@       IN      SOA     ns1.example.com. admin.example.com. (
 #               2023112801   ; Serial
  #              3600         ; Refresh
   #             1800         ; Retry
    #            604800       ; Expire
     #           86400 )      ; Negative Cache TTL
#;
#@       IN      NS      ns1.example.com.
#@       IN      A       93.184.216.34
#ns1     IN      A       93.184.216.34
#EOF

    # Reinicie o serviço BIND9 para aplicar as alterações
 #   sudo docker exec bind9-container service bind9 restart
  SHELL
end

  # Configuração da VM WEB
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

  # Configuração da VM FTP
  config.vm.define "ftp" do |ftp|
    ftp.vm.box = "ubuntu/focal64"
    ftp.vm.network "forwarded_port", guest: 21, host: 2121
    ftp.vm.network "forwarded_port", guest: 21, host: 21
    ftp.vm.network "forwarded_port", guest: 20000, host: 20000
    ftp.vm.network "forwarded_port", guest: 20001, host: 20001

    ftp.vm.hostname = "ftp"

    ftp.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install -y docker.io
      sudo usermod -aG docker vagrant
      sudo systemctl enable docker
      sudo systemctl start docker

      # Remova o contêiner existente, se houver
      sudo docker stop ftp || true
      sudo docker rm ftp || true

      sudo docker pull fauria/vsftpd
      sudo docker run -d --name ftp -p 2121:21 -v /vagrant/ftp:/home/vsftpd --restart always fauria/vsftpd
    SHELL
  end

  # Configuração da VM NFS (Servidor)
  config.vm.define "nfs" do |nfs|
    nfs.vm.box = "ubuntu/focal64"
    nfs.vm.hostname = "nfs"
    nfs.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install -y nfs-kernel-server
      sudo systemctl enable nfs-kernel-server
      sudo systemctl start nfs-kernel-server
    SHELL
  end
end
