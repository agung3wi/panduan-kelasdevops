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

Catatan :
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

# Inisiasi Docker

Jika Docker sudah berhasil terinstall, silahkan ikuti langkah - langkah berikut :

1. Siapkan instance di Amazon Web Services (AWS) Layanan EC2
   > Jika sudah memiliki instance free tier, disarankan terlebih dahulu di berhentikan `Stop Instance` kemudian baru buat instance baru.

2. Selanjutnya membuat `Key pairs` baru. (Jika sebelumnya sudah memiliki private key dan public key di local)
   - Masuk menu Key pair
   - Pilih dropdown `Actions` di bagian kanan atas, kemudian akan muncul jendela `Import key pair`

3. Isikan nama, dan paste kan public key yang anda miliki ke text box yang tersedia
   - Cara mengecek public key yang dimiliki, silahkan ketik line code berikut ke command prompt :
   
     ```
     cat ~/.ssh/id_rsa.pub
     ```
4. 
