# Build Image dan Push ke Docker Hub

## Build Docker Image

  1. Build docker image dengan perintah berikut
     ```
     docker build -t java-app .
     ```
  6. Jika sudah berhasil ter-build, kita cek imagenya
     ```
     docker images
     ```
  7. Selanjutnya run docker image yang sudah dibuat dari lokal
     ```
     docker run --name java-app -p 8080:8080 -e APP_NAME=java -d java-app
     ```
     
## Push ke Docker Hub

* [Halaman Docker Hub](https://hub.docker.com/)

 1. Cek Image yang telah kita buat
     ```
     docker images
     ```
 2. Tambahkan tag kedalam Docker image
     ```
     docker tag java-app <username_docker_hub>/java-app:v1
     ```
     atau bisa ditambahkan saat proses build docker image secara langsung
     ```
     docker build -t <username_docker_hub>/java-app:v1 .
     ```
 3. Setelah login, kita lakukan push dengan perintah :
     ```
     docker push <username_docker_hub>/java-app:v1
     ```
 4. Perintah menjalankan image docker melalui docker hub
     ```
     docker run --name java-app -p 8080:8080 -e APP_NAME=java -d <username_docker_hub>/java-app:v1
     ```
