Vagrant.configure("2") do |config|
  # Base Vagrant Box,
  # CentOS 7.5 Minimal,
  # 20 GB HDD, nothing extra
 config.vm.box = "sbeliakou/centos"
 config.vm.box_version = "7.6"

  # VM IP Address in the Private Network

  # Host's hostname master
    config.vm.define "jenkins" do |config|
     config.vm.network :private_network, ip: "192.168.56.100"
     config.vm.hostname = "jenkins"
     config.ssh.insert_key = false
     config.vm.provider "virtualbox" do |vb|
       # Virtualbox VM name
       vb.name = "jenkins"
       # no matter how much CPU is used in the VM, 
       # no more than 50% would be used on your own host machine
       vb.customize ["modifyvm", :id, "--cpuexecutioncap", "30"]
       # RAM provided to VM
       vb.memory = "2048"
     end
 # config.vm.provision "shell", path: "master.sh", keep_color: true
  config.vm.provision "shell", inline: "echo ---=== done===----"
  end

    config.vm.define "nexus" do |config|
     config.vm.network :private_network, ip: "192.168.56.101"
     config.vm.hostname = "nexus"
     config.ssh.insert_key = false
     config.vm.provider "virtualbox" do |vb|
       # Virtualbox VM name
       vb.name = "nexus"
       # no matter how much CPU is used in the VM,
       # no more than 50% would be used on your own host machine
       vb.customize ["modifyvm", :id, "--cpuexecutioncap", "30"]
       # RAM provided to VM
       vb.memory = "1024"
     end
 # config.vm.provision "shell", path: "master.sh", keep_color: true
  config.vm.provision "shell", inline: "echo ---=== done===----"
  end

    config.vm.define "sonar" do |config|
     config.vm.network :private_network, ip: "192.168.56.102"
     config.vm.hostname = "sonar"
     config.ssh.insert_key = false
     config.vm.provider "virtualbox" do |vb|
       # Virtualbox VM name
       vb.name = "sonar"
       # no matter how much CPU is used in the VM,
       # no more than 50% would be used on your own host machine
       vb.customize ["modifyvm", :id, "--cpuexecutioncap", "30"]
       # RAM provided to VM
       vb.memory = "1024"
     end
 # config.vm.provision "shell", path: "master.sh", keep_color: true
  config.vm.provision "shell", inline: "echo ---=== done===----"
  end


end
