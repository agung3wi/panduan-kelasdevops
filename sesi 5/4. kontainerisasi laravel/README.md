# Sesi 5 - Kontainerisasi Laravel 

Langkah-langkah untuk mengkontainerisasi laravel cukup mudah:
1. Tambahkan Dockerfile dari source berikut ini ke dalam project laravel yang baru. [source](https://raw.githubusercontent.com/agung3wi/panduan-kelasdevops/master/sesi%205/4.%20kontainerisasi%20laravel/Dockerfile).
2. Build docker image dengan perintah berikut
     ```
     docker build -t laravel-app .
     ```
3. Jika sudah berhasil ter-build, kita cek imagenya
     ```
     docker images
     ```
4. Selanjutnya run docker image yang sudah dibuat dari lokal
     ```
     docker run --name laravel-app -p 3000:80 -d laravel-app
     ```
5. Push ke Docker Hub
    ```
    docker push <username_docker_hub>/laravel-app:v1
    ```