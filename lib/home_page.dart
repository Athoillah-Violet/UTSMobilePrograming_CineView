import 'package:flutter/material.dart';
import 'data.dart';
import 'detail_page.dart';
import 'genre_page.dart';

// Halaman beranda CineView.
// Menampilkan banner film unggulan, film populer, rekomendasi, dan pilihan genre.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // build() menyusun tampilan halaman ini dari atas ke bawah.
  @override
  Widget build(BuildContext context) {
    // Film pertama dari data dipakai sebagai banner unggulan.
    final Map<String, dynamic> filmUnggulan = daftarFilm[0];

    return Scaffold(
      appBar: AppBar(title: const Text('CineView')),
      // SingleChildScrollView membuat isi halaman bisa digulir ke bawah.
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------- BANNER FILM UNGGULAN ----------
            GestureDetector(
              // Ketukan pada banner membuka halaman detail film.
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
                    // Menampilkan poster film. Jika gambar belum ada,
                    // akan diganti ikon film oleh errorBuilder.
                    Image.asset(
                      filmUnggulan['poster'],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(Icons.movie, size: 48, color: Colors.white38),
                        );
                      },
                    ),
                    // Lapisan gelap di bagian bawah agar tulisan mudah dibaca.
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

            // Judul bagian film populer.
            const Padding(
              padding: EdgeInsets.only(left: 16, bottom: 8),
              child: Text(
                'Film Populer',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // ---------- DAFTAR FILM POPULER ----------
            // Tinggi SizedBox wajib ditentukan karena daftar digulir ke samping.
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16),
                itemCount: 5,
                itemBuilder: (context, index) {
                  // Mengambil 5 film pertama sebagai film populer.
                  return KartuPosterFilm(film: daftarFilm[index]);
                },
              ),
            ),

            // Judul bagian rekomendasi.
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 20, bottom: 8),
              child: Text(
                'Rekomendasi Untukmu',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // ---------- DAFTAR FILM REKOMENDASI ----------
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16),
                itemCount: 5,
                itemBuilder: (context, index) {
                  // Mengambil film ke-6 sampai ke-10 sebagai rekomendasi.
                  return KartuPosterFilm(film: daftarFilm[index + 5]);
                },
              ),
            ),

            // Judul bagian genre.
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 20, bottom: 8),
              child: Text(
                'Jelajahi Genre',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // ---------- PILIHAN GENRE ----------
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 4),
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
                      // Menekan genre membuka halaman Genre.
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
          ],
        ),
      ),
    );
  }
}

// Widget kecil untuk menampilkan satu poster film dalam bentuk kartu.
// Ditulis di file ini saja karena hanya dipakai di Home Page.
class KartuPosterFilm extends StatelessWidget {
  // Data film dikirim lewat constructor agar widget ini bisa dipakai berulang.
  final Map<String, dynamic> film;

  const KartuPosterFilm({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Ketukan pada kartu membuka halaman detail.
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
            // Expanded membuat poster mengisi sisa tinggi kartu.
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
                  // Pengganti gambar jika file poster belum tersedia.
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
