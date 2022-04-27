# Expose Port & Mounting

* [Dokumentasi resmi Docker](https://docs.docker.com/get-started/)

1. Setelah mengenal beberapa command line docker, langkah awal selanjutnya adalah mencoba memasukan 1 image kedalam docker yang ada
   ```
   docker run -d -p 80:80 docker/getting-started
   ```
   Kemudian cek apakah image sudah masuk kedalam docker dengan `docker ps` dan `docker image`
2. Jalankan perintah berikut untuk memunculkan IPv4 yang digunakan
   ```
   curl ip.me
   ```
   Selanjutnya salin IPv4 yang muncul ke browser, maka akan muncul halaman `Getting started`
