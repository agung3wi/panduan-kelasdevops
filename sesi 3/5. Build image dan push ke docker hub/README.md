# Build Image dan Push ke Docker Hub

## Build Docker Image

  1. Buat direktori terlebih dahulu
     ```
     mkdir php
     ```
  2. Membuat file Dockerfile
     ```
     nano Dockerfile
     ```
  3. Isikan script berikut kedalam Dockerfile dan simpan
     ```
     FROM php:7.4-apache
     WORKDIR /var/www/html
     COPY index.php index.php
     ```
  4. Selanjutnya membuat file index.php dan masukan script sederhana dengan bahasa php
     ```
     nano index.php
     ```
     ```
     <?php
     
     for($i;$i<=10;i++){
        echo "$i<br/>";
     }
     ```
  5. Kemudian build file yang sudah dibuat
     ```
     docker build -t <image_name> .
     ```
  6. Jika sudah berhasil ter-build, kita cek imagenya
     ```
     docker image
     ```
  7. Selanjutnya run docker image yang sudah dibuat
     ```
     docker run --name <container_name> -p 80:80 <image_name>
     ```
     
## Push ke Docker Hub

* [Halaman Docker Hub](https://hub.docker.com/)

 1. Cek Image yang telah kita buat
     ```
     docker image
     ```
 2. Tambahkan tag kedalam Docker image
     ```
     docker tag <image_name> <username_docker_hub>/<image_name>:<tag_name>
     ```
     atau bisa ditambahkan saat proses build docker image
     ```
     docker build -t <username_docker_hub>/<image_name>:<tag_name> .
     ```
 3. Sebelum melakukan push, terlebih dahulu melakukan Login ke Docker hub
     > jika belum terdaftar bisa melakukan registrasi ke halaman [Docker hub](https://hub.docker.com/) dengan memasukan Docker ID, Email, dan Password
     ```
     docker login 
     ```
     Kemudian masukan username dan password
 4. Setelah login, kita lakukan push dengan perintah :
     ```
     docker push <username_docker_hub>/<image_name>:<tag_name>
     ```
 5. Perintah menjalankan image docker melalui docker hub
     ```
     docker run --name <container_name> -p 80:80 -d <username_docker_hub>/<image_name>:<tag_name>
     ```
 6. Perintah jika ingin docker restart tiap saat
     ```
     docker run --name <container_name> -p 80:80 -d --restart always <username_docker_hub>/<image_name>:<tag_name>
     ```
