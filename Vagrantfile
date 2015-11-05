# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX1_NAME = "base"

BOX_PATH = "packer/vagrant-boxes/CentOS-6.7-x86_64-minimal.box"

Vagrant.configure(2) do |config|
  #config.proxy.http = ""
  #config.proxy.https = ""
  #config.proxy.no_proxy = "127.0.0.1,localhost"
  config.ssh.insert_key = false

  config.vm.box =  File.basename(BOX_PATH)
  config.vm.box_url = BOX_PATH

  config.vm.provider :virtualbox do |vbox|
    # https://github.com/rubygems/rubygems/issues/513
    vbox.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
    vbox.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
  end

  # for multi vms..but the sample below shows for a single vm.
  config.vm.define BOX1_NAME do |c|
    c.vm.hostname = BOX1_NAME
    c.vm.network "private_network", ip: "192.168.56.254"
    c.vm.synced_folder "shared_data", "/home/vagrant/shared_data", {:create => true, :transient => false }
    c.vm.provider :virtualbox do |vbox|
      vbox.customize ["modifyvm", :id, "--memory", "512" ]
      vbox.customize ["modifyvm", :id, "--cpus", "1" ]
    end
    #c.vm.provision :chef_solo do |chef|
    #  tmp_cookbooks_path.push ''
    #  tmp_cookbooks_path.push ''
    #  chef.roles_path = ''
    #  chef.data_bags_path = ''
    #  chef.add_role ''
    #  chef.add_recipe ''
    #  chef.json = JSON.parse({})
    #end
  end
end
