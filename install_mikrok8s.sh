sudo snap install microk8s --classic
sleep 30

microk8s.enable dashboard dns registry metrics-server ingress storage
sleep 30

alias kubectl=microk8s.kubectl
alias docker=microk8s.docker

kubectl get all
docker ps

kubectl completion bash > ~/.kube_completion.sh

sudo bash -c "echo \"$(hostname -i | cut -d ' ' -f 1)  $(hostname -s)\" >> /etc/hosts"
sudo bash -c "sed -i 's/AllowTcpForwarding.*no/AllowTcpForwarding yes/g' /etc/ssh/sshd_config"
sudo bash -c "sed -i 's/GatewayPorts.*no/GatewayPorts yes/g' /etc/ssh/sshd_config"
sudo service sshd restart

cat >> .bashrc <<- EOF
# Microk8s aliases
alias kubectl=microk8s.kubectl
alias docker=microk8s.docker
EOF
