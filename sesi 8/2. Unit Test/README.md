# Unit Test

> Merupakan pengujian bagian terkecil dari sebuah code, bagian terkecil ini adalah bisa sebuah fungsi, module atau class dari sistem tersebut. ini dilakukan bertujuan untuk memastikan dapat berjalan sesuai yang diharapkan.

#### Membuat Test Case
Untuk membuat test case baru menggunakan command berikut (secara default test case ini terletak pada folder **tests/Feature**)
```
php artisan make:test UserTest
```

Jika ingin membuat test case pada folder tests/Unit, tambahkan `--unit` pada command.
```
php artisan make:test UserTest --unit
```

### Contoh Implementasi Unit Test
1. Pertama, buat test **MathPowerTest** menggunakan command `php artisan make:test MathPowerTest --unit`
2. Pada contoh ini, akan dibuat dua method yang mana method `test_bilangan_positif` dengan hasil true dan method `test_bilangan_negatif` dengan hasil false. Masukan script berikut ke test MathPowerTest
```
<?php

namespace Tests\Unit;

use App\Helper\MathHelper;
use PHPUnit\Framework\TestCase;

class MathPowerTest extends TestCase
{
    /**
     * A basic unit test example.
     *
     * @return void
     */
    public function test_bilangan_positif()
    {
        $p = MathHelper::pangkat(2, 3);
        $this->assertTrue($p == 8);
    }

    public function test_bilangan_negatif()
    {
        $p = MathHelper::pangkat(2, -3);
        $this->assertTrue($p == 8); // hasil yang seharusnya 1/8
    }
}
```

3. Buat Class MathHelper pada direktori `app/Helper`.
```
<?php

namespace App\Helper;

class MathHelper
{
  public static function pangkat($a, $b)
  {
    $result = 1;
    for ($i = 1; $i <= abs($b); $i++) {
      if ($b > 0) // Untuk pangkat bernilai positif
        $result = $result * $a;
      else // Untuk pangkat bernilai negatif
        $result = $result / $a;
    }

    return $result;
  }
}
```

4.  Jalankan dengan command `php artisan test`. Dan hasilnya sebagai berikut:
![php artisan test result](https://user-images.githubusercontent.com/68054503/168524527-99000e20-2f34-42f8-bd0f-975472f4cf54.PNG)
