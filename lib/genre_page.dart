import 'package:flutter/material.dart';

import 'data.dart';
import 'detail/detail_page.dart';

// Halaman Genre:
// Menampilkan daftar kategori genre (Action, Comedy, Drama, Horror, Animation).
// Ketika salah satu genre dipilih, halaman akan beralih menampilkan daftar film genre tersebut.
class GenrePage extends StatefulWidget {
  const GenrePage({super.key});

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  // Variabel state penampung genre yang sedang dipilih.
  // Jika bernilai kosong (''), maka menampilkan daftar kategori genre (grid ikon).
  // Jika berisi nama genre (misal 'Action'), maka menampilkan daftar film dalam genre tersebut.
  String genreDipilih = '';

  // Fungsi helper: Menghitung total film yang memiliki genre tertentu
  int jumlahFilm(String genre) {
    int total = 0;
    for (int i = 0; i < daftarFilm.length; i++) {
      if (daftarFilm[i]['genre'] == genre) {
        total++;
      }
    }
    return total;
  }

  // Fungsi helper: Mengambil list film yang genrenya sesuai dengan genreDipilih
  List<Map<String, dynamic>> filmSesuaiGenre() {
    List<Map<String, dynamic>> hasil = [];
    for (int i = 0; i < daftarFilm.length; i++) {
      if (daftarFilm[i]['genre'] == genreDipilih) {
        hasil.add(daftarFilm[i]);
      }
    }
    return hasil;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Judul AppBar menyesuaikan: jika dalam kategori maka nama genre, jika awal maka 'Genre'
        title: Text(genreDipilih == '' ? 'Genre' : genreDipilih),
        // Tombol kembali di AppBar hanya ditampilkan jika sedang melihat film per-genre
        leading: genreDipilih != ''
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  // Mengembalikan genreDipilih ke kosong agar kembali ke daftar kategori
                  setState(() {
                    genreDipilih = '';
                  });
                },
              )
            : null,
      ),
      // Kondisi pemilihan tampilan: grid kategori atau daftar film
      body: genreDipilih == '' ? tampilanDaftarGenre() : tampilanFilmGenre(),
    );
  }

  // ==========================================
  // TAMPILAN 1: GRID KATEGORI GENRE
  // ==========================================
  Widget tampilanDaftarGenre() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: daftarGenre.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        mainAxisExtent: 130,
      ),
      itemBuilder: (context, index) {
        final genre = daftarGenre[index];
        return GestureDetector(
          // Saat kartu genre ditekan, ubah genreDipilih dan render ulang halaman
          onTap: () {
            setState(() {
              genreDipilih = genre['nama'];
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF202127),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  genre['ikon'],
                  size: 34,
                  color: const Color(0xFFE5B96A),
                ),
                const SizedBox(height: 10),
                Text(
                  genre['nama'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  '${jumlahFilm(genre['nama'])} film',
                  style: const TextStyle(fontSize: 12, color: Colors.white54),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ==========================================
  // TAMPILAN 2: DAFTAR FILM SESUAI GENRE
  // ==========================================
  Widget tampilanFilmGenre() {
    List<Map<String, dynamic>> filmList = filmSesuaiGenre();

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filmList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.68,
      ),
      itemBuilder: (context, index) {
        final film = filmList[index];

        return GestureDetector(
          // Pindah ke DetailPage saat poster film ditekan
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailPage(film: film)),
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
                        '${film['tahun']} • ⭐ ${film['rating']}',
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
    );
  }
}
