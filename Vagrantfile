# -*- mode: ruby -*-
Vagrant.configure(2) do |config|
  # config.vm.box = "buster-docker-host.box"
  config.vm.box = "nobiki/buster-docker-host"
  config.vm.box_version = "1.0"
  config.vm.define "vagrant-docker-host"
  config.vm.provision :shell, path: "provision.sh"
  config.disksize.size = '80GB'
  # config.vbguest.installer_arguments = ['--nox11', '-- --do']
  # config.vbguest.auto_update = true
  # config.vm.network "private_network", ip: "192.168.56.101"
  config.ssh.forward_x11 = true

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
  # config.vm.network :forwarded_port, guest: 8080, host: 8080
  # config.vm.network :forwarded_port, guest: 3306, host: 3306
  # config.vm.network :forwarded_port, guest: 3000, host: 3000
  # config.vm.network :forwarded_port, guest: 4444, host: 4444
  # for i in 15800..15810
  #   config.vm.network :forwarded_port, guest: i, host: i
  # end
  # for i in 15900..15910
  #   config.vm.network :forwarded_port, guest: i, host: i
  # end
end
