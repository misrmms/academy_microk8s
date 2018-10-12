#!/bin/sh
# 
# File:   install_microk8s.sh
# Author: Thomas Wetzler
#
# Created on 10.10.2018, 10:28:38
#

# Install kubectl
curl -Lo ~/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl 
chmod +x ~/bin/kubectl
sudo mv ~/bin/kubectl /usr/bin/

# Install kubectl Bash-compleation 
sudo yum -y install bash-completion
echo "source <(kubectl completion bash)" >> ~/.bashrc

# Install SNAP
# https://computingforgeeks.com/install-snapd-snap-applications-centos-7/
sudo yum -y install epel-release
sudo yum -y install yum-plugin-copr
sudo yum -y copr enable ngompa/snapcore-el7
sudo yum -y install snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

# Install microk8s
# https://microk8s.io/
sudo snap install microk8s --classic --channel=1.12/stable

# List all installed snaps
sudo snap list

# Alias kubectl
#snap alias microk8s.kubectl kubectl

# Write Config File for Kubectrl
/var/lib/snapd/snap/bin/microk8s.kubectl config view --raw > $HOME/.kube/config

# Set Path Variable
export PATH=$PATH:/var/lib/snapd/snap/bin/

# Change .bashrc
cat >> .bashrc <<- EOF
# Some aliases
unalias ls 2>/dev/null
alias docker='/var/lib/snapd/snap/bin/microk8s.docker'

export PATH=$PATH:/var/lib/snapd/snap/bin/

EOF

# Services enablen
/var/lib/snapd/snap/bin/microk8s.enable dashboard dns registry metrics-server ingress storage 


