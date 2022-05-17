# Implementasi Automation Test On CI

> Continuous Integration (CI) adalah praktik pengembangan di mana pengembang sering mengintegrasikan kode ke dalam repositori bersama, sebaiknya beberapa kali sehari.

Implementasi automation test dalam CI sama halnya dengan mengintegrasikan application code, automation test code juga harus diintegrasikan sebelum nantinya di jalankan untuk memastikan application code yang sudah di integrasikan berjalan sesuai dengan apa yang diharapkan dan menemukan bug jika memang ada.

1. Tambahkan script testing berikut ke Jenkinsfile
```
// Testing Pertama - Unit Test
stage("Test") {
  docker.image('php:7.4-cli').inside('-u root') {
    sh 'php artisan test --testsuite=Unit'
  }
}
```

Untuk integration test di environment development. Tambahkan script berikut :
```
// Testing Kedua - Integration Unit
stage("Test") {
  docker.image('agung3wi/alpine-rsync:1.1').inside('-u root') {
    sshagent (credentials: ['ssh-prod']) {
      sh 'mkdir -p ~/.ssh'
      sh 'ssh-keyscan -H "$PROD_HOST" > ~/.ssh/known_hosts'
      sh "'ssh ubuntu@PROD_HOST 'cd /home/ubuntu/dev.kelasdevops.xyz/ && php artisan test --testsuite=Feature'"
    }
  }
}
```

2. Kemudian buka Jenkins dan build ulang project

![8-build](https://user-images.githubusercontent.com/68054503/168617366-ae807f73-d656-445d-b6fe-0a89d3bdf588.png)


3. Pantau console log
**Unit test**

![8-testing result](https://user-images.githubusercontent.com/68054503/168617417-9a843dc0-d243-4636-8fcc-6c2f7cff9ea7.png)



**Feature test**

![8-testing result 2](https://user-images.githubusercontent.com/68054503/168617466-06e11278-d628-43d6-a4fc-c850a9dca070.png)




> Apabila gagal pada saat test maka tidak akan dilanjutkan pada stage berikutnya.

![8-stage view](https://user-images.githubusercontent.com/68054503/168617681-7a121633-9d18-4b10-97c2-cdea2fdd82b0.png)
