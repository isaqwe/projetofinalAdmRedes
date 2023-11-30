Vagrant.configure("2") do |config|
  # Configuração da VM DHCP
  config.vm.define "dhcp" do |dhcp|
    dhcp.vm.box = "ubuntu/focal64"
    dhcp.vm.network "private_network", ip:"192.168.56.10"
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
  dns.vm.network "private_network", type: "dhcp"
  dns.vm.network "forwarded_port", guest: 53, host: 8053, protocol: "udp" # Porta 30053 no host

  dns.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install -y docker.io
    sudo usermod -aG docker vagrant
    sudo systemctl enable docker
    sudo systemctl start docker

    # Remova o contêiner existente, se houver
    sudo docker stop dns-container || true
    sudo docker rm dns-container || true
    # Baixe e inicie o contêiner BIND9
    sudo docker run -d --name dns-container -p 8053:53/udp --restart always sameersbn/bind:latest


  SHELL
end

  # Configuração da VM WEB
    config.vm.define "web" do |web|
      web.vm.box = "ubuntu/focal64"
      web.vm.network "private_network", type: "dhcp"
      web.vm.network "forwarded_port", guest: 80, host: 8080
      web.vm.hostname = "web"

      web.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update

    # Instala o Docker
    sudo apt-get install -y docker.io

    # Adiciona o usuário 'vagrant' ao grupo 'docker'
    sudo usermod -aG docker vagrant

    # Puxa a imagem do Apache
   sudo docker pull httpd
    ##docker run -d --name web httpd

    # Executa o contêiner Apache em modo daemon
    sudo docker run -d --name web -p 8080:80 httpd
    #docker run -dit --name web -p 8080:80 -v "$PWD":/usr/local/apache2/htdocs/ httpd:2.4



  # Adiciona uma mensagem de exemplo no index.html dentro do contêiner Apache
  #echo "<html><body><h1>Hello from Apache on Vagrant!</h1></body></html>" | docker exec -i web tee /usr/local/apache2/htdocs/index.html
  #echo "ServerName localhost" | docker exec -i web tee -a /usr/local/apache2/conf/httpd.conf

    # Exibe os logs do contêiner (opcional)
    #docker logs web
      SHELL
    end

  # Configuração da VM FTP
  config.vm.define "ftp" do |ftp|
    ftp.vm.box = "ubuntu/focal64"
    ftp.vm.network "private_network", type: "dhcp"
    ftp.vm.hostname = "ftp"

    ftp.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get upgrade -y
      sudo apt-get install -y docker.io
      sudo usermod -aG docker vagrant
      sudo systemctl enable docker
      sudo systemctl start docker

      # Remova o contêiner existente, se houver
      sudo docker stop ftp || true
      sudo docker rm ftp || true
      sudo docker pull bogem/ftp
      sudo docker run -d -v ftp:/home/vsftpd -p 20:20 -p 21:21 -p 47400-47470:47400-47470 -e FTP_USER=teste -e FTP_PASS=teste -e PASV_ADDRESS=172.17.0.2 --name ftp_server --restart=always bogem/ftp

    SHELL
  end

  # Configuração da VM NFS (Servidor)
  config.vm.define "nfs" do |nfs|
    nfs.vm.box = "ubuntu/focal64"
    nfs.vm.hostname = "nfs"
    nfs.vm.network "private_network", type:"dhcp"
    nfs.vm.network "forwarded_port", guest: 2048, host: 2048
    nfs.vm.synced_folder "./nfs-share", "/vagrant/nfs-share"
    nfs.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install -y docker.io
      sudo usermod -aG docker vagrant
      sudo systemctl enable docker
      sudo systemctl start docker
      ## remover container se existir
      sudo docker stop nfs-server || true
      sudo docker rm nfs-server || true
      sudo docker pull itsthenetwork/nfs-server-alpine
      sudo docker run -id --name nfs-server --privileged -v /path/to/vagrant/project/nfs-share:/export -e SHARED_DIRECTORY=/export -p 2048:2048/tcp -p 2048:2048/udp itsthenetwork/nfs-server-alpine /bin/sh
      


      #sudo docker run -d --name nfs-server --privileged -v /vagrant/nfs-share:/export -e SHARED_DIRECTORY=/export -p 2049:2049/tcp -p 2049:2049/udp itsthenetwork/nfs-server-alpine /bin/sh -c "mkdir -p /export && /usr/bin/nfsd.sh"

      #sudo docker run -d --name nfs-server --privileged -v /vagrant/nfs-share:/export -e SHARED_DIRECTORY=/export -p 2049:2049/tcp -p 2049:2049/udp itsthenetwork/nfs-server-alpine
    SHELL
  end
end
