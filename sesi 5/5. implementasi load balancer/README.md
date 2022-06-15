# Sesi 5 - Implementasi Load Balancer

1. Jalankan aplikasi laravel dengan
     ```
     docker run --name laravel-app -p 7000:80 -d <username_docker_hub>/laravel-app:v1
     ```
2. Jalankan aplikasi laravel kedua dengan
     ```
     docker run --name laravel-app -p 8000:80 -d <username_docker_hub>/laravel-app:v1
     ```
3. Jalankan aplikasi laravel kedua dengan
     ```
     docker run --name laravel-app -p 9000:80 -d <username_docker_hub>/laravel-app:v1
     ```
4. Buat Load balancer dengan settingan berikut.
    [source](https://raw.githubusercontent.com/agung3wi/panduan-kelasdevops/master/sesi%205/5.%20implementasi%load%20balancer/nginx.conf).

