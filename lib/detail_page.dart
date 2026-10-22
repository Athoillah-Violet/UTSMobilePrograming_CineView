import 'package:flutter/material.dart';
import 'data.dart';

// Halaman detail menampilkan informasi lengkap satu film.
// Data film dikirim dari halaman sebelumnya melalui constructor.
class DetailPage extends StatefulWidget {
  // Variabel ini menampung data film yang dipilih pengguna.
  final Map<String, dynamic> film;

  const DetailPage({super.key, required this.film});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // Memeriksa apakah film ini sudah ada di daftarWatchlist.
  bool sudahDiWatchlist() {
    for (int i = 0; i < daftarWatchlist.length; i++) {
      if (daftarWatchlist[i]['id'] == widget.film['id']) {
        return true;
      }
    }
    return false;
  }

  // build() menyusun tampilan detail film.
  @override
  Widget build(BuildContext context) {
    // Data film milik widget induk disalin ke variabel lokal agar lebih singkat.
    final Map<String, dynamic> film = widget.film;

    return Scaffold(
      appBar: AppBar(
        // Tombol kembali otomatis muncul karena halaman ini dibuka lewat Navigator.push.
        title: const Text('Detail Film'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------- POSTER FILM ----------
            Container(
              height: 300,
              width: double.infinity,
              color: const Color(0xFF202127),
              child: Image.asset(
                film['poster'],
                fit: BoxFit.cover,
                // Pengganti gambar jika file poster belum tersedia.
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.movie, size: 72, color: Colors.white38),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ---------- JUDUL DAN TAHUN ----------
                  Text(
                    film['judul'],
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Tahun rilis: ${film['tahun']}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 12),

                  // ---------- GENRE DAN RATING ----------
                  Row(
                    children: [
                      // Label genre film.
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF202127),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          film['genre'],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFFE5B96A),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Rating film.
                      const Icon(Icons.star, size: 16, color: Color(0xFFE5B96A)),
                      const SizedBox(width: 4),
                      Text('${film['rating']}'),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // ---------- SINOPSIS ----------
                  const Text(
                    'Sinopsis',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    film['sinopsis'],
                    style: const TextStyle(color: Colors.white70, height: 1.5),
                  ),
                  const SizedBox(height: 24),

                  // ---------- TOMBOL WATCHLIST ----------
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE5B96A),
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: Icon(
                        sudahDiWatchlist()
                            ? Icons.bookmark_remove
                            : Icons.bookmark_add,
                      ),
                      label: Text(
                        sudahDiWatchlist()
                            ? 'Hapus dari Watchlist'
                            : 'Tambah ke Watchlist',
                      ),
                      onPressed: () {
                        // setState() dipakai agar tombol langsung berubah setelah ditekan.
                        setState(() {
                          if (sudahDiWatchlist()) {
                            // Menghapus film dari daftar watchlist satu per satu.
                            for (int i = 0; i < daftarWatchlist.length; i++) {
                              if (daftarWatchlist[i]['id'] == film['id']) {
                                daftarWatchlist.removeAt(i);
                                break;
                              }
                            }
                          } else {
                            // Menambahkan film ke daftar watchlist.
                            daftarWatchlist.add(film);
                          }
                        });
                      },
                    ),
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
