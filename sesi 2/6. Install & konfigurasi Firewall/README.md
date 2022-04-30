# Install & konfigurasi Firewall

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
mkdir folder_name
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

8. Menambahkan konfigurasi idle.sh. Tambahkan script berikut ke idle.sh  `nano ~/idle.sh`
```
#!/bin/bash
while true
do 
	# Echo current date to stdout
	echo `date`
	# Echo 'error!' to stderr
	echo 'error!' >&2
	sleep 1
done
```

9. File Konfigurasi untuk supervisor biasanya berada di `/etc/supervisor/conf.d`. 
> Format file .conf
```
sudo nano /etc/supervisor/conf.d/idle.conf
```
Tambahkan script berikut :
```
[program:nodejs]
user=agung
command=node /home/agung/nodejs/server.js
autostart=true
autorestart=true
stderr_logfile=/var/log/idle.err.log
stdout_logfile=/var/log/idle.out.log
```

10. Start supervisor
```
sudo supervisorctl reread
```
```
sudo supervisorctl update
```
```
sudo supervisorctl start nodejs
```

