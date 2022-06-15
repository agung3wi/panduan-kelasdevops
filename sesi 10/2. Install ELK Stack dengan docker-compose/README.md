# Install ELK Stack dengan docker-compose

[File Referensi Github ELK Stack](https://github.com/agung3wi/elk-stack)

1. Siapkan VM (Instance) di AWS untuk ELK Stack
   - Gunakan tipe instance large, karena untuk menjalankan ElasticSearch lumayan berat
 
     <img width="420" alt="Screen Shot 2022-05-24 at 22 34 57" src="https://user-images.githubusercontent.com/38523284/170075452-4a3f9081-c99a-4185-b5e0-71b90c08e00c.png">

2. Selanjutnya masuk menggunakan SSH dan IPv4 dari instance yang telah dibuat
3. Setelah login SSH, dilanjutkan untuk update apt-get
   ```
   sudo apt-get update
   ```
4. Dilanjutkan install docker
   [Referensi Cara Menginstal dan Menggunakan Docker pada Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04-id)
6. Setelah docker terinstall jalankan perintah berikut
   ```
   docker-compose up -d
   ```
