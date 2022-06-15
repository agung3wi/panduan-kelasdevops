# Sesi 5 - Scalable Aplikasi

Aplikasi yang scalable harus mempunyai prinsip realibilitas yang tinggi. Untuk membuat aplikasi yang reliable, perlu memisahkan antara aplikasi dan backing-backing service yang diperlukan. Contohnya adalah database. Namun tidak hanya database saja, misalnya sperti file upload harus juga dipisahkan. Karena jika aplikasi diskalakan maka harus mempertahankan seluruh file upload yang ada, agar ketika request dibagi ke semua replika memiliki kesamaan respon.

Untuk itu biasanya aplikasi yang scalable sifatnya stateless. Dalam konteks aplikasi yang dikontainerisasi, aplikasi harus bisa memisahkan aspek2 berikut:
1. Database.
2. File Upload.
3. Session.
4. Cache.
5. Log.

Sehingga aplikasi dapat dengan mudah diskalakan, karena tidak menyimpan apapun di lokal (dalam host tersebut).
