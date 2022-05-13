# Install & konfigurasi Nodejs di Server

### Instalasi node.js di Ubuntu
```
sudo apt install nodejs
```

Selain nodejs, install juga npm package
```
sudo apt install npm
```


> Pada materi kali ini kita akan menggunakan framework expressjs, dokumentasi expresjs dapat diakses [disini](https://expressjs.com/)


### Buat folder untuk project nodejs
1. Buat folder untuk project nodejs
```
mkdir nodejs.kelasdevops.xyz
```
2. Masuk ke folder tersebut, lalu buat file .env
```
nano .env
```
3. Memulai project nodejs
```
npm init
npm install --save express
```
4. Tambahkan file server.js untuk membuat hello world
```
nano server.js
```

> Hello world nodejs
```
const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
```

5. Untuk menjalankan, gunakan command
```
node server.js
```

6. Testing
##### Didalam server
Masuk ke user ssh yang lain, lalu cek dengan
```
curl localhost:3000
```

##### Diluar server
```
host:3000
```

> Agar server.js running terus dan ketika server di restart tetap jalan, dibutuhkan *supervisor*. Lebih lanjut cek [disini](https://www.digitalocean.com/community/tutorials/how-to-install-and-manage-supervisor-on-ubuntu-and-debian-vps).

7. Install supervisor
```
sudo apt install supervisor
```

8. File Konfigurasi untuk supervisor biasanya berada di `/etc/supervisor/conf.d`. 
> Format file .conf
```
sudo nano /etc/supervisor/conf.d/nodejs.conf
```
Tambahkan script berikut :
```
[program:nodejs]
user=ubuntu
command=node /home/ubuntu/nodejs.kelasdevops.xyz/server.js
autostart=true
autorestart=true
stderr_logfile=/var/log/nodejs.err.log
stdout_logfile=/var/log/nodejs.out.log
```

9. Start supervisor
```
sudo supervisorctl reread
```
```
sudo supervisorctl update
```
```
sudo supervisorctl start nodejs
```

10. Buat konfigurasi di **/etc/nginx/sites-enabled/** untuk project nodejs
```
server {
    root /home/ubuntu/nodejs.kelasdevops.xyz/public;
    server_name nodejs.kelasdevops.xyz;

    location / {
        proxy_pass http://127.0.0.1:3000/;

        proxy_set_header Upgrade           $http_upgrade;
        proxy_set_header Connection        "upgrade";
        proxy_set_header Host              $host;
        proxy_set_header X-Real-IP         $remote_addr;
        proxy_set_header X-Forwarded-For   $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header X-Forwarded-Host  $host;
        proxy_set_header X-Forwarded-Port  $server_port;
    }

    listen 80;
    listen [::]:80;
}
```

11. Tambahkan DNS record nodejs.kelasdevops.xyz A record mengarah ke IP Address Server.

