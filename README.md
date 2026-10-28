# CineView - Aplikasi Katalog Film Sederhana

Aplikasi mobile  katalog film dengan navigasi yang ringkas, bersih, dan mudah dipahami.
---

## 📱 Daftar Halaman Aplikasi

Aplikasi ini terdiri dari 5 halaman utama:

1. **Home (`lib/home_page.dart`)**:
   - **Banner Film Unggulan**: Menampilkan poster dan judul film utama di bagian atas.
   - **Jelajahi Genre**: Tombol chip kategori genre yang diletakkan di atas sebelum daftar film.
   - **Film Populer**: Menampilkan daftar film populer secara horizontal.
   - **Rekomendasi Untukmu**: Menampilkan daftar film rekomendasi secara horizontal.
2. **Katalog (`lib/katalog_page.dart`)**:
   - Menampilkan seluruh koleksi film dalam bentuk Grid 2 kolom yang rapi.
3. **Genre (`lib/genre_page.dart`)**:
   - Menampilkan daftar kategori genre (Action, Comedy, Drama, Horror, Animation).
   - Ketika salah satu genre ditekan, akan menampilkan film yang sesuai dengan genre tersebut.
4. **Profile (`lib/profile_page.dart`)**:
   - Menampilkan informasi aplikasi, versi, dan identitas mahasiswa/pembuat.
5. **Detail Film (`lib/detail/detail_page.dart`)**:
   - Folder tersendiri di `lib/detail/`.
   - Menampilkan poster besar, judul, tahun rilis, genre, rating bintang, sinopsis lengkap, serta tombol watchlist statis.

---

## 📁 Struktur Direktori Proyek

```text
uas_project/
├── assets/
│   └── images/              # Folder peletakan file poster film (.jpg / .png)
├── lib/
│   ├── detail/
│   │   └── detail_page.dart # Halaman detail film (folder terpisah)
│   ├── data.dart            # Data film dan kategori genre
│   ├── genre_page.dart      # Halaman daftar genre & filter
│   ├── home_page.dart       # Halaman beranda utama
│   ├── katalog_page.dart    # Halaman katalog grid seluruh film
│   ├── main.dart            # Titik masuk aplikasi & konfigurasi BottomNav
│   └── profile_page.dart    # Halaman profil pembuat & tentang aplikasi
├── PANDUAN_FOTO.md          # Panduan penamaan dan letak aset poster film
├── README.md                # Dokumentasi umum aplikasi
└── pubspec.yaml             # Konfigurasi dependensi dan aset
```

---

---

