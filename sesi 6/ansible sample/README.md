# Contoh Penggunaan Ansible

Sebelum menggunakan ansible, kita harus mengenal apa yang namanya inventory. Contoh file [hosts](https://github.com/agung3wi/panduan-kelasdevops/tree/master/sesi%206/ansible%20sample/hosts) merupakan inventory dari ansible.

1. Sesuaikan file host dengan vm yang telah dibuat.

2. Apply untuk web server dan php-fpm, jalankan

```
ansible-playbook -i hosts install_nginx.yml install_php_fpm.yml install_docker setup_mysql.yml create_host.yml create_host_dev.yml
```