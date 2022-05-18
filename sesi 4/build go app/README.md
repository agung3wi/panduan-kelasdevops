# Build Image dan Push ke Docker Hub

## Build Docker Image

  1. Build docker image dengan perintah berikut
     ```
     docker build -t go-app .
     ```
  6. Jika sudah berhasil ter-build, kita cek imagenya
     ```
     docker images
     ```
  7. Selanjutnya run docker image yang sudah dibuat dari lokal
     ```
     docker run --name go-app -p 8000:8000 -e APP_NAME=go -d go-app
     ```
     
## Push ke Docker Hub

* [Halaman Docker Hub](https://hub.docker.com/)

 1. Cek Image yang telah kita buat
     ```
     docker images
     ```
 2. Tambahkan tag kedalam Docker image
     ```
     docker tag go-app <username_docker_hub>/go-app:v1
     ```
     atau bisa ditambahkan saat proses build docker image secara langsung
     ```
     docker build -t <username_docker_hub>/go-app:v1 .
     ```
 3. Setelah login, kita lakukan push dengan perintah :
     ```
     docker push <username_docker_hub>/go-app:v1
     ```
 4. Perintah menjalankan image docker melalui docker hub
     ```
     docker run --name go-app -p 8000:8000 -e APP_NAME=go -d <username_docker_hub>/go-app:v1
     ```
