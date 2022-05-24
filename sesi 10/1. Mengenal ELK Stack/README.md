# Mengenal ELK Stack

* [Referensi Pengertian ELK Stack](https://www.elastic.co/what-is/elk-stack)

Elasticsearch Logstash Kibana Stack (ELK Stack) adalah kumpulan dari tiga produk sumber terbuka — Elasticsearch, Logstash, dan Kibana. ELK stack menyediakan logging terpusat untuk mengidentifikasi masalah dengan server atau aplikasi. Ini memungkinkan Anda untuk mencari semua log di satu tempat. Ini juga membantu untuk menemukan masalah di beberapa server dengan menghubungkan log selama jangka waktu tertentu.

- E (ElasticSearch) -> Digunakan untuk menyimpan log. ElasticSearch dapat diartikan sebagai tempat untuk menyimpan data yang bersifat indexing. Tipe data nya bisa di index, misal kita mencari sesuatu karena didalamnya terdapat indexing dapat memudahkan kita dalam pencarian kata kunci tertentu.

- L (LogStash) -> Digunakan untuk pengiriman serta pemrosesan dan penyimpanan log. Logstash merupakan satu aplikasi yang digunakan untuk menjembatani sehingga data (pada Engine app) sehingga data dapat tersimpan kedalam ElasticSearch.

- K (Kibana) -> Adalah alat visualisasi (antarmuka web) yang di-host melalui Nginx atau Apache. Kibana adalah frontend yang akan menampilkan visualisasi dari data ElasticSearch

<img width="550" alt="Screen Shot 2022-05-24 at 22 05 54" src="https://user-images.githubusercontent.com/38523284/170068961-ece22831-1c7e-46d4-8c94-eb9b3e799ed3.png">

Tidak hanya Log, kita dapat memonitoring performance nya dengan menggunakan APM (Application Performance Monitoring). Terdapat 2 kategori dalam APM yaitu `APM Agent` dan `APM Server`.

APM Agent dipasangkan ke dalam aplikasi, dan APM Server untuk servicenya dimana akan dilakukan pengiriman kedalam server dahulu baru masuk ke dalam ElasticSearch dan ditampilkan pada Kibana

<img width="650" alt="Screen Shot 2022-05-24 at 22 14 24" src="https://user-images.githubusercontent.com/38523284/170070899-9e75fef6-1cb6-4bea-9842-b95fd95e801d.png">




