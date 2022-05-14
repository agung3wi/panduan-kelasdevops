# Install Kubernetes di Lokal dengan Minikube

## Install Minikube

[Referensi](https://minikube.sigs.k8s.io/docs/start/)

Yang dibutuhkan sebelum installasi
- 2 CPUs or more
- 2GB of free memory
- 20GB of free disk space
- Internet connection
- Container or virtual machine manager, such as: Docker, Hyperkit, Hyper-V, KVM, Parallels, Podman, VirtualBox, or VMware Fusion/Workstation.

## Install di Windows

1. Download file berikut [latest release](https://storage.googleapis.com/minikube/releases/latest/minikube-installer.exe)
atau dengan menjalankan command
```
New-Item -Path 'c:\' -Name 'minikube' -ItemType Directory -Force
Invoke-WebRequest -OutFile 'c:\minikube\minikube.exe' -Uri 'https://github.com/kubernetes/minikube/releases/latest/download/minikube-windows-amd64.exe' -UseBasicParsing
```

2. Tambahkan file binary ke PATH
Jalankan pada PowerShell dengan Run As Administrator
```
$oldPath = [Environment]::GetEnvironmentVariable('Path', [EnvironmentVariableTarget]::Machine)
if ($oldPath.Split(';') -inotcontains 'C:\minikube'){ `
  [Environment]::SetEnvironmentVariable('Path', $('{0};C:\minikube' -f $oldPath), [EnvironmentVariableTarget]::Machine) `
}
```

## Install di MAC OS

Jalankan di terminal perintah berikut
```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64
sudo install minikube-darwin-amd64 /usr/local/bin/minikube
```

## Install di Linux

Jalankan di terminal perintah berikut
```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

## Membuat Cluster di Minikube

1. Jalankan pada terminal untuk membuat cluster
```
minikube start --nodes 2 -p multinode-demo
```

Jika ingin lebih multi node
```
minikube start --nodes 2 -p multinode-demo
```

Jika ingin spesifik driver
```
minikube start --driver docker
```
2. Hapus Cluster
```
minikube delete
```




