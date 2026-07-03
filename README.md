# SiLapor Jawa

SiLapor Jawa adalah aplikasi pelaporan masyarakat berbasis web yang mengimplementasikan konsep **Sistem Terdistribusi** pada wilayah Pulau Jawa, yaitu:

- Jawa Barat
- Jawa Tengah
- Jawa Timur

Project ini dibuat sebagai implementasi mata kuliah **Pemrosesan Data Terdistribusi** dengan menerapkan beberapa konsep distributed system seperti **Horizontal Fragmentation**, **PostgreSQL Foreign Data Wrapper (FDW)**, **Redis Master-Replica**, **MongoDB Replica Set**, serta deployment menggunakan **Docker Compose**.

---

## Arsitektur Sistem

Sistem terdiri dari beberapa komponen berikut:

- **Nginx** sebagai Web Server
- **PHP** sebagai Backend
- **PostgreSQL Coordinator** sebagai pusat integrasi data
- **PostgreSQL Regional**
  - Jawa Barat
  - Jawa Tengah
  - Jawa Timur
- **Redis Master-Replica** sebagai cache
- **MongoDB Replica Set** sebagai penyimpanan log
- **Docker Compose** sebagai orchestrator seluruh service

---

## Konsep Sistem Terdistribusi

Project ini mengimplementasikan beberapa konsep utama, yaitu:

### 1. Horizontal Fragmentation

Data dipisahkan berdasarkan wilayah.

- Database Jawa Barat
- Database Jawa Tengah
- Database Jawa Timur

Masing-masing wilayah memiliki database PostgreSQL sendiri.

---

### 2. Data Integration

Menggunakan **PostgreSQL Foreign Data Wrapper (FDW)** sehingga Coordinator dapat mengakses seluruh database regional tanpa memindahkan data asli.

---

### 3. Caching

Menggunakan **Redis Master-Replica** untuk mempercepat proses pembacaan data.

---

### 4. Replication

Menggunakan **MongoDB Replica Set** untuk menyimpan log aplikasi secara redundan.

---

### 5. Containerization

Seluruh service dijalankan menggunakan **Docker Compose** sehingga deployment menjadi lebih mudah.

---

## Struktur Project

```
SILAPOR-JAWA
│
├── app/
│   └── index.php                 # Halaman utama aplikasi
│
├── docker/
│   ├── nginx/
│   │   └── nginx.conf            # Konfigurasi Nginx
│   │
│   ├── php/
│   │   └── Dockerfile            # Dockerfile PHP
│   │
│   └── redis/
│       ├── redis-master.conf     # Konfigurasi Redis Master
│       └── redis-replica.conf    # Konfigurasi Redis Replica
│
├── sql/
│   ├── coordinator.sql           # Database Coordinator (FDW)
│   ├── jabar.sql                 # Database Jawa Barat
│   ├── jateng.sql                # Database Jawa Tengah
│   └── jatim.sql                 # Database Jawa Timur
│
├── docker-compose.yml            # Orkestrasi seluruh container
│
└── README.md
```

---

## Cara Menjalankan Project

### 1. Clone repository

```bash
git clone https://github.com/username/silapor-jawa.git
```

Masuk ke folder project.

```bash
cd silapor-jawa
```

---

### 2. Jalankan Docker Compose

```bash
docker compose up -d
```

Tunggu hingga seluruh container berjalan.

---

### 3. Cek Container

```bash
docker ps
```

Pastikan seluruh service berstatus **Up**.

---

### 4. Akses Aplikasi

Buka browser:

```
http://localhost
```

---

## Teknologi yang Digunakan

- PHP
- Nginx
- PostgreSQL
- PostgreSQL FDW
- Redis
- MongoDB
- Docker
- Docker Compose

---

## Fitur Implementasi

- Database terdistribusi berdasarkan wilayah
- Integrasi data menggunakan PostgreSQL FDW
- Caching menggunakan Redis Master-Replica
- Logging menggunakan MongoDB Replica Set
- Deployment menggunakan Docker Compose

---

## Author

**Al Fikri Syam**

Mata Kuliah: **Pemrosesan Data Terdistribusi**