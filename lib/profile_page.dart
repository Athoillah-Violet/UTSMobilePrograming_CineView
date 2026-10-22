import 'package:flutter/material.dart';

// Halaman Profile berisi informasi tentang aplikasi CineView.
// Halaman ini hanya menampilkan teks, jadi cukup memakai StatelessWidget.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // build() menyusun tampilan informasi aplikasi.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // ---------- LOGO APLIKASI ----------
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Color(0xFF202127),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.movie_filter,
                size: 52,
                color: Color(0xFFE5B96A),
              ),
            ),
            const SizedBox(height: 16),

            // ---------- NAMA APLIKASI ----------
            const Text(
              'CineView',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Versi 1.0.0',
              style: TextStyle(fontSize: 13, color: Colors.white54),
            ),
            const SizedBox(height: 20),

            // ---------- DESKRIPSI APLIKASI ----------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF202127),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tentang Aplikasi',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'CineView adalah aplikasi katalog film sederhana yang '
                    'menampilkan daftar film, pencarian judul, filter genre, '
                    'dan daftar tontonan pribadi (watchlist).',
                    style: TextStyle(color: Colors.white70, height: 1.5),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ---------- INFORMASI PEMBUAT ----------
            // Bagian ini boleh diubah sesuai data mahasiswa.
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF202127),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Informasi Pembuat',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Nama     : Athoillah Almadany',
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'NIM      : 2312345678',
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Kelas    : Teknik Informatika',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ---------- KETERANGAN TUGAS ----------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF202127),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.school, color: Color(0xFFE5B96A)),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Aplikasi ini dibuat untuk memenuhi tugas UAS mata kuliah '
                      'Pemrograman Mobile menggunakan Flutter.',
                      style: TextStyle(color: Colors.white70, height: 1.5),
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
