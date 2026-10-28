import 'package:flutter/material.dart';

import 'genre_page.dart';
import 'home_page.dart';
import 'katalog_page.dart';
import 'profile_page.dart';

// Fungsi utama: Titik awal jalannya aplikasi Flutter
void main() {
  runApp(const AplikasiCineView());
}

// Widget root aplikasi: Mengatur konfigurasi tema global dan navigasi menu bawah
class AplikasiCineView extends StatefulWidget {
  const AplikasiCineView({super.key});

  @override
  State<AplikasiCineView> createState() => _AplikasiCineViewState();
}

class _AplikasiCineViewState extends State<AplikasiCineView> {
  // Index menu tab yang sedang aktif:
  // 0 = Home, 1 = Katalog, 2 = Genre, 3 = Profile
  int menuAktif = 0;

  // Fungsi helper: Menentukan widget halaman yang ditampilkan sesuai nilai menuAktif
  Widget halamanYangTampil() {
    if (menuAktif == 0) {
      return const HomePage();
    } else if (menuAktif == 1) {
      return const KatalogPage();
    } else if (menuAktif == 2) {
      return const GenrePage();
    } else {
      return const ProfilePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CineView',
      // Pengaturan tema gelap (Dark Theme) sederhana
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF111318),
        colorScheme: const ColorScheme.dark(primary: Color(0xFFE5B96A)),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF111318),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF202127),
          selectedItemColor: Color(0xFFE5B96A),
          unselectedItemColor: Colors.white54,
        ),
      ),
      home: Scaffold(
        // Menampilkan halaman sesuai tab yang dipilih
        body: halamanYangTampil(),

        // Navigasi Tab Bawah (BottomNavigationBar)
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: menuAktif,
          type: BottomNavigationBarType.fixed,
          // Saat ikon tab ditekan, setState() mengubah menuAktif sehingga tampilan berganti
          onTap: (index) {
            setState(() {
              menuAktif = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Katalog'),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Genre'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
