# Menambahkan APM Agent untuk Laravel aplikasi

* [Kumpulan Dokumentasi Instalasi APM Agent](https://www.elastic.co/guide/en/apm/agent/index.html)
* [Referensi APM pada Laravel](https://github.com/arkaitzgarro/elastic-apm-laravel)
* [Gitlab Repo](https://gitlab.com/agung3wi/devopsapril-laravel)
* [Github Repo](https://github.com/agung3wi/devopsapril-laravel)

## Prasyarat

Terlebih dahulu install `guzzle` sebelum memulai menggunakan APM Agent
```
composer require php-http/guzzle7-adapter
```

## Instalasi   

1. Install composer
   - Laravel 6+
     ```
     composer require arkaitzgarro/elastic-apm-laravel
     ```
2. Kemudian didaftarkan ke `config/app.php`
   ```
   'providers' => [
        // ... more providers
        \AG\ElasticApmLaravel\ServiceProvider::class,
    ],
   ```
3. Selanjutnya di publish supaya dapat config dari ElasticEPM Laravel nya
   ```
   php artisan vendor:publish --tag=config
   ```
