# Sesi 4 - Scalable Aplikasi

Aplikasi yang scalable harus mempunyai prinsip realibilitas yang tinggi. Untuk membuat aplikasi yang reliable, perlu memisahkan antara aplikasi dan backing-backing service yang diperlukan. Contohnya adalah database. Namun tidak hanya database saja, misalnya sperti file upload harus juga dipisahkan. Karena jika aplikasi diskalakan maka harus mempertahankan seluruh file upload yang ada, agar ketika request dibagi ke semua replika memiliki kesamaan respon.
