# -*- mode: ruby -*-
# vi: set ft=ruby :

nodes = [
  { :hostname => "master", :ram => 2048, :cpus => 2, :ip => '10.100.1.102'},
  { :hostname => "worker1", :ram => 2048, :cpus => 2, :ip => '10.100.1.103'},
  { :hostname => "worker2", :ram => 2048, :cpus => 2, :ip => '10.100.1.104'},
  { :hostname => "rancher", :ram => 2048, :cpus => 2, :ip => '10.100.1.101'}
]

Vagrant.configure("2") do |config|
  nodes.each do |node|
    config.vm.define node[:hostname] do |nodeconfig|
      nodeconfig.vm.box = "ubuntu/xenial64"
      nodeconfig.vm.hostname = node[:hostname]
      #nodeconfig.vm.provision "shell", inline: "sudo sed -i 's/archive.ubuntu.com/il.archive.ubuntu.com/g' /etc/apt/sources.list"
      #nodeconfig.vm.provision "shell", inline: "sudo sed -i 's/deb-src/#deb-src/g' /etc/apt/sources.list"
      nodeconfig.vm.provision "shell", :path => 'general_bootstrap.sh'
      if node[:hostname] == "rancher"
        nodeconfig.vm.network "forwarded_port", guest: 80, host: 8082
        nodeconfig.vm.network "forwarded_port", guest: 443, host: 8443
        nodeconfig.vm.provision "shell", :path => 'rancher_bootstrap.sh'
      #else
        #nodeconfig.vm.provision "shell", :path => 'nodes_bootstrap.sh'
      end
      nodeconfig.vm.synced_folder "./", "/home/avi/Documents/rke"
      # nodeconfig.vm.network "public_network", bridge: "enp0s31f6"
      nodeconfig.vm.network "private_network", ip: node[:ip], :autostart => true
      nodeconfig.vm.network "public_network", bridge: "en0: Wi-Fi (AirPort)", use_dhcp_assigned_default_route: true
      nodeconfig.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.name=node[:hostname]
        vb.cpus = node[:cpus]
        vb.memory = node[:ram]
      end
      end
    end
end