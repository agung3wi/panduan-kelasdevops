# Install dan Konfigurasi Jenkins

## Install Jenkins
* [Referensi Install Jenkins](https://www.jenkins.io/doc/book/installing/)

1. Siapkan instance di AWS dengan ketentuan yang sesuai dengan minimum requirement penginstalan jenkins
   - Menggunakan Ubuntu Server 20.04 LTS (HVM), SSD Volume Type (Free Tier)
   - Pilih tipe instance t2.medium dengan 2 vCPU dan 4GiB Memory
   - Edit network setting, pada segmen firewall pilih `select existing security group` kemudian pada security group, pilih `allow all`
   - Ganti Configure Storage menjadi 20 GiB
2. Login SSH menggunakan IPv4 yang terdapat pada detail instance
3. Masuk ke folder `devopsapril/ansible'
4. Kemudian ubah nomor IP yang terdapat di file `hosts` dengan menggunakan `nano`
5. Dilanjutkan menginstall docker terlebih dahulu
   ```
   ansible-playbook -i hosts install_docker.yml
   ```
6. Setelah selesai install docker, dilanjutkan menginstall jenkins dengan menggunakan sintaks berikut
   ```
   docker network create jenkins
   ```
7. Untuk menjalankan perintah Docker di dalam node Jenkins, unduh dan jalankan gambar `docker:dind` Docker menggunakan perintah run docker berikut:
   ```
   docker run \
    --name jenkins-docker \
    --rm \
    --detach \
    --privileged \
    --network jenkins \
    --network-alias docker \
    --env DOCKER_TLS_CERTDIR=/certs \
    --volume jenkins-docker-certs:/certs/client \
    --volume jenkins-data:/var/jenkins_home \
    --publish 2376:2376 \
    docker:dind \
    --storage-driver overlay2
   ```
8. Selanjutnya kita akan membuat Docker File, dengan mengeksekusi 2 langkah berikut
   ```
   nano Dockerfile
   ```
   Salin sintaks berikut dan masukan ke dalam `Dockerfile` setelah perintah `nano`
   ```
   FROM jenkins/jenkins:2.332.3-jdk11
    USER root
    RUN apt-get update && apt-get install -y lsb-release
    RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
      https://download.docker.com/linux/debian/gpg
    RUN echo "deb [arch=$(dpkg --print-architecture) \
      signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
      https://download.docker.com/linux/debian \
      $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
    RUN apt-get update && apt-get install -y docker-ce-cli
    USER jenkins
    RUN jenkins-plugin-cli --plugins "blueocean:1.25.3 docker-workflow:1.28"
   ```
   
   Buat docker image baru dari Dockerfile ini dan tetapkan gambar tersebut dengan nama yang bermakna, mis. "myjenkins-blueocean:2.332.3-1":
   ```
   docker build -t myjenkins-blueocean:2.332.3-1 .
   ```
9. Setelah langkah membuat Dockerfile selesai, kita akan menjalankan/ run `myjenkins-blueocean:2.332.3-1` image sebagai container di Docker
   ```
   docker run \
    --name jenkins-blueocean \
    --rm \
    --detach \
    --network jenkins \
    --env DOCKER_HOST=tcp://docker:2376 \
    --env DOCKER_CERT_PATH=/certs/client \
    --env DOCKER_TLS_VERIFY=1 \
    --publish 8080:8080 \
    --publish 50000:50000 \
    --volume jenkins-data:/var/jenkins_home \
    --volume jenkins-docker-certs:/certs/client:ro \
    myjenkins-blueocean:2.332.3-1 
   ```
10. Jalankan jenkins di browser dengan port sesuai yang tertera pada detail containernya
11. Saat pertama kali akses jenkins, anda wajib untuk memasukan `administrator password` yang dapat diakses dengan sintaks berikut
    ```
    docker exec -it jenkins-blueocean cat /var/jenkins_home/secrets/initialAdminPassword
    ```
12. Setelah memasukan `administrator password` kemudian akan masuk ke jendela `Getting started`
    - Pilih `install suggested plugins` pada segmen Customize Jenkins, kemudian tunggu sampai instalasi plugin selesai
    - Selanjutnya pada `Create First Admin User` silahkan masukan username, password, full name, dan email address kemudian ***Save and Continue***
    - Pada `Instance Configuration` langsung Save saja
    - Jenkins anda siap digunakan

-----
## Konfigurasi Jenkins
