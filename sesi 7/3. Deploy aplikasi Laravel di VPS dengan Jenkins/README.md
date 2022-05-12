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
           docker.image('composer:latest').inside('-u root') {
               sh 'composer install'
           }
       }


       // Testing
       docker.image('ubuntu').inside('-u root') {
          sh 'echo "Ini adalah test"'
       }

       // deploy env prod
       docker.image('agung3wi/alpine-rsync:1.1').inside('-u root') {
           // sshagent (credentials: ['ssh-prod']) {
           //     sh 'mkdir -p ~/.ssh'
           //     sh 'ssh-keyscan -H "prod.kelasdevops.xyz" > ~/.ssh/known_hosts'
           //     sh "rsync -rav --delete ./laravel/ ubuntu@prod.kelasdevops.xyz:/home/ubuntu/prod.kelasdevops.xyz/ --exclude=.env --exclude=storage --exclude=.git"
           //     sh "ssh ubuntu@prod.kelasdevops.xyz 'cd ~/prod.kelasdevops.xyz/ && rm composer.lock && composer install'"
           // }
       }
   }
   ```

3. Selanjutnya adalah melakukan build pipeline, dengan klik menu `build now` pada side bar jenkins
   
   <img width="220" alt="Screen Shot 2022-05-12 at 14 25 23" src="https://user-images.githubusercontent.com/38523284/168022564-5ba13cde-1463-4fec-a5d4-d85454955b28.png">

   Kemudian urutan bawah side menu di bagian Build History akan muncul progres buildnya, klik untuk melihat detail build
   
   <img width="220" alt="Screen Shot 2022-05-12 at 14 25 55" src="https://user-images.githubusercontent.com/38523284/168022982-5ed22e53-2ae5-4a2f-9556-994a3661e3f0.png">

4. 
