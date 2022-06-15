# Deploy Aplikasi Laravel & ELK Stack di Kubernetes

1. Pada file deployment `01_deployment.yml` tambahkan seperti gambar berikut
   ```
   - name: ELASTIC_APM_SERVER_URL
     value: "http://122.248.217.58:8200"
   - name: ELASTIC_APM_SERVICE_NAME
     value: "Laravel"
   ```
   Kemudian tinggal kita `apply`
   
   
2. Perintah untuk mendeploy aplikasi ELK Stack ke Kubernetes
   ```
   kubectl apply -f 01_deployment.yml
   ```
3. Pastikan `pod` nya sudah terganti / memiliki status `running` semua, yang dapat di cek menggunakan perintah berikut
   ```
   kubectl get pod
   ```
   
   Sampai menjadi seperti gambar berikut, status menunjukan `running` semua
   
   <img width="800" alt="Screen Shot 2022-05-25 at 00 15 31" src="https://user-images.githubusercontent.com/38523284/170094171-ea807e76-6e6f-42b7-b087-80a26f8e8e74.png">

