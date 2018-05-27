# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    # /*=====================================
    # =            FREE VERSION!            =
    # =====================================*/
    # This is the free (still awesome) version of Scotch Box.
    # Please go Pro to support the project and get more features.
    # Check out https://box.scotch.io to learn more. Thanks
    # 
    # This box has PHP 7.2 , Xdebug and composer !! Also out of the box :P just clone and vagrant up
    # ebncana@hotmail.com

    config.vm.box = "scotch/box"    
    config.vm.network "private_network", ip: "192.168.33.67"
    config.vm.hostname = "sbox"
    config.vm.define "sbox" do |sbox|
    end
    config.vm.synced_folder ".", "/var/www", :mount_options => ["dmode=777", "fmode=666"]
    config.ssh.insert_key=false
    
    config.vm.provider "virtualbox" do |v|
                v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
                v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
        v.memory = 1536
        v.cpus = 2
    end

        config.vm.provision "Provisioning", type: "shell", path: "vagrant_bootstrap/bootstrap.sh"
    

    # Optional NFS. Make sure to remove other synced_folder line too
    #config.vm.synced_folder ".", "/var/www", :nfs => { :mount_options => ["dmode=777","fmode=666"] }

end
