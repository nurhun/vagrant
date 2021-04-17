# -*- mode: ruby -*-
# vi: set ft=ruby :

# Bring multiple machines up in parallel if the provider supports it.
ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure("2") do |config|

  config.vm.provision "shell", path: "bootstrap.sh"

  NodeCount = 2 

  (1..NodeCount).each do |i|
    config.vm.define "ubuntu20-04-node#{i}" do |node|
      node.vm.box = "ubuntu/focal64"
      node.vm.hostname = "ubuntu20-04-node#{i}"
      node.vm.network "private_network", ip: "172.16.16.10#{i}"
      node.vm.provision "file", source: "~/.ssh/vagrant_key.pub", destination: "~/.ssh/me.pub"
      node.vm.provision "shell", inline: <<-SHELL
        cat /home/vagrant/.ssh/me.pub >> /home/vagrant/.ssh/authorized_keys
      SHELL
      node.vm.provider "virtualbox" do |v|
        v.name = "ubuntu20-04-node#{i}"
        v.memory = 2048
        v.cpus = 1
      end
    end
  end
end
