# Install dan Konfigurasi Jenkins

## Install Jenkins
* [Referensi Install Jenkins](https://www.jenkins.io/doc/book/installing/)

1. Siapkan instance di AWS dengan ketentuan yang sesuai dengan minimum requirement penginstalan jenkins
   - Menggunakan Ubuntu Server 20.04 LTS (HVM), SSD Volume Type (Free Tier)
     
     <img width="350" alt="Screen Shot 2022-05-11 at 14 27 49" src="https://user-images.githubusercontent.com/38523284/167793340-04b0bbc3-a8fa-4d11-96b1-397b969b7292.png">

   - Pilih tipe instance t2.medium dengan 2 vCPU dan 4GiB Memory
     
     <img width="350" alt="Screen Shot 2022-05-11 at 14 28 08" src="https://user-images.githubusercontent.com/38523284/167793376-393ac4c1-5997-4879-9441-418d62144e75.png">

   - Edit network setting, pada segmen firewall pilih `select existing security group` kemudian pada security group, pilih `allow all`
     
     <img width="350" alt="Screen Shot 2022-05-11 at 14 28 40" src="https://user-images.githubusercontent.com/38523284/167793401-6bfd67d6-e61a-45a0-90ba-283c8eaaf99c.png">

   - Ganti Configure Storage menjadi 20 GiB
     
     <img width="350" alt="Screen Shot 2022-05-11 at 14 28 20" src="https://user-images.githubusercontent.com/38523284/167793443-fe960d2d-e38f-4786-9822-c85dfbc3ddae.png">

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
10. Jalankan jenkins di browser dengan port sesuai yang tertera pada detail containernya, maka akan tampil laman berikut :
    <img width="400" alt="Screen Shot 2022-05-11 at 14 21 36" src="https://user-images.githubusercontent.com/38523284/167792244-bdcf6cad-5247-4e56-a41e-7fa2a6c00079.png">

12. Saat pertama kali akses jenkins, anda wajib untuk memasukan `administrator password` yang dapat diakses dengan sintaks berikut
    ```
    docker exec -it jenkins-blueocean cat /var/jenkins_home/secrets/initialAdminPassword
    ```
12. Setelah memasukan `administrator password` kemudian akan masuk ke jendela `Getting started`
    - Pilih `install suggested plugins` pada segmen Customize Jenkins, kemudian tunggu sampai instalasi plugin selesai
      
      <img width="350" alt="Screen Shot 2022-05-11 at 14 31 10" src="https://user-images.githubusercontent.com/38523284/167793753-984c0dfd-7af1-4900-819a-b9a46836ff94.png">

    - Selanjutnya pada `Create First Admin User` silahkan masukan username, password, full name, dan email address kemudian ***Save and Continue***
      
      <img width="350" alt="Screen Shot 2022-05-11 at 14 32 04" src="https://user-images.githubusercontent.com/38523284/167793883-51b159d0-680d-4f22-b62a-6b9c7c58303f.png">

    - Pada `Instance Configuration` langsung Save saja
    - Jenkins anda siap digunakan
      
      <img width="350" alt="Screen Shot 2022-05-11 at 14 32 45" src="https://user-images.githubusercontent.com/38523284/167793994-87b67a7d-d13e-4eb8-9b3e-be1dfb07fce4.png">


-----
## Konfigurasi Jenkins

1. Masuk ke menu `Manage Jenkins` pada side menu sebelah kiri
   
   <img width="180" alt="Screen Shot 2022-05-11 at 14 35 59" src="https://user-images.githubusercontent.com/38523284/167794538-543f42ce-9ade-449c-9535-a9ff9d4b2bb7.png">

2. Kemudian klik `Manage Plugins`, di Plugin Manager pilih filter ke Available
   
   <img width="300" alt="Screen Shot 2022-05-11 at 14 37 02" src="https://user-images.githubusercontent.com/38523284/167794729-9c990e89-ab3b-4493-9ccf-113764fc2db0.png"> 
   <img width="350" alt="Screen Shot 2022-05-11 at 14 37 11" src="https://user-images.githubusercontent.com/38523284/167794765-44737d25-b552-4755-ab04-848b68250bf9.png">

3. Pertama, install plugin `ssh agent`, checklis pada plugnin nya dan klik tombol `install without restart`
   > fungsi dari `ssh agent` untuk memudahkan melakukan ssh ke suatu server
   
   <img width="1153" alt="Screen Shot 2022-05-11 at 14 40 54" src="https://user-images.githubusercontent.com/38523284/167795370-632d75ee-9f50-40ca-bea5-a84044358ed0.png">

4. Kedua, install plugin `Generic Webhook Trigger`
   > fungsi dari `Generic Webhook Trigger` untuk memudahkan menjalankan jenkins hanya dengan 1 triger
   
   <img width="1152" alt="Screen Shot 2022-05-11 at 14 43 40" src="https://user-images.githubusercontent.com/38523284/167796221-526e0767-c439-4867-b178-5536dd52bb62.png">

5. Ketiga, install plugin `Environmental Injector`
   > fungsi dari `Environmental Injector` untuk memudahkan dalam menambah environment didalam jenkins

   <img width="1138" alt="Screen Shot 2022-05-11 at 14 48 41" src="https://user-images.githubusercontent.com/38523284/167797095-60897bcf-1569-4580-abab-468b907f8367.png">
