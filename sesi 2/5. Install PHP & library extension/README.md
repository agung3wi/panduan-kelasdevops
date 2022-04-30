# Install PHP & library extension

> [Referensi](https://www.digitalocean.com/community/tutorials/how-to-install-php-7-4-and-set-up-a-local-development-environment-on-ubuntu-20-04)

#### Instalasi PHP Apache
1. Masuk ke root `sudo su`
2. Install repository `ppa:ondrej/php`.  
```
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
```
> Bagi yang menggunakan vps aws, bisa melewati step ini (menambah repository).

3. Install php 7.4
```
sudo apt install php7.4-fpm
```

4. Mengecek versi yang terinstall
```
php -v
```

#### Instalasi PHP Module
Selain menginstall PHP, beberapa tambahan PHP modules juga dapat ditambahkan atau diinstall. `sudo apt-get install php7.4-PACKAGE_NAME`. Ubah **PACKAGE_NAME** dengan package yang ingin diinstall.
```
sudo apt-get install -y php7.4-cli php7.4-json php7.4-common php7.4-mysql php7.4-zip php7.4-gd php7.4-mbstring php7.4-curl php7.4-xml php7.4-bcmath
```

Untuk melihat modul-modul yang telah terinstal
```
php -m
```

#### Konfigurasi
Tambahkan script dibawah ini ke file konfigurasi nginx yang sebelumnya dibuat **(/etc/nginx/sites-enabled/)**
> Tambahkan `index.php`, menjadi 
```
index index.php index.html index.htm;
```
> Tambahkan juga script dibawah ini
```
location ~ \.php$ {
     include snippets/fastcgi-php.conf;
     fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
}
```

#### Testing
Untuk menguji konfigurasi PHP yang telah diatur, buat PHP script dengan fungsi **phpinfo()** *(atau fungsi PHP lain)* pada file index.php
Contoh :
```
<?php
    echo 'Hello World!';
?>
```
