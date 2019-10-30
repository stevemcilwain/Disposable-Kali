# Disposable Kali Linux                                                                                                                       
#
# Repo: https://github.com/stevemcilwain/Disposable-Kali
# Version: 0.3
#
############################################################

# -*- mode: ruby -*-
# vi: set ft=ruby :

# capture the vagrant command passed in as first argument
VAGRANT_COMMAND = ARGV[0]

############################################################
# VM and Guest Settings - Review and Customize
############################################################

# BOX_PATH:  the name or full url of the base box to use
BOX_PATH = "kalilinux/rolling"

# BOX_UPDATE: set to true to check for base box updates 
BOX_UPDATE = true

# VM_NAME: set the name of the virtual machine and host name
VM_NAME = "diskali"

# VM_MEMORY: specify the amount of memory to allocate to the VM
#VM_MEMORY = "8192"
VM_MEMORY = "4096"
#VM_MEMORY = "2048"

# VM_CPUS: specify the number of CPU cores to allocate to the VM
VM_CPUS = "2"

# VM_SHARED_FOLDER_ENABLE: set to false to disable the shared folder between host and guest
VM_SHARED_FOLDER_ENABLE = true
VM_SHARED_FOLDER_HOST_PATH = "d:\shared"
VM_SHARED_FOLDER_GUEST_PATH = "/mnt/shared"

# SWAP_ADD: if enabled, will add the amount of SWAP_ADD_GB to current swap space
#           which is usually 2GB for the Kali base box
SWAP_ADD = true
SWAP_ADD_GB = 4

############################################################
# DO NOT ALTER BELOW HERE
############################################################

# Configure with API version 2
Vagrant.configure("2") do |config|

  config.vm.define "kali", primary: true do |kali|

    kali.vm.box = BOX_PATH
    kali.vm.box_check_update = BOX_UPDATE
    kali.vm.hostname = VM_NAME
    kali.ssh.forward_agent = true
    kali.ssh.forward_x11 = true

    # this allows "vagrant up" to work normally using the vagrant user
    # but if "vagrant ssh", then the root user will be used
    if VAGRANT_COMMAND  == "ssh" 
      kali.ssh.username = "root"
    end

    #virtual box specific settings

    kali.vm.provider :virtualbox do |vbox|
      vbox.gui = false
      vbox.name = VM_NAME
      vbox.memory = VM_MEMORY
      vbox.cpus = VM_CPUS
    end

    if VM_SHARED_FOLDER_ENABLE
      kali.vm.synced_folder VM_SHARED_FOLDER_HOST_PATH, VM_SHARED_FOLDER_GUEST_PATH, create: true, owner: "root", group: "root", automount: true
    end

    # Execute Provisioning Scripts
      
    kali.vm.provision "shell", keep_color: true, name: "sshd_allow_root.sh", path: "scripts/sshd_allow_root.sh"

    if SWAP_ADD
      kali.vm.provision "shell", keep_color: true, name: "swap_add.sh", path: "scripts/swap_add.sh", args: SWAP_ADD_GB
    end

    #kali.vm.provision "shell", keep_color: true, name: "setup.sh", path: "scripts/setup.sh"
    
    kali.vm.provision "file", source: "files/zshrc", destination: ".zshrc"

    kali.vm.post_up_message = $msg
    
  end

end

$msg = <<MSG

-------------------------------------------------------------
Disposable Kali Vagrant File v0.3
-------------------------------------------------------------
Source: https://github.com/stevemcilwain/Disposable-Kali


-------------------------------------------------------------
\n

MSG
