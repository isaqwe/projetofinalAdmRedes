Vagrant.configure("2") do |config|
  config.vm.define "dhcp_server" do |dhcp|
    dhcp.vm.box = "ubuntu/focal64"
    dhcp.vm.network "private_network", type: "dhcp"
    dhcp.vm.hostname = "dhcp-server"
    dhcp.vm.provision "shell", path: "provision/dhcp.sh"
  end

  config.vm.define "dns_server" do |dns|
    dns.vm.box = "ubuntu/focal64"
    dns.vm.network "private_network", type: "dhcp"
    dns.vm.hostname = "dns-server"
    dns.vm.provision "shell", path: "provision/dns.sh"
  end

  config.vm.define "web_server" do |web|
    web.vm.box = "ubuntu/focal64"
    web.vm.network "private_network", type: "dhcp"
    web.vm.hostname = "web-server"
    web.vm.provision "shell", path: "provision/web.sh"
  end

  config.vm.define "ftp_server" do |ftp|
    ftp.vm.box = "ubuntu/focal64"
    ftp.vm.network "private_network", type: "dhcp"
    ftp.vm.hostname = "ftp-server"
    ftp.vm.provision "shell", path: "provision/ftp.sh"
  end

  config.vm.define "nfs_server" do |nfs|
    nfs.vm.box = "ubuntu/focal64"
    nfs.vm.network "private_network", type: "dhcp"
    nfs.vm.hostname = "nfs-server"
    nfs.vm.provision "shell", path: "provision/nfs.sh"
  end
end
