# Disposable Kali Linux                                                                                                                       
#
# Repo: https://github.com/stevemcilwain/Disposable-Kali
# Version: 0.1.1
#
############################################################

# -*- mode: ruby -*-
# vi: set ft=ruby :

# capture the vagrant command passed in as first argument
VAGRANT_COMMAND = ARGV[0]

# Configure with API version 2
Vagrant.configure("2") do |config|

  config.vm.define "kali", primary: true do |kali|

      #use the offsec base box
    kali.vm.box = "offensive-security/kali-linux"

    # [OPTIONAL] set to false to skip
    # gets the latest version of the base box 
    kali.vm.box_check_update = true

    # set the hostname of the box
    kali.vm.hostname = "kali"

    # [OPTIONAL] comment out to skip
    # create a shared folder between host and vm 
    kali.vm.synced_folder "~/shared", "/root/shared", create: true, owner: "root", group: "root", automount: true
    
    # enable X11 tunnelling via SSH
    kali.ssh.forward_agent = true
    kali.ssh.forward_x11 = true

    # this allows "vagrant up" to work normally using the vagrant user
    # but if "vagrant ssh", then the root user will be used

    if VAGRANT_COMMAND == "ssh"
      kali.ssh.username = 'root'
    end

    # configure virtualbox specific settings
    kali.vm.provider :virtualbox do |vbox|

      # run headless (can attach with vbox gui if needed)
      vbox.gui = false

      # set the name in virtualbox
      vbox.name = "kali"

      # configure memory settings according to your needs
      
      #vbox.memory = "2048"
      #vbox.memory = "4096"
      vbox.memory = "8192"
      
      # configure cpu settings according to your needs

      #vbox.cpus = "1"
      #vbox.cpus = "2"
      vbox.cpus = "4"

      # [OPTIONAL] set hidpi
      vbox.customize ['setextradata', :id, 'GUI/HiDPI/UnscaledOutput', '1']

    end

    # Execute Provisioning Scripts
    
    kali.vm.provision "shell", inline: $script_sshd_allow_root_login, privileged: true
    kali.vm.provision "shell", inline: $script_root_shell_aliases, privileged: true
    kali.vm.provision "shell", inline: $script_time_zone, privileged: true
    kali.vm.provision "shell", inline: $script_swap_add, privileged: true, args: 6
    kali.vm.provision "shell", inline: $script_network_resolvers, privileged: true
    kali.vm.provision "shell", inline: $script_network_ufw, privileged: true
    kali.vm.provision "shell", inline: $script_packages_extra, privileged: true
    kali.vm.provision "shell", inline: $script_tools_prep, privileged: true
    
    # Uncomment this install all updates / upgrades - can be a long process...
    #kali.vm.provision "shell", inline: $script_packages_update, privileged: true

    kali.vm.post_up_message = $msg
    
  end

end

# ######################################## SCRIPTS

$script_sshd_allow_root_login = <<-SCRIPT
  echo "--- sshd_allow_root_login running... "

  if [[ -s /tmp/sshd_allow_root_login ]]; then
    echo "root login already allowed..."
  else
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
    systemctl restart sshd
    touch /tmp/sshd_allow_root_login 
    echo "--- sshd_allow_root_login completed"
  fi

SCRIPT

$script_root_shell_aliases = <<-SCRIPT
  echo "--- root_shell_aliases running... "

  if [[ -s /root/.bash_aliases ]]; then
    echo ".bash_aliases already exists..."
  else
    echo "alias ll='ls -lvhAF --file-type --group-directories-first'" >> /root/.bash_aliases
    echo "alias lr='ll -R'" >> /root/.bash_aliases
    source /root/.bash_aliases
  fi

  cat /root/.bash_aliases

  echo "--- root_shell_aliases completed. "
SCRIPT

$script_time_zone = <<-SCRIPT
  echo "--- time_zone running... "

  cp /usr/share/zoneinfo/America/Chicago /etc/localtime
  date

  echo "--- time_zone completed. "
SCRIPT

$script_swap_add = <<-SCRIPT
  echo "--- swap_add running... "

  if [[ -s /swapfile ]]; then
    echo "swapfile already exists..."
  else
    size=$1
    fallocate -l ${size}G /swapfile
    chown root:root /swapfile
    chmod 0600 /swapfile
    mkswap /swapfile
    swapon /swapfile
    cp /etc/fstab /etc/fstab.bak
    echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab
  fi

  swapon

  echo "--- swap_add completed."
SCRIPT

# TODO:  add a check here for existing entry
$script_network_resolvers = <<-SCRIPT
  echo "--- network_resolvers running... "
  
  if [[ -s /tmp/network_resolvers ]]; then
    echo "resolvers already added..."
  else
    echo "supersede domain-name-servers 1.1.1.1, 1.0.0.1;" >> /etc/dhcp/dhclient.conf
  fi
  
  cat /etc/dhcp/dhclient.conf | grep "supersede domain-name-servers"

  echo "--- network_resolvers completed. "
SCRIPT

#customize to ports your liking... 
$script_network_ufw = <<-SCRIPT
  echo "--- network_ufw running... "
  apt-get install ufw -y
  apt-get install gufw -y
  ufw allow 22/tcp
  ufw allow 80/tcp
  ufw allow 443/tcp    
  #echo yes | ufw enable
  ufw status verbose
  echo "--- network_ufw completed. "
SCRIPT

$script_packages_extra = <<-SCRIPT
  echo "--- packages_extra running... "
  apt-get install rlwrap -y
  apt-get install seclists -y 
  apt-get install ftp -y  
  apt-get install php-curl -y 
  apt-get install python-smb -y
  apt-get install mingw-w64 -y
  dpkg --add-architecture i386
  apt-get update
  apt-get install wine32 -y
  updatedb
  echo "--- packages_extra completed... "
SCRIPT

$script_tools_prep = <<-SCRIPT
  echo "--- tools_prep running... "
  systemctl start postgresql
  systemctl enable postgresql
  msfdb init 
  searchsploit -u
  gunzip /usr/share/wordlists/rockyou.txt.gz
  echo "--- tools_prep completed. "
SCRIPT

$script_packages_update = <<-SCRIPT
  echo "--- packages_update is running... "
  export DEBIAN_FRONTEND=noninteractive
  apt-get update 
  apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
  echo "--- packages_update completed."
SCRIPT


$msg = <<MSG
------------------------------------------------------
Your Kali VM is ready!
Login with "vagrant ssh" and change the root password.
Use "ufw enable" to turn on the firewall.
------------------------------------------------------
MSG
