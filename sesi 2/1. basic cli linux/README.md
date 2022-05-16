# Basic CLI di Linux

Berikut adalah command-command yang penting di linux untuk dipelajari

### ls
```
ls
```
Command ls digunakan untuk menampilkan daftar file dan folder di dalam folder.

### cd
```
cd
```
Command untuk menjelajahi file dan direktori Linux. Command ini memerlukan path penuh atau nama direktori, tergantung pada direktori yang digunakan saat ini.
Beberapa shorcut untuk memudahkan navigasi.
- **cd** => ingin langsung membuka folder.
- **cd ..** => untuk memindahkan satu direktori ke atas.
- **cd-** => untuk berpindah ke direktori sebelumnya.

### cat 
```
cat
```
Kependekan dari *concatenate*. Command untuk membuat file, melihat isi file, menggabungkan file dan mengarahkan output di terminal atau file. Penggunaan command cat diikuti dengan nama dan ekstensi file.
- **cat** => untuk membuat file baru.
- **cat filename1 filename2>filename3** => untuk menggabungkan beberapa *(file 1 dan file 2)* dan menyimpan outputnya di file baru *(file 3)*.
- **cat filename | tr a-z A-Z >output.txt** => untuk mengonversi file ke penggunaan huruf besar atau huruf kecil.

### grep
```
grep
```
Command untuk mencari teks dalam file.

### pwd
```
pwd
```
Command pwd digunakan untuk melihat directory (folder) saat ini.

### su / sudo
```
sudo
```
Command ini berfungsi untuk menjalankan task yang memerlukan hak akses (permission) administrative atau root. 
- su => **Super User** atau *root*
- sudo => singkatan dari **Super User Do** atau user biasa dapat bertindak sebagai super user. 
- sudo su => hanya dapat dilakukan jika user memiliki akses root. Berbeda dengan sudo, sudo su akan terus berlaku hingga user menutup terminal, sehingga user tidak perlu untuk memasukkan password berkali-kali.

### passwd
```
passwd 
```
Command untuk mengubah password user. User biasa hanya bisa mengubah passwordnya sendiri, sedangkan root dapat mengubah password pengguna lain juga.

### nano
```
nano
```
Command ini digunakan untuk membuat file. 
Editor teks nano biasanya sudah diinstal pada macOS dan di sebagian besar distro Linux. Untuk mengecek apakah nano sudah terinstall dapat menggunakan command 
```
nano --version
```

### cp
```
cp
```
Command untuk menyalin file dari direktori saat ini ke direktori yang berbeda. 

### mv
```
mv
```
Command untuk memindah file ke direktori lain. Penggunaan command ini dengan mengetikkan **mv nama_file direktori_tujuan**.

### mkdir
```
mkdir
```
Command untuk membuat direktori.

### rmdir
```
rmdir
```
Command untuk menghapus direktori, namun hanya boleh digunakan untuk menghapus direktori kosong.

### rm
```
rm
```
Command untuk menghapus file dalam direktori atau direktori.
- **rm filename** => menghapus file
- **rm –r** => menghapus direktori beserta file didalamnya.

### chmod
```
chmod
```
Perintah dasar Linux lainnya yang digunakan untuk membaca, menulis, dan menjalankan permission (hak akses) file dan direktori. Urutan perintahnya adalah **chmod opsi_izin_akses nama_file**. Contoh: *chmod 744 script.sh*
- Angka pertama untuk pengguna yang terkait dengan file.
- Angka kedua untuk group yang terkait dengan file.
- Angka ketiga untuk semua yang bukan merupakan bagian dari user atau grup.

Octal Notation | Permission | Symbolic Representation
--- | --- | ---
0 |	No Permission	| ---
1	| Execute Permission Only	| --x
2	| Write Permission Only	| -w-
3	| Write and Execute Permissions (1+2)=3 |	-wx
4	| Read Permission Only	| r--
5	| Read and Execute Permissions (1+4)=5 |	r-x
6	| Read and Write Permissions (2+4)=6 |	rw-
7	| Read, Write and Execute Permissions, Means Full Permissions (1+2+4)=7 |	rwx

Lebih lanjut mengenai chmod silahkan baca [disini] (https://www.computerhope.com/unix/uchmod.htm)

### chown
```
chown
```
Command untuk mengubah atau mentransfer kepemilikan file atau folder untuk user atau grup tertentu.

### echo
```
echo
```
Command untuk menampilkan teks atau string ke output standar atau file. Selain itu command echo dapat digunakan untuk memasukkan data (yang biasanya berbentuk teks) ke dalam file.
- **echo kalimat_yang_ditulis** => menampilkan teks.
- **echo kalimat_yang_ditulis > nama_file.txt** => menambahkan teks pada sebuah file

### wc
```
wc
```
Command untuk mengetahui jumlah baris baru, jumlah kata, jumlah byte dan karakter dalam file.
- **wc -l** => Mencetak jumlah baris dalam file.
- **wc -w** => Mencetak jumlah kata dalam file.
- **wc -c** => Mencetak jumlah byte dalam file.
- **wc -m** => Mencetak jumlah karakter dalam file.
- **wc -L** => Mencetak panjang baris terpanjang dalam file.

### man
```
man
```
Command untuk melihat referensi dari sebuah command.

### history
```
history
```
Command untuk menampilkan perintah yang digunakan sebelumnya.

---

### **Referensi commmand lainnya dapat dilihat [disini](https://hackr.io/blog/basic-linux-commands)**
