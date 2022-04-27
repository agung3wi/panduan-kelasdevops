# Command Line Docker
Berikut adalah beberapa command line yang ada di Docker

### 1. Perintah untuk mengetahui daftar dari kontainer yang ada di dalam Docker
- Untuk mengecek hanya kontainer yang aktif
  ```
  docker ps
  ```
- Untuk mengecek semua kontainer yang ada di dalam Docker
  ```
  docker ps -a
  ```
### 2. Perintah untuk mengetahui daftar image yang telah di pull (local)
```
docker images
```
### 3. Perintah untuk menghapus salah satu container di dalam Docker
```
docker rm <container_id>
```
### 4. Perintah untuk menghapus container yang sedang berjalan/ running
```
docker rm <container_id> --force
```
### 5. Perintah untuk menjalankan kembali container
```
docker restart <container_id>
```

## Memulai dengan Docker
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
   
