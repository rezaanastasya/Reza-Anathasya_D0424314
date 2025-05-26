# 🗄️ Retail Database Management System - Struktur Tabel

Berikut adalah struktur tabel lengkap dari sistem manajemen basis data ritel, termasuk kolom, tipe data, dan relasi antar tabel.

---

## 1. Categories  
Menyimpan kategori produk

| Kolom         | Tipe Data     | Null? | Default Value           | Keterangan                     |
|---------------|----------------|-------|--------------------------|--------------------------------|
| category_id   | INT            | NO    | AUTO_INCREMENT           | Primary Key                    |
| category_name | VARCHAR(100)   | NO    | -                        | Nama kategori                  |
| description   | TEXT           | YES   | -                        | Deskripsi kategori             |
| created_at    | TIMESTAMP      | YES   | CURRENT_TIMESTAMP        | Tanggal pembuatan              |

---

## 2. Suppliers  
Menyimpan informasi pemasok

| Kolom         | Tipe Data     | Null? | Default Value           | Keterangan                     |
|---------------|----------------|-------|--------------------------|--------------------------------|
| supplier_id   | INT            | NO    | AUTO_INCREMENT           | Primary Key                    |
| company_name  | VARCHAR(100)   | NO    | -                        | Nama perusahaan                |
| contact_name  | VARCHAR(50)    | YES   | -                        | Nama kontak                    |
| contact_title | VARCHAR(30)    | YES   | -                        | Jabatan kontak                 |
| address       | VARCHAR(100)   | YES   | -                        | Alamat                         |
| city          | VARCHAR(50)    | YES   | -                        | Kota                           |
| postal_code   | VARCHAR(20)    | YES   | -                        | Kode pos                       |
| country       | VARCHAR(50)    | YES   | -                        | Negara                         |
| phone         | VARCHAR(20)    | YES   | -                        | Nomor telepon                  |
| email         | VARCHAR(100)   | YES   | -                        | Email                          |
| created_at    | TIMESTAMP      | YES   | CURRENT_TIMESTAMP        | Tanggal pembuatan              |

---

## 3. Products  
Daftar produk beserta detailnya

| Kolom            | Tipe Data         | Null? | Default Value                          | Keterangan                              |
|------------------|--------------------|-------|----------------------------------------|-----------------------------------------|
| product_id       | INT                | NO    | AUTO_INCREMENT                           | Primary Key                             |
| product_name     | VARCHAR(100)       | NO    | -                                      | Nama produk                             |
| category_id      | INT                | YES   | NULL                                   | Foreign Key ke categories               |
| supplier_id      | INT                | YES   | NULL                                   | Foreign Key ke suppliers                |
| unit_price       | DECIMAL(10,2)      | NO    | -                                      | Harga satuan                            |
| units_in_stock   | INT                | YES   | 0                                      | Stok tersedia                           |
| units_on_order   | INT                | YES   | 0                                      | Jumlah pesanan                          |
| reorder_level    | INT                | YES   | 0                                      | Level reorder                           |
| discontinued     | BOOLEAN            | YES   | FALSE                                  | Status apakah produk tidak aktif        |
| description      | TEXT               | YES   | -                                      | Deskripsi produk                        |
| image_url        | VARCHAR(255)       | YES   | -                                      | URL gambar                              |
| created_at       | TIMESTAMP          | YES   | CURRENT_TIMESTAMP                        | Tanggal pembuatan                       |
| updated_at       | TIMESTAMP          | YES   | CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | Tanggal pembaruan terakhir |

---

## 4. Customers  
Informasi pelanggan

| Kolom         | Tipe Data     | Null? | Default Value           | Keterangan                     |
|---------------|----------------|-------|--------------------------|--------------------------------|
| customer_id   | INT            | NO    | AUTO_INCREMENT           | Primary Key                    |
| first_name    | VARCHAR(50)    | NO    | -                        | Nama depan                     |
| last_name     | VARCHAR(50)    | NO    | -                        | Nama belakang                  |
| email         | VARCHAR(100)   | NO    | - (UNIQUE)               | Email pelanggan                |
| phone         | VARCHAR(20)    | YES   | -                        | Nomor telepon                  |
| address       | VARCHAR(100)   | YES   | -                        | Alamat                         |
| city          | VARCHAR(50)    | YES   | -                        | Kota                           |
| postal_code   | VARCHAR(20)    | YES   | -                        | Kode pos                       |
| country       | VARCHAR(50)    | YES   | -                        | Negara                         |
| date_of_birth | DATE           | YES   | -                        | Tanggal lahir                  |
| gender        | ENUM('Male', 'Female', 'Other') | YES | -             | Jenis kelamin                  |
| created_at    | TIMESTAMP      | YES   | CURRENT_TIMESTAMP        | Tanggal pembuatan              |
| updated_at    | TIMESTAMP      | YES   | CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | Tanggal pembaruan |

---

## 5. Employees  
Menyimpan informasi karyawan

| Kolom            | Tipe Data     | Null? | Default Value           | Keterangan                     |
|------------------|----------------|-------|--------------------------|--------------------------------|
| employee_id      | INT            | NO    | AUTO_INCREMENT           | Primary Key                    |
| first_name       | VARCHAR(50)    | NO    | -                        | Nama depan                     |
| last_name        | VARCHAR(50)    | NO    | -                        | Nama belakang                  |
| email            | VARCHAR(100)   | NO    | (UNIQUE)                 | Email karyawan                 |
| job_title        | VARCHAR(50)    | YES   | -                        | Jabatan                        |
| department       | VARCHAR(50)    | YES   | -                        | Departemen                     |
| hire_date        | DATE           | YES   | -                        | Tanggal mulai kerja            |
| salary           | DECIMAL(10,2)  | YES   | -                        | Gaji bulanan                   |
| address          | VARCHAR(100)   | YES   | -                        | Alamat                         |
| city             | VARCHAR(50)    | YES   | -                        | Kota                           |
| postal_code      | VARCHAR(20)    | YES   | -                        | Kode pos                       |
| country          | VARCHAR(50)    | YES   | -                        | Negara                         |
| phone            | VARCHAR(20)    | YES   | -                        | Nomor telepon                  |
| created_at       | TIMESTAMP      | YES   | CURRENT_TIMESTAMP        | Tanggal pembuatan              |
| updated_at       | TIMESTAMP      | YES   | CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | Tanggal pembaruan terakhir |

---

## 6. Orders  
Daftar pesanan dari pelanggan

| Kolom            | Tipe Data     | Null? | Default Value           | Keterangan                              |
|------------------|----------------|-------|--------------------------|-----------------------------------------|
| order_id         | INT            | NO    | AUTO_INCREMENT           | Primary Key                             |
| customer_id      | INT            | YES   | NULL                     | Foreign Key ke customers                |
| employee_id      | INT            | YES   | NULL                     | Foreign Key ke employees                |
| order_date       | DATE           | YES   | -                        | Tanggal pesanan                         |
| required_date    | DATE           | YES   | -                        | Tanggal pengiriman yang diharapkan      |
| shipped_date     | DATE           | YES   | NULL                     | Tanggal barang dikirim                  |
| ship_address     | VARCHAR(100)   | YES   | -                        | Alamat pengiriman                       |
| ship_city        | VARCHAR(50)    | YES   | -                        | Kota tujuan pengiriman                  |
| ship_postal_code | VARCHAR(20)    | YES   | -                        | Kode pos tujuan                         |
| ship_country     | VARCHAR(50)    | YES   | -                        | Negara tujuan                           |
| status           | ENUM('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled') | YES | 'Pending' | Status pesanan               |
| total_amount     | DECIMAL(10,2)  | YES   | 0.00                     | Total nilai pesanan                     |
| payment_method   | VARCHAR(50)    | YES   | -                        | Metode pembayaran                       |
| payment_status   | ENUM('Unpaid', 'Paid', 'Refunded') | YES | 'Unpaid' | Status pembayaran                   |
| created_at       | TIMESTAMP      | YES   | CURRENT_TIMESTAMP        | Tanggal pembuatan                       |
| updated_at       | TIMESTAMP      | YES   | CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | Tanggal pembaruan terakhir |

---

## 7. Order_Details  
Detail item dalam setiap pesanan

| Kolom            | Tipe Data     | Null? | Default Value           | Keterangan                              |
|------------------|----------------|-------|--------------------------|-----------------------------------------|
| order_detail_id  | INT            | NO    | AUTO_INCREMENT           | Primary Key                             |
| order_id         | INT            | YES   | NULL                     | Foreign Key ke orders                   |
| product_id       | INT            | YES   | NULL                     | Foreign Key ke products                 |
| quantity         | INT            | NO    | -                        | Jumlah produk dalam pesanan             |
| unit_price       | DECIMAL(10,2)  | NO    | -                        | Harga satuan saat pesanan               |
| discount         | DECIMAL(5,2)   | YES   | 0.00                     | Diskon per item (%)                      |
| subtotal         | DECIMAL(10,2)  | YES   | -                        | Total per baris                         |
| created_at       | TIMESTAMP      | YES   | CURRENT_TIMESTAMP        | Tanggal pembuatan                       |
| updated_at       | TIMESTAMP      | YES   | CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | Tanggal pembaruan terakhir |

---

## 8. Payments  
Informasi pembayaran untuk pesanan

| Kolom         | Tipe Data     | Null? | Default Value           | Keterangan                     |
|---------------|----------------|-------|--------------------------|--------------------------------|
| payment_id    | INT            | NO    | AUTO_INCREMENT           | Primary Key                    |
| order_id      | INT            | YES   | NULL                     | Foreign Key ke orders          |
| payment_date  | DATETIME       | YES   | -                        | Tanggal dan waktu pembayaran   |
| amount        | DECIMAL(10,2)  | NO    | -                        | Jumlah pembayaran              |
| payment_method| VARCHAR(50)    | YES   | -                        | Metode pembayaran              |
| transaction_id| VARCHAR(100)   | YES   | -                        | ID transaksi unik              |
| status        | ENUM('Pending', 'Completed', 'Failed', 'Refunded') | YES | 'Pending' | Status pembayaran |
| created_at    | TIMESTAMP      | YES   | CURRENT_TIMESTAMP        | Tanggal pembuatan              |
| updated_at    | TIMESTAMP      | YES   | CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | Tanggal pembaruan terakhir |

---

## 9. Inventory  
Stok inventaris untuk setiap gudang/lokasi

| Kolom         | Tipe Data     | Null? | Default Value           | Keterangan                     |
|---------------|----------------|-------|--------------------------|--------------------------------|
| inventory_id  | INT            | NO    | AUTO_INCREMENT           | Primary Key                    |
| product_id    | INT            | YES   | NULL                     | Foreign Key ke products        |
| warehouse_id  | INT            | YES   | NULL                     | ID gudang (opsional)           |
| stock_level   | INT            | YES   | 0                        | Level stok tersedia            |
| minimum_level | INT            | YES   | 0                        | Minimum level sebelum reorder  |
| last_restocked| DATE           | YES   | -                        | Tanggal terakhir restock       |
| created_at    | TIMESTAMP      | YES   | CURRENT_TIMESTAMP        | Tanggal pembuatan              |
| updated_at    | TIMESTAMP      | YES   | CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | Tanggal pembaruan terakhir |

---

## 10. Warehouses *(Optional)*  
Jika sistem menggunakan beberapa gudang

| Kolom         | Tipe Data     | Null? | Default Value           | Keterangan                     |
|---------------|----------------|-------|--------------------------|--------------------------------|
| warehouse_id  | INT            | NO    | AUTO_INCREMENT           | Primary Key                    |
| warehouse_name| VARCHAR(100)   | NO    | -                        | Nama gudang                    |
| address       | VARCHAR(100)   | YES   | -                        | Alamat                         |
| city          | VARCHAR(50)    | YES   | -                        | Kota                           |
| postal_code   | VARCHAR(20)    | YES   | -                        | Kode pos                       |
| country       | VARCHAR(50)    | YES   | -                        | Negara                         |
| contact_phone| VARCHAR(20)    | YES   | -                        | Kontak gudang                  |
| created_at    | TIMESTAMP      | YES   | CURRENT_TIMESTAMP        | Tanggal pembuatan              |
| updated_at    | TIMESTAMP      | YES   | CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | Tanggal pembaruan terakhir |

---

## ✅ Relasi Antar Tabel

- **Categories** ← **Products**
- **Suppliers** ← **Products**
- **Products** ← **Order_Details**
- **Customers** ← **Orders**
- **Employees** ← **Orders**
- **Orders** ← **Order_Details**
- **Orders** ← **Payments**
- **Products** ← **Inventory**
- **Warehouses** ← **Inventory** 
