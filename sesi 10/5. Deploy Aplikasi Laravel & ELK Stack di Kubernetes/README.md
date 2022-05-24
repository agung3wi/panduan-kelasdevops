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
