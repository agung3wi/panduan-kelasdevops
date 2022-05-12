# Install Database Server

### MySQL
> MySQL adalah sebuah DBMS (Database Management System) menggunakan perintah SQL (Structured Query Language) yang banyak digunakan saat ini dalam pembuatan aplikasi berbasis website.

#### Instalasi MySQL
```
sudo apt install mysql-server
```
Untuk menjalankan SQL 
```
sudo systemctl start mysql.service
```

#### Konfigurasi MySQL
```
sudo mysql_secure_installation
```

> Untuk masuk ke MySQL
```
mysql -u root
```

#### Membuat User MySQL dan mengatur privileges
```
CREATE USER 'username'@'host' IDENTIFIED BY 'password';
```
> **contoh** : `CREATE USER 'bambang'@'%' IDENTIFIED BY 'inipasswordnya';`

Untuk mengatur membuat database
```
CREATE database nama_database;
```
> **contoh** : `CREATE USER 'bambang'@'%' IDENTIFIED BY 'inipasswordnya';`

Untuk mengatur privileges user
```
GRANT ALL PRIVILEGES ON database.table TO 'username'@'host';
```

#### Mengamankan nginx dengan Let’s Encrypt
1. Instalasi Certbot
> Certbot adalah sertifikat SSL gratis yang disediakan oleh Let’s Encrypt
```
sudo apt install certbot python3-certbot-nginx
```

2. Memperoleh sertifikat SSL
```
sudo certbot --nginx -d example.com -d www.example.com
```
