# Deploy aplikasi Laravel di VPS dengan Jenkins

## Cara membuat pipeline di jenkins

1. Pilih menu `New Item` pada side menu sebelah kiri
   
   <img width="220" alt="Screen Shot 2022-05-11 at 16 15 39" src="https://user-images.githubusercontent.com/38523284/167814995-233be125-72d8-44c9-8232-976fd97a105b.png">

2. Kemudian akan muncul jendela create pipeline. Isikan nama item nya, pilih pipeline, dan OK
   
   <img width="650" alt="Screen Shot 2022-05-11 at 16 18 49" src="https://user-images.githubusercontent.com/38523284/167815822-74c985a3-b28a-4589-b1b3-40322214892c.png">

3. Selanjutnya akan muncul laman setting seperti gambar berikut dengan tab General, Build Triggers, Advanced Project Options, dan Pipeline
   
   <img width="650" alt="Screen Shot 2022-05-12 at 10 59 11" src="https://user-images.githubusercontent.com/38523284/167989295-72af0633-2aab-426d-aca6-8df0b73385ff.png">

4. Di tab Pipeline bagian Definition diganti menjadi `Pipeline script from SCM`
   
   <img width="650" alt="Screen Shot 2022-05-12 at 10 51 44" src="https://user-images.githubusercontent.com/38523284/167989540-8ba4db12-9b8c-4906-878e-5340dc25efe3.png">

5. Untuk SCM nya bisa diganti pilihannya menjadi GIT
   
   <img width="650" alt="Screen Shot 2022-05-12 at 10 51 58" src="https://user-images.githubusercontent.com/38523284/167989768-2180ca7e-87a9-489d-8899-ff03492b9bb6.png">

6. Untuk repositoriesnya bisa diisikan link github devops-laravel
   
   <img width="650" alt="Screen Shot 2022-05-12 at 11 09 00" src="https://user-images.githubusercontent.com/38523284/167990290-42e96f92-8145-4d58-ba85-7aabfd99c6aa.png">

   * Disini terdapat pilihan untuk credential, ini diperuntukan jika repositories yang dicantumkan merupakan repo private. Jika demikian maka terlebih dahulu perlu ditambahkan `Jenkins Credentials Provider` nya
     
     <img width="344" alt="Screen Shot 2022-05-12 at 10 53 21" src="https://user-images.githubusercontent.com/38523284/167990502-849e2067-8cb6-47a4-ae14-71547630ca2c.png">
  
   * Kemudian akan muncul form untuk `Jenkins Credentials Provider`. Isikan username sesuai dengan git yang diinginkan, untuk bagian password diisikan ***personal access tokens*** yang bisa dibuat melalui git masing - masing dengan langkah : *masuk ke git anda > dropdown menu profile > Settings > Developer settings > Personal access tokens > Generate new token.*
     
     <img width="650" alt="Screen Shot 2022-05-12 at 10 53 59" src="https://user-images.githubusercontent.com/38523284/167991208-d55c8933-cf5c-4def-8ac0-81495312c280.png">

7. Selanjutnya adalah mengisikan branch untuk buildnya. Branch nya di setting sesuai dengan branch aktif yang diinginkan.
   
   <img width="650" alt="Screen Shot 2022-05-12 at 10 54 58" src="https://user-images.githubusercontent.com/38523284/167991601-1765b271-dac8-4164-b2fc-93004709d67a.png">

8. Pada isian Script path tetap diisikan Jenkinsfile
   
   <img width="650" alt="Screen Shot 2022-05-12 at 10 55 17" src="https://user-images.githubusercontent.com/38523284/167991908-c03b7258-59c2-43d2-b454-ad5a462723fc.png">

9. Simpan pengaturan.

## Cara menjalankan Pipeline Jenkins
* [User Handbook Pipeline](https://www.jenkins.io/doc/book/pipeline/)
* [Referensi Jenkinsfile content](https://raw.githubusercontent.com/agung3wi/kelasdevops/master/Jenkinsfile)

1. Buat file `Jenkinsfile` di dalam `DEVOPSAPRIL-LARAVEL` dengan menggunakan code editor untuk mengisikan script agar pipeline bisa berjalan
2. Pada Jenkinsfile, copy-kan script berikut
   ```
   node {
       checkout scm

       // deploy env dev
       stage("Build"){
           docker.image('shippingdocker/php-composer:7.4').inside('-u root') {
               sh 'rm composer.lock'
               sh 'composer install'
           }
       }


       // Testing
       docker.image('ubuntu').inside('-u root') {
          sh 'echo "Ini adalah test"'
       }
   }
   ```

3. Selanjutnya adalah melakukan build pipeline, dengan klik menu `build now` pada side bar jenkins
   
   <img width="220" alt="Screen Shot 2022-05-12 at 14 25 23" src="https://user-images.githubusercontent.com/38523284/168022564-5ba13cde-1463-4fec-a5d4-d85454955b28.png">

   Kemudian urutan bawah side menu di bagian Build History akan muncul progres buildnya, klik untuk melihat detail build
   
   <img width="220" alt="Screen Shot 2022-05-12 at 14 25 55" src="https://user-images.githubusercontent.com/38523284/168022982-5ed22e53-2ae5-4a2f-9556-994a3661e3f0.png">

4. Pada side menu detail build, klik console output nya untuk melihat detail proses dari buildnya
   
   <img width="220" alt="Screen Shot 2022-05-12 at 15 10 23" src="https://user-images.githubusercontent.com/38523284/168023780-9a13a7fc-df06-4155-bf4f-1227f7a1ac55.png">

5. Kemudian menuju ke terminal, kita akan menyiapkan 2 host yaitu untuk development dan production. Dengan menambah menggunakan perintah `nano` dan `ansible-playbook`
   ```
   ansible-playbook -i hosts create_hosts.yml
   ```
   Jika berhasil maka akan muncuk 2 host seperti gambar berikut :
   
   <img width="500" alt="Screen Shot 2022-05-13 at 10 46 33" src="https://user-images.githubusercontent.com/38523284/168207381-4f5f2d43-5ce1-4964-898e-62b85842fb7b.png">

6. Selanjutnya kita akan men-generate public dan private key untuk dimasukan ke dalam jenkins
   ```
   ssh-keygen -f prod -t rsa
   ```
   Setelah muncul 2 file baru yaitu `prod` dan `prod-pub`, kemudian salin file `prod-pub` ke `.ssh/authorized_keys`
   ```
   cat prod-pub >> .ssh/authorized_keys
   ```
   Kemudian untuk file `prod` yang berisi private key, kita salin isi private key nya dan akan kita masukan di jenkins
   ```
   cat prod
   ```
   
7. Memasukan private key ke jenkins yaitu dengan mengakses side menu *Manage Jenkins > Manage Credentials*. Kemudian akan muncul laman seperti gambar berikut
   
   <img width="750" alt="Screen Shot 2022-05-13 at 11 00 28" src="https://user-images.githubusercontent.com/38523284/168208657-f63fe86c-9ba1-4683-95b0-fc2fa68aa569.png">

8. Pada bagian `Stores scope to Jenkins` klik bagian tulisan `Global` pada kolom Domains
   
   <img width="350" alt="Screen Shot 2022-05-13 at 11 02 12" src="https://user-images.githubusercontent.com/38523284/168209351-adc45144-8fff-4672-8e58-79ea71cab1eb.png">
   
9. Setelah itu pilih `Add Credential` dan isikan sesuai gambar berikut
   
   <img width="750" alt="Screen Shot 2022-05-13 at 11 03 47" src="https://user-images.githubusercontent.com/38523284/168210340-02e695d1-6c13-4e0b-aa58-bb221f08dd27.png">
   
   Untuk private key bisa dimasukan ke field key nya
   
   <img width="750" alt="Screen Shot 2022-05-13 at 11 05 42" src="https://user-images.githubusercontent.com/38523284/168211439-b9bf7f48-75e9-49fa-af04-af1fd04ac7bf.png">

10. Pada script di `Jenkinsfile` tambahkan *deploy env project* setelah *Testing*
    ```
    // deploy env prod
       docker.image('agung3wi/alpine-rsync:1.1').inside('-u root') {
           sshagent (credentials: ['ssh-prod']) {
              sh 'mkdir -p ~/.ssh'
              sh 'ssh-keyscan -H "$PROD_HOST" > ~/.ssh/known_hosts'
              sh "rsync -rav --delete ./laravel/ ubuntu@$PROD_HOST:/home/ubuntu/prod.kelasdevops.xyz/ --exclude=.env --exclude=storage --exclude=.git"
           }
       }
    ```
    
11. Untuk mengaktifkan perintah `deploy` diperlukan setting di pipeline jenkins-nya. Dengan mengakses Klik Pipeline laravel-dev > Configure > Pada tab General checklis di *prepare an environment for the run*
    
    <img width="350" alt="Screen Shot 2022-05-13 at 11 48 55" src="https://user-images.githubusercontent.com/38523284/168213306-7179ba15-0c21-44ac-882c-c1af366c2b59.png">

    Kemudian pada `Properties Content` isikan PROD_HOST diikuti dengan IPv4 nya
    
    <img width="750" alt="Screen Shot 2022-05-13 at 12 13 45" src="https://user-images.githubusercontent.com/38523284/168215637-1eb479d7-bb16-4342-853e-e85e32ced826.png">

12. Selanjutnya Build lagi Pipeline laravel-dev nya dan dipantau Console Output-nya
    
    <img width="350" alt="Screen Shot 2022-05-13 at 13 23 02" src="https://user-images.githubusercontent.com/38523284/168223372-b72a7338-f72c-440c-9eac-3a469a242c8e.png">
    
14. Setelah proses build selesai, kembali ke terminal kemudian masuk ke `prod.kelasdevops.xyz`
    ```
    cd prod.kelasdevops.xyz
    ```
    
    Kemudian tambahkan file `.env`
    ```
    cp .env.example .env
    ```
    
    Dilanjutkan perintah untuk generate key
    ```
    php artisan key:generate
    ```
    
    Jika generate sudah berhasil, selanjutnya kita bagian `DB_DATABASE`, `DB_USERNAME`, `DB_PASSWORD` file `.env` dengan perintah nano
    ```
    nano .env
    ```
    <img width="230" alt="Screen Shot 2022-05-13 at 12 42 33" src="https://user-images.githubusercontent.com/38523284/168218709-b83777fc-324b-44ed-8bd2-da0c4521bb63.png">

14. Selanjutnya adalah migrasi data
    ```
    php artisan migrate
    ```

## Cara Build Pipeline secara Otomatis

1. Sebelumnya perlu dilakukan konfigurasi lagi pada pipeline-nya, dengan cara akses ke menu Configure > di Build Trigger checklis pada `Generic Webhook Trigger` > Isikan Token (diisi sesuai yang diinginkan)
   
   <img width="350" alt="Screen Shot 2022-05-13 at 16 52 49" src="https://user-images.githubusercontent.com/38523284/168259324-180be710-0374-451b-9e1a-a2a49b515b5f.png">

   <img width="750" alt="Screen Shot 2022-05-13 at 16 54 13" src="https://user-images.githubusercontent.com/38523284/168259539-f4a7655f-2b0d-4fe9-9a46-cb5260c94591.png">

2. Kemudian kita setting automatisasi di Github. Akses ke Settings > Webhooks > Add Webhooks.
   Isikan `Payload URL` dengan ketentuan link berikut :
   ```
   http://JENKINS_URL/generic-webhook-trigger/invoke?token=TOKEN_JENKINS
   ```
   `token` diisikan dengan Token yang ada di Configurasi Pipeline, dan Jenkins_URL diisikan dengan link jenkins -> `http://54.151.151.148:8080/generic-webhook-trigger/invoke?token=deploy-laravel-dev`
