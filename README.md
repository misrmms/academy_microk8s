# academy_microk8s
<h1>Installation Script for microk8s</h1>
<P>
In short, microk8s is designed to be a fast and lightweight upstream Kubernetes 
install isolated from your host but not via a virtual machine. This isolation is
achieved by packaging all the upstream binaries for Kubernetes, Docker.io, 
iptables, and CNI in a single snap package. The snap package is an application 
container?—?you can imagine this as a lighter weight version of a Docker 
container. It uses a lot of the same underlying technologies for isolation just 
without all the overhead of network isolation.
<P>
<h2>Installing SNAP on Centos</h2><br>
   https://computingforgeeks.com/install-snapd-snap-applications-centos-7/
<P>
<h2>Installing Kubernetes (microk8s)</h2><br>
   https://microk8s.io/<br>
microk8s installs a barebones upstream Kubernetes. This means just the api-server, controller-manager, scheduler, kubelet, cni, kube-proxy are installed and run. 
Additional services like kube-dns and dashboard can be run using the microk8s.enable command. <br>
    > microk8s.enable dns dashboard
<P>
<h2>User Interface</h2>
   URL http://127.0.0.1:8080/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/overview?namespace=default

<h2>Information of Kubernetes Installation</h2><br>
    >  microk8s.kubectl cluster-info<br>

<P>
<h2>Path to microk8s.* Binaries</h2><br>
    /var/lib/snapd/snap/bin/
<P>
<h2>Start nginx Containers</h2><br>
    > microk8s.kubectl get all --all-namespaces
    > microk8s.kubectl run nginx --image nginx --replicas 3<br>
    > microk8s.kubectl expose deployment nginx --port 80 --target-port 80 --type ClusterIP --selector=run=nginx --name nginx<br>
    > microk8s.kubectl get all<br>
    > microk8s.kubectl get svc<br>
    > curl http://localhost<br>
<p>
<h2>Remove nginx </h2><br>
    > microk8s.kubectl delete deployment/nginx<br>
    > microk8s.kubectl get all<br>
    > microk8s.kubectl delete svc/nginx
<p>
<h2>Troubleshoot microk8s</h2><br>
    > microk8s.inspect
<p>
<h2>Restart microk8s</h2><br>
    > sudo snap disable microk8s
    > sudo snap enable microk8s
<P>
<h2>Remove microk8s</h2><br>
    > microk8s.disable dashboard dns<br>
    > sudo snap remove microk8s<br>
<p>
