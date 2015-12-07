# el6 source w/ el7 destination server

Vagrant.configure('2') do |config|

  #config.vm.network 'public_network', bridge: 'eno1'
  config.vm.network "private_network", type: "dhcp" #, virtualbox__intnet: true

  config.vm.define 'src' do |define|
    define.vm.hostname = 'src'
    define.vm.provider :virtualbox do |provider, override|
      override.vm.box = 'bento/centos-6.7'
    end
  end

  config.vm.define 'dest' do |define|
    define.vm.hostname = 'dest'
    define.vm.provider :virtualbox do |provider, override|
      override.vm.box = 'bento/centos-7.1'
    end
  end

  config.vm.provider :virtualbox do |provider, override|
    provider.memory = 2048
    provider.cpus = 2
  end

  script = <<-EOS
   sudo yum install -y git vim tree
   sudo yum install -y http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
   sudo yum install -y lsyncd
  EOS

  config.vm.provision "shell", inline: script
end
