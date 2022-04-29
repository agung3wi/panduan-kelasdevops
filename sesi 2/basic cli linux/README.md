# Basic CLI di Linux

Berikut adalah command-command yang penting di linux untuk dipelajari

## ls
```
ls
```
Command ls digunakan untuk menampilkan daftar file dan folder di dalam folder.

## cd
```
cd
```
Command untuk menjelajahi file dan direktori Linux. Command ini memerlukan path penuh atau nama direktori, tergantung pada direktori yang digunakan saat ini.
Beberapa shorcut untuk memudahkan navigasi.
- **cd** => ingin langsung membuka folder.
- **cd ..** => untuk memindahkan satu direktori ke atas.
- **cd-** => untuk berpindah ke direktori sebelumnya.

## cat 
```
cat
```
Kependekan dari *concatenate*. Command untuk membuat file, melihat isi file, menggabungkan file dan mengarahkan output di terminal atau file. Penggunaan command cat diikuti dengan nama dan ekstensi file.
- **cat** => untuk membuat file baru.
- **cat filename1 filename2>filename3** => untuk menggabungkan beberapa *(file 1 dan file 2)* dan menyimpan outputnya di file baru *(file 3)*.
- **cat filename | tr a-z A-Z >output.txt** => untuk mengonversi file ke penggunaan huruf besar atau huruf kecil.

## grep
```
grep
```
Command untuk mencari teks dalam file.

## su / sudo
```
sudo
```
Command ini berfungsi untuk menjalankan task yang memerlukan hak akses (permission) administrative atau root. 
- su => **Super User** atau *root*
- sudo => singkatan dari **SuperUser Do** atau user biasa dapat bertindak sebagai super user. 
- sudo su => hanya dapat dilakukan jika user memiliki akses root. Berbeda dengan sudo, sudo su akan terus berlaku hingga user menutup terminal, sehingga user tidak perlu untuk memasukkan password berkali-kali.

## pwd
```
pwd
```
Command pwd digunakan untuk melihat directory (folder) saat ini.
