import 'package:flutter/material.dart';

import 'data.dart';
import 'detail/detail_page.dart';
import 'genre_page.dart';

// Halaman Beranda (Home):
// Berisi Banner Unggulan, Pilihan Genre, Film Populer, dan Rekomendasi
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil item film pertama di data.dart sebagai banner unggulan
    final Map<String, dynamic> filmUnggulan = daftarFilm[0];

    return Scaffold(
      appBar: AppBar(title: const Text('CineView')),
      // SingleChildScrollView agar seluruh konten beranda dapat di-scroll vertikal
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==========================================
            // 1. BANNER FILM UNGGULAN
            // ==========================================
            GestureDetector(
              // Pindah ke DetailPage saat banner diklik menggunakan Navigator.push
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(film: filmUnggulan),
                  ),
                );
              },
              child: Container(
                height: 220,
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF202127),
                  borderRadius: BorderRadius.circular(16),
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      filmUnggulan['poster'],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(Icons.movie, size: 48, color: Colors.white38),
                        );
                      },
                    ),
                    // Lapisan teks hitam transparan di bagian bawah banner
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        width: double.infinity,
                        color: Colors.black54,
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              filmUnggulan['judul'],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${filmUnggulan['tahun']}  •  ${filmUnggulan['genre']}',
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ==========================================
            // 2. PILIHAN GENRE (Posisi di atas Film Populer)
            // ==========================================
            const Padding(
              padding: EdgeInsets.only(left: 16, bottom: 8),
              child: Text(
                'Jelajahi Genre',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (int i = 0; i < daftarGenre.length; i++)
                    ActionChip(
                      avatar: Icon(
                        daftarGenre[i]['ikon'],
                        size: 18,
                        color: const Color(0xFFE5B96A),
                      ),
                      label: Text(daftarGenre[i]['nama']),
                      backgroundColor: const Color(0xFF202127),
                      side: BorderSide.none,
                      // Pindah ke GenrePage saat salah satu chip genre diklik
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GenrePage(),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),

            // ==========================================
            // 3. DAFTAR FILM POPULER (Scroll Horizontal)
            // ==========================================
            const Padding(
              padding: EdgeInsets.only(left: 16, bottom: 8),
              child: Text(
                'Film Populer',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16),
                itemCount: 5,
                itemBuilder: (context, index) {
                  // Mengambil 5 film pertama sebagai representasi film populer
                  return KartuPosterFilm(film: daftarFilm[index]);
                },
              ),
            ),

            // ==========================================
            // 4. DAFTAR REKOMENDASI (Scroll Horizontal)
            // ==========================================
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 20, bottom: 8),
              child: Text(
                'Rekomendasi Untukmu',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16),
                itemCount: 5,
                itemBuilder: (context, index) {
                  // Mengambil 5 film berikutnya (index 5 sampai 9)
                  return KartuPosterFilm(film: daftarFilm[index + 5]);
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// Widget kartu kecil untuk menampilkan poster, judul, dan rating film.
// Dibuat reusable (dapat digunakan berulang-ulang di ListView)
class KartuPosterFilm extends StatelessWidget {
  final Map<String, dynamic> film;

  const KartuPosterFilm({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Pindah ke DetailPage saat kartu film ditekan
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage(film: film)),
        );
      },
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF202127),
                  borderRadius: BorderRadius.circular(12),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  film['poster'],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(Icons.movie, size: 34, color: Colors.white38),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              film['judul'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                const Icon(Icons.star, size: 14, color: Color(0xFFE5B96A)),
                const SizedBox(width: 4),
                Text(
                  '${film['rating']}',
                  style: const TextStyle(fontSize: 12, color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
