# Deploy Aplikasi Laravel di VPS dengan CI/CD tools lain (Gitlab CI, Github Action)

## Deploy Aplikasi Laravel dengan Github Action

1. Non aktifkan / uncheck `Generic Webhook Trigger` di Build Triggers Pipeline pada Jenkins
2. Pada Github, masuk ke tab Action > klik `set up a workflow yourself`
3. Rename file menjadi `deploy.yml`

   <img width="750" alt="Screen Shot 2022-05-13 at 17 54 09" src="https://user-images.githubusercontent.com/38523284/168269143-9cad9441-bd9f-475f-87b8-f446863076ff.png">

4. Masukan sintaks kode berikut :
   ```
   name : Laravel
   
   on:
      push:
         branches: [master]
      pull_request:
         branches: [master]
         
   jobs:
      deploy:
         runs-on: ubuntu-latest
         steps:
            - name: Checkout
              uses: actions/checkout@v2
            - uses: "shivammathur/setup-php@v2"
              with:
               php-version: "7-4"
            - uses: "ramsey/composer-install@v1"
              with:
               composer-options: ""
            - name: Sync
              env:
                dest: "ubuntu@54.251.5.36:~/prod.kelasdevops.xyz/"
              run: |
                echo "${{secrets.DEPLOY_KEY}}" > ~/deploy_key
                chmod 600 ~/deploy_key
                rsync -chav --delete \
                  -e 'ssh -i ~/deploy_key -o StrictHostKeyChecking=no' \
                  --exclude ~/deploy_key \
                  --exclude .git/ \
                  --exclude .github/ \
                  --exclude storage/ \
                  --exclude .env \
                  ./ ${{env.dest}}
   ```

5. Klik tombol **Start Commit**
6. Selanjutnya adalah men-setting variable `HOST` dan `DEPLOY_KEY`. Masuk ke tab Settings > Secrets > Actions > Klik New repository secret. Kemudian isikan seperti gambar berikut :
   
   Pada variable HOST, value nya adalah alamat IP Jenkins anda :
   
   <img width="600" alt="Screen Shot 2022-05-13 at 18 57 03" src="https://user-images.githubusercontent.com/38523284/168278462-74e4a1ec-b390-47d0-9390-7e7764f1d661.png">
   
   Pada variable DEPLOY_KEY, value nya adalah private key SSH, yang dapat diakses dengan perintah `cat ~/prod` di terminal
   
   <img width="600" alt="Screen Shot 2022-05-13 at 18 58 04" src="https://user-images.githubusercontent.com/38523284/168278877-4a8bf4df-68cb-46e9-8b80-aa711712c23f.png">

7. Kemudian kembali ke tab menu `Action` untuk melihat workflow
8. Tunggu proses workflow sampai finish / success akan ada centang hijau, seperti gambar berikut
   
   <img width="716" alt="Screen Shot 2022-05-17 at 09 07 48" src="https://user-images.githubusercontent.com/38523284/168713801-d80e209a-3f94-4b97-9435-22525ff86f33.png">

