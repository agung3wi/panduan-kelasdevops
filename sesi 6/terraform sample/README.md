# Sample Terraform Code Untuk Berbagai Provider

Berikut ini adalah contoh dari code yang sudah ada untuk provision infra: 
1. [EC2](https://github.com/agung3wi/panduan-kelasdevops/tree/master/sesi%206/terraform%20sample/ec2)
2. [RDS](https://github.com/agung3wi/panduan-kelasdevops/tree/master/sesi%206/terraform%20sample/aws-rds)
3. [Menggunakan Terraform](https://github.com/agung3wi/panduan-kelasdevops/tree/master/sesi%204/build%20java%20app)
4. [Mengenal & Installasi Ansible](https://github.com/agung3wi/panduan-kelasdevops/tree/master/sesi%204/build%20go%20app)
5. [Menggunakan Ansible](https://github.com/agung3wi/panduan-kelasdevops/tree/master/sesi%204/build%20reactjs%20app)

## AWS Provider

Untuk menggunakan Provider AWS, syarat utama yang dibutuhkan adalah menginstall AWS CLI. Installasi AWS CLI dapat dilakukan dengan cara berikut:

Referensi [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

### AWS CLI on Windows

1. Download dan jalankan AWS CLI MSI installer for Windows (64-bit).
[https://awscli.amazonaws.com/AWSCLIV2.msi](https://awscli.amazonaws.com/AWSCLIV2.msi)

Alternatif jika menggunakan msiexec, jalankan di command prompt command berikut:
```
msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi
```

2. Untuk mengkonfirmasi terinsall, dapat dilakukan dengan mengetikan command berikut di command prompt.
```
aws --version
```

### AWS CLI on Mac OS
1. Download dan jalankan AWS CLI macOS pkg file.
[https://awscli.amazonaws.com/AWSCLIV2.pkg](https://awscli.amazonaws.com/AWSCLIV2.pkg)
2. Ikuti instruksi installasi.
3. Untuk mengkonfirmasi terinsall, dapat dilakukan dengan mengetikan command berikut di terminal.
```
aws --version
```


### AWS CLI on Linux
1. Jalankan command berikut di terminal.
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```
2.  Untuk mengkonfirmasi terinsall, dapat dilakukan dengan mengetikan command berikut di terminal.
```
aws --version
```
