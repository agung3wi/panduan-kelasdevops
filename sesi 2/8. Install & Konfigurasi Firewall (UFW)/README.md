## Install dan Konfigurasi Firewall (UFW)

> Firewall merupakan elemen yang cukup penting untuk keamanan komputer. Ubuntu dilengkapi dengan suatu aplikasi yang mempermudah konfigurasi Firewall. Aplikasi tersebut adalah UFW (Uncomplicated Firewall) yang disajikan sebagai front-end Iptables. UFW biasanya sudah terinstal secara default di Ubuntu versi terbaru. Hanya saja, kemungkinan besar dinonaktifkan.

### Konfigurasi Firewall dengan UWF
1. Aktifkan IPv6. Untuk memastikan IPv6 aktif, dapat dicek melalui file konfigurasi UFW di **/etc/default/ufw**. Buka file dengan menggunakan command `sudo nano /etc/default/ufw`. Ubah value pada IPv6 terset yes, `IPV6=yes`, kemudian simpan file.

2. Cek default kebijakan firewall (firewall policies). Secara default, UFW diatur untuk menolak semua koneksi masuk dan mengizinkan semua koneksi keluar. Berarti siapapun yang mencoba menjangkau servermu tidak akan dapat terhubung, sementara aplikasi apa pun di dalam server dapat menjangkau semua yang ada diluar.

- Untuk melarang semua paket masuk, jalankan:
```
sudo ufw default deny incoming
```

- Untuk mengizinkan semua paket keluar, jalankan :
```
sudo ufw default allow outgoing
```

#### UFW Application Profile. 
UFW telah menyediakan berbagai Application profile yang berisi default rule berbagai aplikasi. Untuk melihat daftar Application profile tersebut dengan menggunakan perintah :
```
sudo ufw app list
```

```
Output
---
Available applications:
  OpenSSH
```

Untuk mengijinkan aplikasi tertentu gunakan perintah `sudo ufw allow nama_aplikasi`, contoh `sudo ufw allow OpenSSH`


#### Mengizinkan SSH berdasarkan Nama Layanan
Cara lain konfigurasi UFW untuk mengizinkan koneksi SSH masuk adalah dengan merujuk nama layanannya: ssh
```
sudo ufw allow ssh
```

#### Mengizinkan SSH berdasarkan Port Number
Cara lain dapat dengan menulis port, dengan perintah 
```
sudo ufw allow 22
```

#### Mengaktifkan UFW
Firewall harus dikonfigurasi untuk mengizinkan koneksi SSH. Untuk memverifikasi rules mana yang ditambahkan, menggunakan perintah
```
sudo ufw show added
```

Untuk mengaktifkan firewall, gunakan :
```
sudo ufw enable
```


