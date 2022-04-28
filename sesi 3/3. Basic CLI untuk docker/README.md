# Basic CLI untuk Docker

* [Referensi Basic CLI Docker](https://docs.docker.com/engine/reference/run/)
* [Referensi Common CLI Docker](https://docs.docker.com/engine/reference/commandline/docker/)

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
### 6. Perintah untuk melihat content container menggunakan bash
```
docker exec -it <container_name> bash
```
atau
```
docker exec -it <container_id> bash
```
