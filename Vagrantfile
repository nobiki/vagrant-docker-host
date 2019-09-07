# -*- mode: ruby -*-
Vagrant.configure(2) do |config|
  config.vm.box = "debian/buster64"
  config.vm.define "vagrant-docker-host"
  config.vm.provision :shell, path: "provision.sh"
  config.disksize.size = '200GB'
  # config.vbguest.installer_arguments = ['--nox11', '-- --do']
  # config.vbguest.auto_update = true
  # config.vm.network "private_network", ip: "192.168.56.101"

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 4
    vb.memory = 4096 # MB
    vb.gui = false

    vb.customize [
      "modifyvm", :id,
      # "--vram", "256",
      # "--clipboard", "bidirectional",
      # "--accelerate3d", "off",
      # "--hwvirtex", "on",
      # "--nestedpaging", "on",
      # "--largepages", "on",
      # "--ioapic", "on",
      # "--pae", "on",
      "--paravirtprovider", "kvm",
    ]
  end

  config.vm.network :forwarded_port, guest: 80, host: 80
  config.vm.network :forwarded_port, guest: 443, host: 443
end
