# 📸 Panduan Penamaan dan Peletakan Foto (Aset Poster Film)

File ini berisi daftar nama file gambar yang harus disiapkan dan lokasi penyimpanannya agar otomatis tampil pada aplikasi **CineView**.

---

## 📂 Lokasi Folder Penyimpanan Foto

Simpan semua file foto di folder:
```text
uas_project/assets/images/
```

> **Catatan:**
> - Format foto yang disarankan: **`.jpg`** (juga mendukung `.png`).
> - Orientasi foto: **Portrait / Tegak** (rasio poster film, disarankan ukuran sekitar **500 × 750 piksel**).
> - Selama file foto belum dimasukkan, aplikasi **tidak akan error**; tampilan akan otomatis memunculkan ikon pengganti film (placeholder).

---

## 📋 Tabel Daftar Nama File Foto Sesuai Peletakannya

| No | Judul Film | Genre | Nama File Foto yang Wajib Dipakai | Posisi Muncul di Aplikasi |
|:--:|:-----------|:-----:|:----------------------------------|:--------------------------|
| 1 | **Petualangan Langit** | Action | `petualangan_langit.jpg` | **Banner Utama Home**, Film Populer #1, Katalog |
| 2 | **Kota Tanpa Cahaya** | Drama | `kota_tanpa_cahaya.jpg` | Film Populer #2, Katalog, Genre Drama |
| 3 | **Tertawa Sampai Sore** | Comedy | `tertawa_sampai_sore.jpg` | Film Populer #3, Katalog, Genre Comedy |
| 4 | **Rumah Tua di Ujung Jalan** | Horror | `rumah_tua.jpg` | Film Populer #4, Katalog, Genre Horror |
| 5 | **Negeri Awan** | Animation | `negeri_awan.jpg` | Film Populer #5, Katalog, Genre Animation |
| 6 | **Balapan Terakhir** | Action | `balapan_terakhir.jpg` | Rekomendasi #1, Katalog, Genre Action |
| 7 | **Cinta di Stasiun Tua** | Drama | `cinta_di_stasiun.jpg` | Rekomendasi #2, Katalog, Genre Drama |
| 8 | **Komedi Anak Kos** | Comedy | `komedi_anak_kos.jpg` | Rekomendasi #3, Katalog, Genre Comedy |
| 9 | **Bisikan di Loteng** | Horror | `bisikan_di_loteng.jpg` | Rekomendasi #4, Katalog, Genre Horror |
| 10 | **Robot Kecil Pemberani** | Animation | `robot_kecil.jpg` | Rekomendasi #5, Katalog, Genre Animation |

---

## 💡 Tips & Trik Penyesuaian

### 1. Jika File Anda Berformat `.png` atau `.jpeg`:
Anda bisa langsung mengganti ekstensi namanya di file [lib/data.dart](file:///d:/data/Tugas%20uas/uas_project/lib/data.dart).  
Contoh:
```dart
'poster': 'assets/images/petualangan_langit.png',
```

### 2. Jika Ingin Mengganti Judul / Gambar Sendiri:
Buka [lib/data.dart](file:///d:/data/Tugas%20uas/uas_project/lib/data.dart), Anda bebas mengubah `judul`, `poster`, `genre`, atau `sinopsis` sesuai selera dan foto yang Anda miliki.
