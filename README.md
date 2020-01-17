# Readable & Writable

[Typora](https://www.typora.io/) will give you a seamless experience as both a reader and a writer. It removes the preview window, mode switcher, syntax symbols of markdown source code, and all other unnecessary distractions. Replace them with a real live preview feature to help you concentrate on the content itself.

## Usage

```powershell
ssh-keygen -t rsa
ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.1.3

# Install pip for Ubuntu
sudo apt install python-pip

# Install dependencies from ``requirements.txt`
sudo pip install -r requirements.txt --download ~/offline_packages
sudo pip download -r requirements.txt -d ~/offline_packages
sudo pip install -r requirements.txt --trusted-host 10.4.5.93 --no-index --find-links=http://10.4.5.93/public/software/offline_packages/

# Copy ``inventory/sample`` as ``inventory/mycluster``
cp -rfp inventory/sample inventory/mycluster

# Update Ansible inventory file with inventory builder
declare -a IPS=(10.10.1.3 10.10.1.4 10.10.1.5)
CONFIG_FILE=inventory/mycluster/hosts.yml python3 contrib/inventory_builder/inventory.py ${IPS[@]}

# Review and change parameters under ``inventory/mycluster/group_vars``
cat inventory/mycluster/group_vars/all/all.yml
cat inventory/mycluster/group_vars/k8s-cluster/k8s-cluster.yml

# Deploy Kubespray with Ansible Playbook - run the playbook as root
# The option `-b` is required, as for example writing SSL keys in /etc/,
# installing packages and interacting with various systemd daemons.
# Without -b the playbook will fail to run!
ansible-playbook -i inventory/mycluster/hosts.ini --become --become-user=root cluster.yml
```

## Debug
```sbtshell
ansible -i inventory/cloudstack/inventory.ini all -m debug -a "msg={{ inventory_hostname.split('.')|first }}"
```