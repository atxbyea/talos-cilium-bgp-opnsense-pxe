### Lets create the base config ###
 
 talosctl gen config clyster https://192.168.1.81:6443 --output-dir ./talosconfig

### Export the talosconfig to current shell and set the endpoint and first node###
 
 export TALOSCONFIG=~/talosgobrrr/talosconfig 
 talosctl config endpoints 192.168.1.81
 talosctl config node 192.168.1.81

### Lets apply the config to the first node ###

 talosctl apply-config --insecure -e 192.168.1.81 --nodes 192.168.1.81 --file ./controlplane.yaml --patch @patch.yaml

### We keep an eye on the status until it is done ###
 
 talosctl dashboard

### Once done with the initial install and bringup, lets bootstrap the first node ###

 talosctl bootstrap

### Then we apply the config to the two remaining nodes ###

 talosctl apply-config --insecure -e 192.168.1.81 --nodes 192.168.1.82 --file ./controlplane.yaml 
 talosctl apply-config --insecure -e 192.168.1.81 --nodes 192.168.1.83 --file ./controlplane.yaml 

### Lets verify that etcd has all members and is healthy ###
 
 talosctl etcd members
 talosctl etcd status

### Again lets check the status ###
 
 talosctl dashboard

### We then pull the kubeconfig ###

talosctl kubeconfig
export KUBECONFIG=$(pwd)/kubeconfig

### We deployed without any CNI, so lets go ahead and deploy cilium with bgp enabled ###

cilium install --version 1.18.5 --set kubeProxyReplacement=true --set bgpControlPlane.enabled=true --set loadBalancer.algorithm=maglev --set ipam.mode=kubernetes --set=securityContext.capabilities.ciliumAgent="{CHOWN,KILL,NET_ADMIN,NET_RAW,IPC_LOCK,SYS_ADMIN,SYS_RESOURCE,DAC_OVERRIDE,FOWNER,SETGID,SETUID}" --set=securityContext.capabilities.cleanCiliumState="{NET_ADMIN,SYS_ADMIN,SYS_RESOURCE}" --set=cgroup.autoMount.enabled=false --set=cgroup.hostRoot=/sys/fs/cgroup  --set=k8sServiceHost=localhost --set=k8sServicePort=7445

### Let it finish and all is good ###

cilium status --wait

### Lets config the peering and pool data for the BGP upstream ###

k apply -f cilium-pool.yaml 
k apply -f cilium-peering.yaml 

### We can check the status of the peering towards the upstream ###

cilium bgp peers

k exec -ti -n kube-system cilium-29gx5 -- cilium-dbg status
k exec -ti -n kube-system cilium-lb77z -- cilium service list
k exec -ti -n kube-system cilium-29gx5 -- cilium bpf lb list

### We'll go ahead and deploy our first test nginx instance ###

k create deploy nginx --image nginx

### Then expose it via the loadbalancer, and if all is well it will get advertised to the upstream ###

k expose pod nginx-5869d7778c-j5z84 --name="nginx-lb" --selector="app=nginx" --port=80 --target-port=80 --type=LoadBalancer



