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


## Deploy Manual menggunakan Rsync

Jalankan command `rsync -avz folder_project username@host:path`. Contoh :
```
rsync -avz ./ celine@domain_kamu.xyz:/var/www/domain_kamu/public
```
> Bagi pengguna windows harus menginstal rsync terlebih dahulu, sedangkan di ubuntu sudah ada.

Apabila mengalami kendala seperti gambar dibawah ini :
![image](https://user-images.githubusercontent.com/68054503/166107548-4a511a80-7cce-4c80-880d-fba2d37634ff.png)

