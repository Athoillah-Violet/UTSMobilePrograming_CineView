import 'package:flutter/material.dart';

import 'data.dart';
import 'detail/detail_page.dart';

// Halaman Katalog menampilkan daftar seluruh film dalam tampilan grid 2 kolom.
// Menggunakan StatelessWidget karena tidak memerlukan perubahan state dinamis.
class KatalogPage extends StatelessWidget {
  const KatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Katalog Film')),
      // GridView.builder untuk menampilkan seluruh koleksi film secara efisien
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: daftarFilm.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 kolom sejajar
          crossAxisSpacing: 12, // jarak horizontal antar item
          mainAxisSpacing: 12, // jarak vertikal antar item
          childAspectRatio: 0.68, // proporsi perbandingan lebar:tinggi kartu
        ),
        itemBuilder: (context, index) {
          final film = daftarFilm[index];

          // GestureDetector untuk mendeteksi sentuhan pada setiap kartu film
          return GestureDetector(
            // Pindah ke DetailPage saat poster ditekan
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(film: film),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF202127),
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar poster film
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: const Color(0xFF111318),
                      child: Image.asset(
                        film['poster'],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(Icons.movie, size: 36, color: Colors.white38),
                          );
                        },
                      ),
                    ),
                  ),

                  // Keterangan judul, tahun, dan genre di bagian bawah kartu
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          film['judul'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${film['tahun']} • ${film['genre']}',
                          style: const TextStyle(fontSize: 11, color: Colors.white54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
