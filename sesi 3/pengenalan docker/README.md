# Docker

* [Referensi Install Postgre SQL Pada Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart-id)
* [Referensi Install Apache](https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-ubuntu-20-04-id)
* [Referensi Install Docker](https://docs.docker.com/get-docker)
* [Docker Hub](hub.docker.com)

## Pengertian Docker

Docker adalah platform perangkat lunak yang memungkinkan Anda membuat, menguji, dan menerapkan aplikasi dengan cepat. Docker mengemas perangkat lunak ke dalam unit standar yang disebut kontainer yang memiliki semua yang diperlukan perangkat lunak agar dapat berfungsi termasuk pustaka, alat sistem, kode, dan waktu proses. Dengan menggunakan Docker, Anda dapat dengan cepat menerapkan dan menskalakan aplikasi ke lingkungan apa pun dan yakin bahwa kode Anda akan berjalan.

### Perbedaan Container dan Visual Machine
| No | Container | Visual Machine |
| :--: | :------- | :------------ |
| 1 | Ringan | Berat |
| 2 | Ukuran Kecil | Ukuran Besar |
| 3 | Resource Fleksible | Resource Terbatas |

# System requirements

### WSL 2 backend

- Windows 11 64-bit: Home atau Pro versi 21H2 atau lebih tinggi, atau Enterprise atau Education versi 21H2 atau lebih tinggi.
- Windows 10 64-bit: Home atau Pro 2004 (build 19041) atau lebih tinggi, atau Enterprise atau Education 1909 (build 18363) atau lebih tinggi.
- Aktifkan fitur WSL 2 di Windows
- Prasyarat perangkat keras berikut diperlukan untuk berhasil menjalankan WSL 2 di Windows 10 atau Windows 11 :
  - Prosesor 64-bit dengan Terjemahan Alamat Tingkat Kedua (SLAT)
  - RAM sistem 4GB
  - Dukungan virtualisasi perangkat keras tingkat BIOS harus diaktifkan di pengaturan BIOS
- Unduh dan instal paket pembaruan kernel Linux.

### Hyper-V backend and Windows containers

- Windows 11 64-bit: Pro versi 21H2 atau lebih tinggi, atau Enterprise atau Education versi 21H2 atau lebih tinggi.
- Windows 10 64-bit: Pro 2004 (build 19041) atau lebih tinggi, atau Enterprise atau Education 1909 (build 18363) atau lebih tinggi.
- Fitur Windows Hyper-V dan Containers harus diaktifkan.
- Prasyarat perangkat keras berikut diperlukan untuk berhasil menjalankan Client Hyper-V di Windows 10 :
  - Prosesor 64 bit dengan Terjemahan Alamat Tingkat Kedua (SLAT)
  - RAM sistem 4GB
  - Dukungan virtualisasi perangkat keras tingkat BIOS harus diaktifkan di pengaturan BIOS

### Catatan :
> Docker hanya mendukung Docker Desktop di Windows untuk versi Windows 10 yang masih dalam garis waktu servis Microsoft.

# Install Docker

* [Referensi Install Docker Windows](https://docs.docker.com/desktop/windows/install/)
* [Referensi Video Youtube Install Docker Windows](https://youtu.be/_9AWYlt86B8)
* [Referensi Video Youtube Install Docker Windows 2](https://youtu.be/x3KEcEp5paQ)
* [Referensi Install Docker Mac](https://docs.docker.com/desktop/mac/install/)

## Install Docker dari installer

1. Double click **Docker Desktop Installer.exe** untuk menjalankan penginstal.
   > Jika Anda belum mengunduh penginstal `(Docker Desktop Installer.exe)`, Anda bisa mendapatkannya dari [Docker Hub.](https://docs.docker.com/desktop/windows/install/) Biasanya mengunduh ke folder Unduhan Anda, atau Anda dapat menjalankannya dari bilah unduhan terbaru di bagian bawah browser web Anda.

2. Saat diminta, pastikan opsi Gunakan **WSL 2** alih-alih Hyper-V pada halaman Konfigurasi, dipilih atau tidak tergantung pada pilihan backend Anda.
   > Jika sistem Anda hanya mendukung salah satu dari dua opsi, Anda tidak akan dapat memilih backend mana yang akan digunakan.

3. Ikuti instruksi penginstalan (accept the license, authorize the installer, and proceed with the install)
4. Jika penginstalan berhasil, klik Tutup untuk menyelesaikan proses penginstalan. Jika dibutuhkan lakukan reboot/ restart

## Install Docker dari Command Line

1. Setelah mengunduh file `Docker Desktop Installer.exe`, jalankan perintah berikut di command line windows anda :
   
   ```
   start /w "" "Docker Desktop Installer.exe" install
   ```

## Install Docker Engine di Ubuntu

* [Referensi Instal Docker Ubuntu](https://docs.docker.com/engine/install/ubuntu/)

1. Setelah instance Launch, copy IPv4 didalam detail instance untuk melakukan login menggunakan SSH
2. Ketikan perintah berikut untuk melakukan login dengan SSH
   ```
   ssh ubuntu@13.213.58.47
   ```
   > untuk `13.213.58.47` bisa disesuaikan dengan IPv4 yang anda miliki

3. Selanjutnya kita akan menginstal Docker Engine di Ubuntu.

### Setup repositori

1. Langkah pertama, wajib melakukan `apt update`
   ```
   sudo apt-get update
   ```
   Kemudian perintah berikut :
   ```
   sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
   ```
2. Selanjutnya menambahkan GPG key resmi Docker
   ```
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
   ```
3. Dilanjutkan menambahkan sources Docker list
   ```
   echo \
   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   ```
   
### Instal Docker Engine

1. Langkah awal, perlu dilakukan pembaruan indeks paket apt, dan instal versi terbaru Docker Engine, containerd, dan Docker Compose
   ```
   sudo apt-get update
   ```
   Kemudian install dengan perintah berikut :
   ```
   sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
   ```
2. Atau jika ingin menginstal versi spesifik Docker Engine, bisa menggunakan perintah berikut :
   - Pertama lakukan list versi yang sudah tersedia di repo anda
   ```
   apt-cache madison docker-ce
   ```
   - Selanjutnya instal versi spesifik dari Docker Engine yang diinginkan. Contoh `5:18.09.1~3-0~ubuntu-xenial`
   ```
   sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io docker-compose-plugin
   ```
3. Untuk mengecek versi dan build dari Docker Engine :
   ```
   docker -v
   ```
4. Kemudian menampilkan semua kontainer yang sedang berjalan dengan perintah berikut :
   ```
   docker ps -a
   ```
   Jika menemukan **error** `permission denied` seperti line ini :
   > Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker .sock: Get "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/containers/json?all=1": dial unix /var/run/dock er.sock: connect: permission denied
   
   Maka langsung saja akses melalui root dengan perintah berikut :
   ```
   sudo su
   ```

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
   
# Docker Compose
Docker compose maksudnya adalah kita dapat menjalankan 1 docker dengan multicontainer akan kita config dalam 1 file 
* [Template Docker Compose](https://github.com/agung3wi/docker-compose-template)

### Perintah untuk menjalankan Docker setelah memiliki template Docker Compose
- Jika memiliki file spesifik dengan nama `docker-compose.yml`
```
docker-compose up -d
```
- Jika memiliki nama file spesifik lain
```
docker-compose -f <nama_file.yml> up -d
```


`end of Session 3`
