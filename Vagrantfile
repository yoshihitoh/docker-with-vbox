Vagrant.configure('2') do |config|
  # basics
  config.vm.box = 'ubuntu/focal64'
  config.vm.hostname = 'docker-vm'
  config.vm.network :private_network, ip: '192.168.50.10'

  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    vb.cpus = 4
    vb.memory = 4096
    vb.customize ['modifyvm', :id, '--natdnsproxy1', 'off']
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'off']
  end

  # plugins
  config.disksize.size = '40GB'
  config.mutagen.orchestrate = true

  config.vm.synced_folder './vm-shared/', '/home/vagrant/vm-shared', type: 'rsync',
    rsync_auto: true,
    rsync_exclude: ['.git/', 'node_modules', 'log/', 'tmp/']

  config.vm.provision 'shell', inline: <<-SHELL
    echo "setup system tools"

    echo "install docker.."
    curl -fsSL https://get.docker.com | sh > /dev/null 2>&1
    usermod -aG docker vagrant

    echo "install tools.."
    sudo apt-get update && \
      sudo apt-get install -y neovim ripgrep build-essential libssl-dev git > /dev/null 2>&1

    echo "done!"
  SHELL

  config.vm.provision :vagrant_user, type: 'shell', privileged: false, inline: <<-SHELL
    echo "setup user environment"

    echo "setup aliases"
    echo "" >> ~/.bashrc
    echo "# aliases" >> ~/.bashrc
    echo "alias vi='nvim'" >> ~/.bashrc
    echo "alias vim='nvim'" >> ~/.bashrc

    echo "done!"
  SHELL


end
