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

3. Pantau console log


> Apabila gagal pada saat test maka tidak akan dilanjutkan pada stage berikutnya.