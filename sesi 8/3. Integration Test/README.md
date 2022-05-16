# Integration Test

> Merupakan pengujian apakah gabungan dari bagian (fungsi) dari sebuah aplikasi atau system dapat bekerja sama dengan benar. Contoh sederhana ketika saat upload dan mengirim gambar apakah tampilan gambar yng dikirim sesuai dengan gambar yang diupload tadi.

### Contoh Implementasi Integration Test
1. Pertama, buat test **PelangganTest** menggunakan command `php artisan make:test PelangganTest`
2. Buka file **PelangganTest.php** pada folder **tests/Feature/PelangganTest.php**
3. Pada contoh kali ini, akan dibuat method `test_create_data_masuk`. Masukkan script berikut :
```
public function test_create_data_masuk()
{
    DB::beginTransaction();

    $countAwal = Pelanggan::count(); // Menghitung jumlah data awal
    $response = $this->postJson('/api/pelanggan', [
        "nama" => "Agung",
        "kelamin" => "L",
        "phone" => "087123456789",
        "alamat" => "Semarang"
    ]);
    $countAkhir = Pelanggan::count(); // Menghitung jumlah data akhir (setelah penambahan data)
    $this->assertTrue($countAkhir == $countAkhir + 1);

    DB::rollBack(); // Menghapus data testing
}
```

4.  Jalankan dengan command `php artisan test --testsuite=Featur `. Dan hasilnya sebagai berikut:
![image](https://user-images.githubusercontent.com/68054503/168595792-e32ea0fd-5b5c-465f-a3dd-9de00d78592d.png)


