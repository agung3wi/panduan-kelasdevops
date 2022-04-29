# Mengenal & Installasi Ansible

Ansible merupakan tool yang digunkaan untuk mensetup infrastruktur. Dimana kita dapat mencatat setiap melakukan konfigurasi ke beberapa server sekaligus. Misal saat pertama kali kita memasang Ubuntu Server di 10 mesin, maka kita akan melakuan apt-get update serta memasang beberapa komponen seperti PHP5 dan Apache2. Sebenarnya tidak akan menjadi masalah, bila kita hanya melakukan sedikit hal. Tapi tentunya tidak efektif. Dengan ansible, kita bisa melakukanya dalam satu langkah.


## Install Ansible di Windows

Di Windows, Secara default kita tidak dapat menjalankan ansible. Kita dapat menjalankan ansible di bawah WSL (Windows Subsystem Linux).
[Install Ansible di Windows](https://docs.ansible.com/ansible/latest/user_guide/windows_faq.html#windows-faq-ansible).

## Install di Linux (Ubuntu)

1. Jalankan command berikut di Terminal 
```
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
```

2. jalankan comand berikut
```
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
$ sudo apt update
$ sudo apt install ansible

```

## Install di MAC OS

Installasi di MAC OS, menggunakan pip. Untuk menjalankan pip kita harus memiliki python terlebih dahulu.


1. Pertama install PIP
```
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py --user
```

2. Install ansible dengan pip
```
pip install ansible
```