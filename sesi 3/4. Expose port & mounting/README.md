# Expose Port & Mounting

* [Dokumentasi resmi Docker](https://docs.docker.com/get-started/)
* [Dokumentasi volumes Docker](https://docs.docker.com/storage/volumes/)

## Expose Port

1. Langkah awal adalah mencoba memasukan 1 image kedalam docker yang sudah ada dengan perintah berikut
   ```
   docker run -d -p 80:80 docker/getting-started
   ```
   > -p 80:80 merupakan map port dari host ke port 80 yang ada di container

2. Kemudian cek apakah image sudah masuk kedalam docker dengan `docker ps` dan `docker image`
   
3. Jalankan perintah berikut untuk memunculkan IPv4 yang digunakan
   ```
   curl ip.me
   ```
   Selanjutnya salin IPv4 yang muncul ke browser, maka akan muncul halaman `Getting started`
   

## Mounting
Mounting merupakan salah satu cara untuk memanage data yang ada di dalam docker. Jika menggunakan mounting, ketika container terhapus maka data tidak akan hilang karena data sudah di manage keluar dari host.

## Penggunaan Mounting

1. Langkah pertama adalah membuat direktori baru
   ```
   mkdir data-mysql
   ```
2. Masuk ke direktori baru
   ```
   cd data-mysql/
   ```
3. Jalankan perintah untuk melakukan mounting
   ```
   docker run --name mysql -e MYSQL_ROOT_PASSWORD=123456 -d -p 3306:3306 -v /root/data-mysql:/var/lib/mysql mysql:5.7
   ```
