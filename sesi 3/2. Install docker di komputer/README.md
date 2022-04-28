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
