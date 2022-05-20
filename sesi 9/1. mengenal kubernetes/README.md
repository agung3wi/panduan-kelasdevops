# Mengenal Kubernetes

Kubernetes merupakan platform open-source yang digunakan untuk melakukan manajemen workloads aplikasi yang dikontainerisasi, serta menyediakan konfigurasi dan otomatisasi secara deklaratif. Kubernetes berada di dalam ekosistem yang besar dan berkembang cepat. Service, support, dan perkakas Kubernetes tersedia secara meluas.

Google membuka Kubernetes sebagai proyek open source pada tahun 2014. Kubernetes dibangun berdasarkan pengalaman Google selama satu setengah dekade dalam menjalankan workloads bersamaan dengan kontribusi berupa ide-ide terbaik yang diberikan oleh komunitas.


## Node
Node merupakan sebuah mesin worker di dalam Kubernetes. Sebuah node bisa berupa VM ataupun mesin fisik, tergantung dari klaster-nya. Masing-masing node berisi beberapa servis yang berguna untuk menjalankan banyak pod dan diatur oleh komponen-komponen yang dimiliki oleh master. Servis-servis di dalam sebuah node terdiri dari runtime kontainer, kubelet dan kube-proxy. Untuk lebih detail, lihat dokumentasi desain arsitektur pada Node Kubernetes.

## Pod
Sebuah Pod adalah unit dasar di Kubernetes--unit terkecil dan paling sederhana di dalam objek model Kubernetes yang dapat dibuat dan di deploy. Sebuah Pod merepresentasikan suatu proses yang berjalan di dalam klaster.

Pod membungkus sebuah kontainer (atau, di beberapa kasus, beberapa kontainer), sumber penyimpanan, alamat jaringan IP yang unik, dan opsi yang mengatur bagaimana kontainer harus dijalankan. Pod merupakan representasi dari unit deployment: sebuah instance aplikasi di dalam Kubernetes, yang mungkin terdiri dari satu kontainer atau sekumpulan kontainer yang berbagi resource.

Docker adalah salah satu kontainer runtime yang paling umum digunakan di Kubernetes Pod, tetapi Pod mendukung kontainer runtime lainnya.

Pod di Kubernetes klaster dapat digunakan dengan dua cara:

1. Pod menjalankan satu kontainer. Model satu kontainer per Pod adalah model yang umum digunakan di Kubernetes; kamu dapat membayangkan sebuah Pod sebagai pembungkus kontainer tersebut, dan Kubernetes tidak mengelola kontainer secara langsung tetapi mengelola Pod tersebut.
2. Pod menjalankan beberapa kontainer yang perlu berjalan bersamaan. Sebuah Pod dapat membungkus sebuah aplikasi yang terdiri dari beberapa kontainer yang perlu berbagi resource. Kontainer yang ditempatkan di dalam satu Pod ini membentuk sebuah layanan. Sebuah kontainer menyajikan berkas dari sumber penyimpanan ke publik, sedangkan kontainer sidecar yang lain melakukan pembaharuan terhadap berkas tersebut. Pod membungkus semua kontainer dan resource penyimpanan sebagai satu kesatuan yang dapat dikelola.


