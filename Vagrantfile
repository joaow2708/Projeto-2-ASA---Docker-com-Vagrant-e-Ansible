# -*- mode: ruby -*-
#vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/bookworm64"
  config.ssh.insert.key = false
  if Vagrant.has_puglin?("vagrant-vnguest")
    config.vbguest.auto_update = false
  end
  config.vm.hostname = "joao.caua"
  config.vm.network = "private_network" , ip: "192.168.56.151"
  config.vm.provider = "virtualbox" do |vb|
    vb.memory = "1024"
    vb.gui = false
    vb.name = config.vm.hostname
    vb.check_guest_additions = false
  end
  config.vm.provision "ansible" do |ansible|
    ansible.compatibility_mode = "2.0"
    ansible.playbook = "playbook_ansible.yml"
  end
end
