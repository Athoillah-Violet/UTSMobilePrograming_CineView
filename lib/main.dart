import 'package:flutter/material.dart';
import 'explore_page.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'watchlist_page.dart';

// Titik masuk aplikasi CineView.
void main() {
  runApp(const AplikasiCineView());
}

// Widget utama aplikasi.
// Dibuat StatefulWidget karena harus menyimpan menu bawah yang sedang dipilih,
// sehingga tampilan bisa berubah ketika pengguna menekan menu lain.
class AplikasiCineView extends StatefulWidget {
  const AplikasiCineView({super.key});

  @override
  State<AplikasiCineView> createState() => _AplikasiCineViewState();
}

class _AplikasiCineViewState extends State<AplikasiCineView> {
  // Menyimpan urutan menu yang aktif (0 = Home, 1 = Explore, 2 = Watchlist, 3 = Profile).
  int menuAktif = 0;

  // build() dipanggil setiap kali state berubah untuk menggambar ulang tampilan.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Banner debug dimatikan agar tampilan lebih bersih.
      debugShowCheckedModeBanner: false,
      title: 'CineView',
      // Tema dark mode yang dipakai seluruh halaman.
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
        // Bagian tengah menampilkan halaman sesuai menu yang dipilih.
        body: halamanYangTampil(),
        // Menu navigasi bawah dengan empat pilihan utama.
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: menuAktif,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            // setState() dipakai agar tampilan langsung berubah saat menu ditekan.
            setState(() {
              menuAktif = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Watchlist'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }

  // Mengembalikan halaman yang harus ditampilkan berdasarkan menuAktif.
  Widget halamanYangTampil() {
    if (menuAktif == 0) {
      return const HomePage();
    } else if (menuAktif == 1) {
      return const ExplorePage();
    } else if (menuAktif == 2) {
      return const WatchlistPage();
    } else {
      return const ProfilePage();
    }
  }
}
