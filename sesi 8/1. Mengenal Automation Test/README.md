# Mengenal Automation Test

> Testing adalah sebuah metode yang dijalankan untuk memeriksa apakah aplikasi sudah sesuai dengan persyaratan yang diharapkan atau belum. Tujuan dari testing sendiri adalah supaya perusahaan bisa mengidentifikasi kesalahan atau fitur yang tidak sesuai dengan persyaratan yang sebenarnya.

**Automation testing** atau pengujian otomatis membutuhkan pembuatan skrip pemrograman yang berguna untuk menggantikan tenaga manusia ketika melakukan pengujian sistem aplikasi. Skrip tersebut sebisa mungkin akan menjalankan tahapan pengujian yang dilakukan oleh manual tester dalam satu klik sehingga ketika skrip tersebut dijalankan, tester tinggal menunggu hasil akhir dari pengujian.

> Tujuan utama dari Automation testing adalah untuk meningkatkan efektivitas, efisiensi, dan coverage dalam testing.

### Manfaat Automation Testing
1. Lebih cepat dari Manual Testing, waktu yang dibutuhkan untuk melakukan pengujian jadi lebih singkat karena tester gak perlu membuka secara manual aplikasi yang bakal diuji dan gak perlu mengetik data input yang diperlukan. Kemudian ketika skrip di-running, gak ada jeda waktu istirahat yang diperlukan ketika menguji banyak kasus pengujian.


2. Tester dapat melakukan pengujian dengan kasus yang sangat banyak tanpa usaha yang berlebihan. Dalam satu klik, automation tester bisa menguji puluhan–bahkan ratusan dan ribuan–kasus tanpa melibatkan banyak tester untuk melakukannya. 

3. Performance Test dan Regression Test dapat dilakukan dengan lebih mudah. Hal ini dikarenakan performance test dan regression test membutuhkan resource yang sangat banyak dengan banyak data yang diperlukan untuk dapat dilakukan. Tentunya hal ini membuat manual tester kewalahan. Dengan adanya automation testing, kamu gak perlu menyiapkan data secara manual dan melakukan pengujian berkali-kali karena semua dapat dilakukan oleh komputer kita melalui skrip yang telah kita buat.

4. Meminimalisasi human error dalam pengujian. Manusia tentu dapat berbuat kesalahan dalam menguji aplikasi, baik itu salah klik atau salah input data dan salah mengetik data. Namun, teknik automation testing bisa meminimalisasi hal tersebut dengan manipulasi logic dan variabel di dalam skrip.


### Jenis-Jenis Automation Testing
1. Unit Test
Unit Testing adalah pengujian software di mana QA menguji suatu unit program layak untuk tidaknya dipakai. Unit testing ini fokusnya pada pengujian unit yang terkecil pada desain perangkat lunak (komponen atau modul perangkat lunak). Karena dalam sebuah software banyak memiliki unit-unit kecil maka untuk mengujinya biasanya dibuat program kecil atau main program untuk menguji unit-unit software. Unit-unit kecil ini dapat berupa fitur atau fungsi dan pengujian unit biasanya dilakukan saat kode program dibuat. Seperti namanya, komponen yang diuji pada unit testing adalah unit-unit dari perangkat lunak. Unit disini dapat berupa function, method, procedure, module, maupun object.

Selengkapnya tentang **Unit Test** lihat [disini]()


2. Integration Test
Berbeda dengan unit tesing, integration testing adalah pengujian dari hasil pengabungan unit-unit yang ada di dalam software. Biasanya QA menguji bagaimana unit-unit tersebut bekerja sebagai suatu kombinasi, bukan lagi sebagai suatu unit yang individual. Integration testing sebaiknya dilakukan secara bertahap untuk menghindari kesulitan penelusuran jika terjadi kesalahan error / bug.

Integration testing dilakukan setelah unit testing. Pada integration testing dilakukan pengujian untuk gabungan/kombinasi dari beberapa unit yang berbeda dan diuji sebagai sebuah kelompok untuk memastikan siap untuk dilakukan system testing. Integration testing juga menguji aliran data dari modul satu ke modul lainnya.

Selengkapnya tentang **Integration Test** lihat [disini]()


3. Usability Testing
Usability test adalah pengujian yang dilakukan untuk memastikan apakah software sudah sesuai dengan persyaratan dari pengguna. Umumnya usability test mengevaluasi persyaratan fungsional program dan kualitas dari user interface. User berinteraksi dengan sistem untuk menentukan apakah fungsi telah seperti yang diharapkan dan apakah user interface membuat sistem dapat mudah digunakan. Pengujian ini sering dilakukan untuk mendapatkan feedback yang cepat dalam meningkatkan interface dan mengkoreksi kesalahan dalam komponen perangkat lunak.


### Implementasi Testing di Laravel

Pada Laravel konfigurasi terkait testing ada pada file `phpunit.xml` yang bisa kita temukan pada direktori utama project laravel. 

```
...
<testsuites>
    <testsuite name="Unit">
        <directory suffix="Test.php">./tests/Unit</directory>
    </testsuite>
    <testsuite name="Feature">
        <directory suffix="Test.php">./tests/Feature</directory>
    </testsuite>
</testsuites>
...
```

Phpunit merupakan salah satu program yang akan membantu untuk membuat automatic testing di aplikasi berbasis php. Pada project directory laravel ada folder tests yang mengandung dua direktori yaitu : **Feature dan Unit** yang masing-masing memiliki file `ExampleTest.php`. Semua automatic test dibuat dikedua direktori tersebut.
- Direktori Unit akan digunakan untuk melakukan unit test yang biasa atau ketika melakukan test terhadap satu function atau method kecil. 
- Direktori Feature digunakan melakukan test terhadap sebuah fitur dari aplikasi 

> Mari kita telaah contoh file ExampleTest.php pada folder Unit
```
<?php

namespace Tests\Unit;

use PHPUnit\Framework\TestCase;

class ExampleTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function testBasicTest()
    {
        $this->assertTrue(true);
    }
}

```
Dalam penulisan method test harus diawali dengan prefix (awalan) `test`. Prefix test ini kita tuliskan agar method tersebut dikenali sebagai function yang berisikan test.

Untuk menjalankan test nya menggunakan command berikut :
```
php artisan test
```