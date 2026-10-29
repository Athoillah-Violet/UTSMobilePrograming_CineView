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
            // ---------- FOTO PROFIL / LOGO ----------
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Color(0xFF202127),
                shape: BoxShape.circle,
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                'assets/images/profile.jpeg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.movie_filter,
                      size: 52,
                      color: Color(0xFFE5B96A),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // ---------- NAMA Profil ----------
            const Text(
              'Athoillah',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Filem Treveler',
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
                  Text('Bio', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(
                    'Menikmati Filem dari segala genre dan berbagai negara, untuk mencari pengetahuan yang lebih mendalam dari segala sudut pandang.',
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
                    'Nama     : Ahmad Athoillah Almadany',
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'NPM      : 24670012',
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Kelas    : 5A Teknik Informatika',
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
                      'Kurang lebih inilah Aplikasi Mobile untuk Tugas UTS Mobile Prorgaiming yang saya buat.',
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
