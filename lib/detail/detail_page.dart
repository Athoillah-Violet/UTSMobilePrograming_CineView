import 'package:flutter/material.dart';

// Halaman Detail menampilkan informasi lengkap satu film/buku.
// Menggunakan StatelessWidget karena halaman ini hanya menampilkan data (read-only).
class DetailPage extends StatelessWidget {
  // Variabel untuk menerima data yang dikirim dari halaman sebelumnya lewat constructor
  final Map<String, dynamic> film;

  const DetailPage({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan tombol kembali otomatis (back button) yang disediakan Navigator bawaan Flutter
      appBar: AppBar(title: const Text('Detail Film')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Bagian Banner / Poster
            Container(
              height: 280,
              width: double.infinity,
              color: const Color(0xFF202127),
              child: Image.asset(
                film['poster'],
                fit: BoxFit.cover,
                // errorBuilder: Menampilkan ikon cadangan jika file aset poster tidak ditemukan
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.movie, size: 64, color: Colors.white38),
                  );
                },
              ),
            ),

            // 2. Bagian Konten & Keterangan
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul
                  Text(
                    film['judul'],
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Tahun & Genre
                  Text(
                    'Tahun: ${film['tahun']}  •  ${film['genre']}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 8),

                  // Rating bintang
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 18,
                        color: Color(0xFFE5B96A),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${film['rating']}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Bagian Sinopsis
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

                  // Tombol Watchlist (tampilan statis, aksi dinonaktifkan dengan onPressed: null)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      icon: const Icon(Icons.bookmark_add),
                      label: const Text('Tambah ke Watchlist'),
                      onPressed: null, // Fitur dimatikan sesuai permintaan
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
