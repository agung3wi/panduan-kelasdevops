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
