# Disposable Kali Linux                                                                                                                       
#
# Repo: https://github.com/stevemcilwain/Disposable-Kali
# Version: 0.2.1
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
BOX_PATH = "offensive-security/kali-linux"

# BOX_UPDATE: set to true to check for base box updates 
BOX_UPDATE = true

# VM_NAME: set the name of the virtual machine and host name
VM_NAME = "kali"

# VM_MEMORY: specify the amount of memory to allocate to the VM
#VM_MEMORY = "8192"
VM_MEMORY = "8096"
#VM_MEMORY = "2048"

# VM_CPUS: specify the number of CPU cores to allocate to the VM
VM_CPUS = "4"

# VM_SHARED_FOLDER_ENABLE: set to false to disable the shared folder between host and guest
VM_SHARED_FOLDER_ENABLE = true
VM_SHARED_FOLDER_HOST_PATH = "~/shared"
VM_SHARED_FOLDER_GUEST_PATH = "/root/shared"

############################################################
# Provisioning Scripts - Review and Customize
############################################################

# SWAP_ADD: if enabled, will add the amount of SWAP_ADD_GB to current swap space
#           which is usually 2GB for the Kali base box
SWAP_ADD = true
SWAP_ADD_GB = 8

# SHELL_ALIASES: if enabled, will add BASH aliases to .bash_aliases.
#                Aliases can be customized in /scripts/shell_aliases.sh
SHELL_ALIASES = true

# UFW_INSTALL: if enabled, will install UFW with an allow rule for the ports
#              in UFW_ALLOW.  UFW will be left disabled, activate manually.
UFW_INSTALL = false
UFW_ALLOW = "20,21,22,80,443,4443,4444/tcp"

# PKGS_UPGRADE: if enabled, will run update & upgrade
PKGS_UPGRADE = false

# PKGS_MSF_PREP: if enabled, will prep Metasploit with postgresql
PKGS_MSF_PREP = true

# PKGS_WORDLISTS: if enabled, will install additional wordlists
PKGS_WORDLISTS = true

# PKGS_EXPLOITS: if enabled, will install common exploit dependencies and helpers
PKGS_EXPLOITS = true

# PKGS_GIT_REPOS: if enabled, will clone useful git repos to /opt
PKGS_GIT_REPOS = true

# PKGS_WINE: if enabled, will install wine (64 and 32 bit)
PKGS_WINE = true

# PKGS_FUZZBUNCH: if enabled, will install Fuzzbunch - EXPIRIMENTAL
#                 this isn't fully working, you need to install Python 2.6
#                 manually in .winefzb using "winetricks python26"
PKGS_FUZZBUNCH = false

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

    if SHELL_ALIASES
      kali.vm.provision "shell", keep_color: true, name: "shell_aliases.sh", path: "scripts/shell_aliases.sh"
    end

    if PKGS_UPGRADE then
      kali.vm.provision "shell", keep_color: true, name: "pkgs_upgrade.sh", path: "scripts/pkgs_upgrade.sh"
    end  

    if UFW_INSTALL
      kali.vm.provision "shell", keep_color: true, name: "network_ufw.sh", path: "scripts/network_ufw.sh", args: UFW_ALLOW
    end

    if PKGS_MSF_PREP
      kali.vm.provision "shell", keep_color: true, name: "pkgs_msf_prep.sh", path: "scripts/pkgs_msf_prep.sh"
    end   
  
    if PKGS_WORDLISTS
      kali.vm.provision "shell", keep_color: true, name: "pkgs_wordlists.sh", path: "scripts/pkgs_wordlists.sh"
    end

    if PKGS_WINE
      kali.vm.provision "shell", keep_color: true, name: "pkgs_wine.sh", path: "scripts/pkgs_wine.sh"
    end

    if PKGS_EXPLOITS
      kali.vm.provision "shell", keep_color: true, name: "pkgs_exploits.sh", path: "scripts/pkgs_exploits.sh"
    end

    if PKGS_GIT_REPOS
      kali.vm.provision "shell", keep_color: true, name: "pkgs_git_repos.sh", path: "scripts/pkgs_git_repos.sh"
    end

    if PKGS_FUZZBUNCH
      kali.vm.provision "shell", keep_color: true, name: "pkgs_fuzzbunch.sh", path: "scripts/pkgs_fuzzbunch.sh"
    end

    kali.vm.post_up_message = $msg
    
  end

end

$msg = <<MSG

-------------------------------------------------------------
Disposable Kali Vagrant File v0.2.1
-------------------------------------------------------------
Source: https://github.com/stevemcilwain/Disposable-Kali


-------------------------------------------------------------
\n

MSG
