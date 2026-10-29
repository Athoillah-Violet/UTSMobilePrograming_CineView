import 'package:flutter/material.dart';

// File ini berisi data statis aplikasi CineView.
// Data disimpan dalam bentuk List of Map (kunci-nilai) agar sederhana dan mudah diakses.

// Daftar seluruh film yang ditampilkan di aplikasi.
final List<Map<String, dynamic>> daftarFilm = [
  {
    'id': 1,
    'judul': 'Spiderman Bran New Day',
    'tahun': '2026',
    'genre': 'Action',
    'rating': 9.4,
    'sinopsis':
        'Seorang pilot muda harus menembus badai paling berbahaya untuk '
        'mengantarkan obat kepada penduduk desa yang terisolasi.',
    'poster': 'assets/images/Spiderman.jpg',
  },
  {
    'id': 2,
    'judul': 'dream high 2011',
    'tahun': '2011',
    'genre': 'Drama',
    'rating': 7.9,
    'sinopsis':
        'Kisah seorang teknisi listrik yang berjuang menghidupkan kembali '
        'kotanya setelah pemadaman total selama satu minggu.',
    'poster': 'assets/images/dream high 2011.jpg',
  },
  {
    'id': 3,
    'judul': 'danshi koukousei no nichijou',
    'tahun': '2012',
    'genre': 'Comedy',
    'rating': 7.5,
    'sinopsis':
        'Tiga sahabat salah masuk ke acara pernikahan orang lain dan '
        'akhirnya terlibat dalam kekacauan yang lucu sepanjang hari.',
    'poster': 'assets/images/danshi.jpg',
  },
  {
    'id': 4,
    'judul': 'hasut 2026',
    'tahun': '20206',
    'genre': 'Horror',
    'rating': 7.8,
    'sinopsis':
        'Sebuah keluarga pindah ke rumah warisan dan mulai mendengar '
        'suara langkah kaki setiap tengah malam.',
    'poster': 'assets/images/hasut.jpg',
  },
  {
    'id': 5,
    'judul': 'Bkue Archive',
    'tahun': '2024',
    'genre': 'Animation',
    'rating': 8.7,
    'sinopsis': 'Menceritakan Sensei yang mengajar di sekolah bernama Abydos dan bertemu murid-murid baru, yang ternyata bukan murid biasa. bagaimana keseruan ceritanya',
    'poster': 'assets/images/blueA.jpg',
  },
  {
    'id': 6,
    'judul': ' Rurouni Kenshin: The Beginning dirilis pada tahun 2021',
    'tahun': '2023',
    'genre': 'Action',
    'rating': 7.8,
    'sinopsis':
        'Rurouni Kenshin: The Beginning mengisahkan masa lalu Kenshin sebagai pembantai kejam yang secara tragis membunuh Tomoe—wanita yang ia cintai sekaligus mata-mata musuh—saat wanita itu melindunginya, '
        ' sebuah insiden memilukan yang menciptakan luka silang (X) legendaris di pipinya dan mengubahnya menjadi pengembara yang bersumpah untuk berhenti membunuh.',
    'poster': 'assets/images/kenshin.jpg',
  },
  {
    'id': 7,
    'judul': 'Goblin',
    'tahun': '2016',
    'genre': 'Drama',
    'rating': 8.1,
    'sinopsis': 'Goblin mengisahkan Kim Shin, jenderal Goryeo yang dikutuk menjadi goblin abadi selama 900 tahun. Kutukan itu hanya bisa diakhiri jika "Pengantin Goblin" mencabut pedang di dadanya. Ia lalu bertemu Ji Eun-tak, siswi SMA yang bisa melihat hantu dan ditakdirkan menjadi pengantinnya. Kisah mereka berjalin dengan Malaikat Maut dalam takdir cinta dan reinkarnasi yang mengharukan.',
    'poster': 'assets/images/goblin.jpg',
  },
  {
    'id': 8,
    'judul': ' Si Juki the Movie: Harta Pulau Monyet (2024)',
    'tahun': '2024',
    'genre': 'Comedy',
    'rating': 7.0,
    'sinopsis': ' Mengalami kesulitan finansial pasca-jatuh miskin, Si Juki menemukan peta harta karun kuno warisan nenek moyangnya. Bersama keluarganya dan Profesor Juned, Juki berlayar ke pulau misterius dan harus menghadapi segerombolan bajak laut, monster laut, hingga pasukan monyet mistis demi menyelamatkan kondisi ekonomi mereka.',
    'poster': 'assets/images/juki.jpg',
  },
  {
    'id': 9,
    'judul': 'Alas Roban ',
    'tahun': '2026',
    'genre': 'Horror',
    'rating': 7.9,
    'sinopsis': 'menceritakan perjuangan seorang ibu bernama Sita yang harus menyelamatkan putrinya, Gendis, dari incaran makhluk gaib penunggu hutan Alas Roban setelah bus yang mereka tumpangi mogok di jalur angker tersebut.',
    'poster': 'assets/images/alas.jpg',
  },
  {
    'id': 10,
    'judul': 'Oshi no Ko Season 2',
    'tahun': '2024',
    'genre': 'Animation',
    'rating': 8.2,
    'sinopsis': 'Menceritakan  Aqua Hoshino menyelidiki kematian ibunya melalui keterlibatannya dalam panggung sandiwara Tokyo Blade. Di sana, persaingan akting yang sengit antara Kana Arima dan Akane Kurokawa justru mengungkap petunjuk baru mengenai pelaku pembunuhan yang sebenarnya. Musim ini ditutup dengan situasi kelam saat Aqua mencoba berdamai dengan masa lalu, sementara Ruby Hoshino justru membangkitkan dendam baru untuk memburu sang dalang utama.',
    'poster': 'assets/images/oshi.jpg',
  },
];

// Daftar kategori genre dan ikon pendukungnya untuk tampilan tab Genre.
final List<Map<String, dynamic>> daftarGenre = [
  {'nama': 'Action', 'ikon': Icons.local_fire_department},
  {'nama': 'Comedy', 'ikon': Icons.emoji_emotions},
  {'nama': 'Drama', 'ikon': Icons.theater_comedy},
  {'nama': 'Horror', 'ikon': Icons.nightlight_round},
  {'nama': 'Animation', 'ikon': Icons.auto_awesome},
];
