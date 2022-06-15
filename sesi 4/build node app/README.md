# Build Image dan Push ke Docker Hub

## Build Docker Image

  1. Build docker image dengan perintah berikut
     ```
     docker build -t node-app .
     ```
  2. Jika sudah berhasil ter-build, kita cek imagenya
     ```
     docker images
     ```
  3. Selanjutnya run docker image yang sudah dibuat dari lokal
     ```
     docker run --name node-app -p 3000:3000 -e APP_NAME=node -d node-app
     ```
     
## Push ke Docker Hub

* [Halaman Docker Hub](https://hub.docker.com/)

 1. Cek Image yang telah kita buat
     ```
     docker images
     ```
 2. Tambahkan tag kedalam Docker image
     ```
     docker tag node-app <username_docker_hub>/node-app:v1
     ```
     atau bisa ditambahkan saat proses build docker image secara langsung
     ```
     docker build -t <username_docker_hub>/node-app:v1 .
     ```
 3. Setelah login, kita lakukan push dengan perintah :
     ```
     docker push <username_docker_hub>/node-app:v1
     ```
 4. Perintah menjalankan image docker melalui docker hub
     ```
     docker run --name node-app -p 3000:3000 -e APP_NAME=node -d <username_docker_hub>/node-app:v1
     ```
