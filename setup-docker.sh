#!/bin/bash
# script that runs 
# https://kubernetes.io/docs/setup/production-environment/container-runtime

pacman -S --needed vim cni-plugins conntrack-tools socat ebtables ethtool bash-completion

# notice that only verified versions of Docker may be installed
# verify the documentation to check if a more recent version is available

[ ! -d /etc/docker ] && mkdir /etc/docker

cat > /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2",
  "storage-opts": [
    "overlay2.override_kernel_check=true"
  ]
}
EOF


cat >> /etc/hosts << EOF
{
   192.168.0.93 control.vondedata.com control
   192.168.0.99 worker99.vondedata.com worker99
   192.168.0.100 control.vondedata.com worker100
   192.168.0.101 control.vondedata.com woker101
}
EOF

mkdir -p /etc/systemd/system/docker.service.d

systemctl daemon-reload
systemctl restart docker
systemctl enable docker
