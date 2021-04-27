#!/bin/bash
# kubeadm installation instructions as on
# https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/

pacman -S --needed scponly
scp -i /home/ruihong/.ssh/id_rsa ruihong@control:/home/ruihong/kubelet-bin-1.21.0-1-aarch64.pkg.tar.xz $HOME/
scp -i /home/ruihong/.ssh/id_rsa ruihong@control:/home/ruihong/kubeadm-bin-1.21.0-1-aarch64.pkg.tar.xz $HOME/
scp -i /home/ruihong/.ssh/id_rsa ruihong@control:/home/ruihong/kubectl-bin-1.21.0-1-aarch64.pkg.tar.xz $HOME/


pacman -U --needed $HOME/kubelet-bin-1.21.0-1-aarch64.pkg.tar.xz 
pacman -U --needed $HOME/kubeadm-bin-1.21.0-1-aarch64.pkg.tar.xz 
pacman -U --needed $HOME/kubectl-bin-1.21.0-1-aarch64.pkg.tar.xz


systemctl enable --now kubelet


sysctl --system

