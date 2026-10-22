import 'package:flutter/material.dart';

// File ini adalah tempat semua data aplikasi CineView.
// Data disimpan dalam List berisi Map (kunci - nilai) supaya mudah dipahami.
// Setiap film memiliki: id, judul, tahun, genre, rating, sinopsis, dan poster.

// Daftar seluruh film yang ditampilkan di aplikasi.
final List<Map<String, dynamic>> daftarFilm = [
  {
    'id': 1,
    'judul': 'Petualangan Langit',
    'tahun': '2023',
    'genre': 'Action',
    'rating': 8.4,
    'sinopsis':
        'Seorang pilot muda harus menembus badai paling berbahaya untuk '
            'mengantarkan obat kepada penduduk desa yang terisolasi.',
    'poster': 'assets/images/petualangan_langit.jpg',
  },
  {
    'id': 2,
    'judul': 'Kota Tanpa Cahaya',
    'tahun': '2022',
    'genre': 'Drama',
    'rating': 7.9,
    'sinopsis':
        'Kisah seorang teknisi listrik yang berjuang menghidupkan kembali '
            'kotanya setelah pemadaman total selama satu minggu.',
    'poster': 'assets/images/kota_tanpa_cahaya.jpg',
  },
  {
    'id': 3,
    'judul': 'Tertawa Sampai Sore',
    'tahun': '2021',
    'genre': 'Comedy',
    'rating': 7.5,
    'sinopsis':
        'Tiga sahabat salah masuk ke acara pernikahan orang lain dan '
            'akhirnya terlibat dalam kekacauan yang lucu sepanjang hari.',
    'poster': 'assets/images/tertawa_sampai_sore.jpg',
  },
  {
    'id': 4,
    'judul': 'Rumah Tua di Ujung Jalan',
    'tahun': '2020',
    'genre': 'Horror',
    'rating': 7.2,
    'sinopsis':
        'Sebuah keluarga pindah ke rumah warisan dan mulai mendengar '
            'suara langkah kaki setiap tengah malam.',
    'poster': 'assets/images/rumah_tua.jpg',
  },
  {
    'id': 5,
    'judul': 'Negeri Awan',
    'tahun': '2024',
    'genre': 'Animation',
    'rating': 8.7,
    'sinopsis':
        'Seorang anak menemukan pintu rahasia menuju negeri di atas awan '
            'dan harus menolong penghuninya sebelum negeri itu hilang.',
    'poster': 'assets/images/negeri_awan.jpg',
  },
  {
    'id': 6,
    'judul': 'Balapan Terakhir',
    'tahun': '2023',
    'genre': 'Action',
    'rating': 7.8,
    'sinopsis':
        'Mantan pembalap jalanan kembali ke lintasan untuk satu balapan '
            'penentuan demi menyelamatkan bengkel ayahnya.',
    'poster': 'assets/images/balapan_terakhir.jpg',
  },
  {
    'id': 7,
    'judul': 'Cinta di Stasiun Tua',
    'tahun': '2019',
    'genre': 'Drama',
    'rating': 8.1,
    'sinopsis':
        'Dua orang asing bertemu setiap pagi di stasiun yang sama dan '
            'perlahan membangun cerita yang tidak pernah mereka rencanakan.',
    'poster': 'assets/images/cinta_di_stasiun.jpg',
  },
  {
    'id': 8,
    'judul': 'Komedi Anak Kos',
    'tahun': '2022',
    'genre': 'Comedy',
    'rating': 7.0,
    'sinopsis':
        'Lima mahasiswa berbagi satu rumah kos sempit dan menghadapi '
            'masalah uang, tugas, serta tetangga yang terlalu peduli.',
    'poster': 'assets/images/komedi_anak_kos.jpg',
  },
  {
    'id': 9,
    'judul': 'Bisikan di Loteng',
    'tahun': '2023',
    'genre': 'Horror',
    'rating': 6.9,
    'sinopsis':
        'Seorang penulis pindah ke rumah sewa murah dan menyadari ada '
            'seseorang yang menulis catatan jawaban di loteng.',
    'poster': 'assets/images/bisikan_di_loteng.jpg',
  },
  {
    'id': 10,
    'judul': 'Robot Kecil Pemberani',
    'tahun': '2021',
    'genre': 'Animation',
    'rating': 8.2,
    'sinopsis':
        'Robot pembersih kecil tersesat jauh dari rumah dan belajar arti '
            'keberanian dari hewan-hewan yang ia temui.',
    'poster': 'assets/images/robot_kecil.jpg',
  },
];

// Daftar genre yang tersedia di aplikasi.
// Ikon dipakai pada halaman Genre agar tampilan lebih menarik.
final List<Map<String, dynamic>> daftarGenre = [
  {'nama': 'Action', 'ikon': Icons.local_fire_department},
  {'nama': 'Comedy', 'ikon': Icons.emoji_emotions},
  {'nama': 'Drama', 'ikon': Icons.theater_comedy},
  {'nama': 'Horror', 'ikon': Icons.nightlight_round},
  {'nama': 'Animation', 'ikon': Icons.auto_awesome},
];

// Menyimpan film yang ditambahkan pengguna ke Watchlist.
// Cukup disimpan di dalam memori, jadi isinya hilang ketika aplikasi ditutup.
List<Map<String, dynamic>> daftarWatchlist = [];
