# Mengenal & Installasi Terraform

Terraform dikembangkan oleh HashiCorp yang merupakan tools infrastruktur as a code sebagai alat yang memungkinkan untuk membuat, mengubah, dan meningkatkan infrastuktur dengan aman dan dapat diprediksi. Terraform dikembangkan dalam bahasa Go.
Terraform mendukung provision di berbagai provider cloud yang besar seperti AWS, GCP, Azure, bahkan DigitalOcean.

Referensi [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli).

## Install Terraform di Windows

Di Windows, install terraform bisa dilakukan dengan choco, Jika kita sudah menginstall
[Chocolatey](https://chocolatey.org/).

```
choco install terraform
```

Jika anda belum menginstall chocolatey, maka terlebih dahulu install chocolatey. Installasi Choco dapat dilakukan dengan cara berikut:

1. Buka CMD dengan Run sebagai Administrator.
2. Ketikan command berikut
```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```
3. Jika tidak ada error kita bisa mengetikan di CMD
```
choco -
```


## Install di Linux (Ubuntu)

1. Install curl dan software properties common.
```
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
```
2. Tambahkan GPG key
```
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
```
3. Tambahkan Repository untuk terraform
```
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
```
4. Install terraform package
```
sudo apt-get update && sudo apt-get install terraform
```
5. Konfirmasi Installasi degan mengetikan
```
terraform -help
```

## Install di MAC OS

Kita bisa menggunakan Homebrew untuk MAC OS, berikut langkah2 installasi Terraform di MAC OS:

1. Pertama install hashicorp tap dahulu
```
brew tap hashicorp/tap
```
2. Install terraform dengan brew
```
brew install hashicorp/tap/terraform
```
3. Konfirmasi Installasi degan mengetikan
```
terraform -help
```