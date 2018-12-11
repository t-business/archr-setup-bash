#!/bin/bash

# Install docker
sudo apt-get remove docker docker-engine docker.io
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce
sudo usermod -aG docker $USER
 
# Install virtualenv
sudo apt install \
    python3-pip \
    virtualenv 
sudo -H pip3 install --upgrade pip
mkdir ~/.virtualenvs
sudo apt-get install virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
# Need to add this to the .bashrc: . /usr/local/bin/virtualenvwrapper.sh
cd $HOME

# Download and install angr and archr dependencies
mkvirtualenv angr
sudo -H pip3 install angr
wget https://files.pythonhosted.org/packages/f4/b1/c72d2878d7194aed66beefce1ae15010e03eacb1a9d577940778bd12e59a/shellphish_qemu-0.9.10-py2.py3-none-manylinux1_x86_64.whl#sha256=43998561a57e976610d65b87adc0a3c8d9af1f7a17a948a17b00f7c6f7bf563f
sudo -H pip3 install shellphish_qemu-0.9.10-py2.py3
sudo apt-get install \
    scrypt \
    python-oslo-log \
    gdb \
    libssl-dev
sudo -H pip3 uninstall python-dateutil 
sudo -H pip3 uninstall six
sudo -H pip3 uninstall idna
sudo -H pip3 install \
    docker \
    nclib \
    pygdbmi \
    shellphish_qemu-0.9.10-py2.py3-none-manylinux1_x86_64.whl \
    python-dateutil \
    six idna==2.5

# Try installing keystone-engine below...if not work then
# Install using https://github.com/keystone-engine/keystone/blob/master/docs/COMPILE-NIX.md
sudo apt-get install keystone-engine

# Install archr
git clone https://github.com/angr/archr.git
cd archr
python3 setup.py build
sudo python3 setup.py install
mkdir /tmp/archr_mounts/


