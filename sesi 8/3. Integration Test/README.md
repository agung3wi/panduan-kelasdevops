# Integration Test

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


