# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "AndrewDryga/vagrant-box-osx"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  config.vm.synced_folder ".", "/vagrant"

  config.vm.provider "virtualbox" do |v|
    # Display the VirtualBox GUI when booting the machine
    v.gui = true
 
    # Customize the amount of memory on the VM:
    # v.memory = "4096"
    v.customize ["modifyvm", :id, "--memory", 4096]
    v.customize ["modifyvm", :id, "--cpus", 2]
    v.customize ["modifyvm", :id, "--vram", "128"]
    v.customize ["modifyvm", :id, "--accelerate3d", "on"]
    v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
  end

  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
end
