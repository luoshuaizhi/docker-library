Vagrant.require_version ">= 2.0.0"

COREOS_URL_TEMPLATE = "https://storage.googleapis.com/%s.release.core-os.net/amd64-usr/current/coreos_production_vagrant.json"

SUPPORTED_OS = {
  "coreos-stable"       => {box: "coreos-stable",      user: "core", box_url: COREOS_URL_TEMPLATE % ["stable"]},
  "coreos-alpha"        => {box: "coreos-alpha",       user: "core", box_url: COREOS_URL_TEMPLATE % ["alpha"]},
  "coreos-beta"         => {box: "coreos-beta",        user: "core", box_url: COREOS_URL_TEMPLATE % ["beta"]},
  "ubuntu1604"          => {box: "generic/ubuntu1604", user: "vagrant"},
  "ubuntu1804"          => {box: "generic/ubuntu1804", user: "vagrant"},
  "centos"              => {box: "centos/7",           user: "vagrant"},
  "centos-bento"        => {box: "bento/centos-7.6",   user: "vagrant"},
  "fedora"              => {box: "fedora/28-cloud-base",                user: "vagrant"},
  "opensuse"            => {box: "opensuse/openSUSE-15.0-x86_64",       user: "vagrant"},
  "opensuse-tumbleweed" => {box: "opensuse/openSUSE-Tumbleweed-x86_64", user: "vagrant"},
  "oraclelinux"         => {box: "generic/oracle7", user: "vagrant"},
}

# Defaults for config options defined in CONFIG
$num_instances = 1
$instance_name_prefix = "k8s"
$vm_gui = false
$vm_memory = 4096
$vm_cpus = 2
$shared_folders = {}
$forwarded_ports = {}
$subnet = "172.17.8"
$os = "centos"
$network_plugin = "flannel"
# Setting multi_networking to true will install Multus: https://github.com/intel/multus-cni
$multi_networking = false
$override_disk_size = false
$disk_size = "100GB"

$box = SUPPORTED_OS[$os][:box]
host_vars = {}

# Verify whether required plugins are installed.
required_plugins = [ "vagrant-disksize" ]
required_plugins.each do |plugin|
  if not Vagrant.has_plugin?(plugin)
    raise "The vagrant plugin #{plugin} is required. Please run `vagrant plugin install #{plugin}`"
  end
end

Vagrant.configure("2") do |config|

  config.vm.box = $box
  if SUPPORTED_OS[$os].has_key? :box_url
    config.vm.box_url = SUPPORTED_OS[$os][:box_url]
  end
  config.ssh.username = SUPPORTED_OS[$os][:user]

  # always use Vagrants insecure key
  config.ssh.insert_key = false

  if ($override_disk_size)
    unless Vagrant.has_plugin?("vagrant-disksize")
      system "vagrant plugin install vagrant-disksize"
    end
    config.disksize.size = $disk_size
  end

(1..$num_instances).each do |i|
  config.vm.define vm_name = "%s-%01d.cloud.priv" % [$instance_name_prefix, i] do |node|
      node.vm.hostname = vm_name

      node.vm.provider :virtualbox do |vb|
        vb.memory = $vm_memory
        vb.cpus = $vm_cpus
        vb.gui = $vm_gui
        vb.linked_clone = true
        vb.customize ["modifyvm", :id, "--vram", "8"] # ubuntu defaults to 256 MB which is a waste of precious RAM
      end

      $forwarded_ports.each do |guest, host|
        node.vm.network "forwarded_port", guest: guest, host: host, auto_correct: true
      end

      node.vm.synced_folder ".", "/vagrant", disabled: false, type: "rsync", rsync__args: ['--verbose', '--archive', '--delete', '-z'] , rsync__exclude: ['.git','venv']
      $shared_folders.each do |src, dst|
        node.vm.synced_folder src, dst, type: "rsync", rsync__args: ['--verbose', '--archive', '--delete', '-z']
      end

      ip = "#{$subnet}.#{i+100}"
      node.vm.network :private_network, ip: ip

      # Disable swap for each vm
      node.vm.provision "shell", inline: "swapoff -a"
  end
end
end
