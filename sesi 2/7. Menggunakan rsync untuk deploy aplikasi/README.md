# Menggunakan rsync untuk deploy aplikasi


## Deploy aplikasi Laravel
> Tentang Laravel selengkapnya dapat dipelajari [disini](https://laravel.com/docs)

Pada materi kali ini, project Laravel yang digunakan bisa di-*clone* [disini](https://github.com/teknoaplikasi/bootcamp-laravel)

1. Clone project Laravel ini ke local.
```
git clone https://github.com/teknoaplikasi/bootcamp-laravel
```

2. Setelah ter-clone, install *package-package* dalam composer dengan menjalankan *command* ini.
```
composer install
```

3. Untuk menjalankan project gunakan *command* ini.
```
php artisan serve
```


## Mengautorisasi User

Masuk ke ssh dengan user tadi. 
```
ssh username@host
```

Untuk masuk ke ssh dibutuhkan permission, pastikan private key dan public key ada di device kalian dengan menggunakan command
```
cd ~/.ssh/
ls -la
```

Cari file `id_rsa` dan `id_rsa.pub`. Apabila kedua file tersebut belum ada, generate terlebih dahulu  
```
ssh-keygen -t rsa
``` 
> Passphrase optional

Lihat lalu copy public key di **id_rsa.pub**. Public key ini akan digunakan untuk mengautorisasi user di server.
```
cat id_rsa.pub
```

Masuk ke server dengan user kalian. Buat folder ssh dan masukkan public key yang sudah dicopy tadi
```
mkdir -p ~/.ssh/
echo "public_key" >> .ssh/authorized_keys
```

Jika sudah lakukan pengetesan ssh dengan user kalian. Coba masuk ke ssh kalian
```
ssh username@host
```

## Install Composer di Ubuntu
Install composer terlebih dahulu apabila belum tersedia. Untuk menginstall composer di ubuntu, tutorial lengkap dapat dilihat [disini](https://getcomposer.org/download/)
```
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
```
```
sudo mv composer.phar /usr/local/bin/composer
```


## Deploy Manual menggunakan Rsync

Jalankan command `rsync -avz folder_project username@host:path`. Contoh :
```
rsync -avz ./ celine@domain_kamu.xyz:/var/www/domain_kamu/public
```
> Bagi pengguna windows harus menginstal rsync terlebih dahulu, sedangkan di ubuntu sudah ada.

Tambahkan script berikut ke konfigurasi sites-enabled. Penjelasan lebih lanjut bisa dilihat [disini](https://laravel.com/docs/9.x/deployment#nginx)
```
location / {
    try_files $uri $uri/ /index.php?$query_string;
}
```


Masuk ke direktori project di server
```
composer install
php artisan migrate
```

### Membuat script deploy.sh
Urutan script deploy.sh
1. script rsync
2. script composer install

Atur hak akses file deploy.sh
```
chmod +x deploy.sh
```






