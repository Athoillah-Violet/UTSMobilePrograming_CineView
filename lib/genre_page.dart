import 'package:flutter/material.dart';
import 'data.dart';
import 'detail_page.dart';

// Halaman Genre menampilkan daftar genre film.
// Ketika salah satu genre ditekan, halaman ini menampilkan film dengan
// genre tersebut. Dibuat StatefulWidget karena tampilannya berubah.
class GenrePage extends StatefulWidget {
  const GenrePage({super.key});

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  // Menyimpan genre yang sedang dipilih.
  // Bernilai kosong berarti pengguna masih melihat daftar semua genre.
  String genreDipilih = '';

  // Menghitung jumlah film untuk satu genre tertentu.
  int jumlahFilm(String genre) {
    int jumlah = 0;
    for (int i = 0; i < daftarFilm.length; i++) {
      if (daftarFilm[i]['genre'] == genre) {
        jumlah = jumlah + 1;
      }
    }
    return jumlah;
  }

  // Mengambil daftar film yang sesuai dengan genre yang dipilih.
  List<Map<String, dynamic>> filmSesuaiGenre() {
    List<Map<String, dynamic>> hasil = [];
    for (int i = 0; i < daftarFilm.length; i++) {
      if (daftarFilm[i]['genre'] == genreDipilih) {
        hasil.add(daftarFilm[i]);
      }
    }
    return hasil;
  }

  // build() memilih tampilan: daftar genre atau daftar film per genre.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Genre')),
      body: genreDipilih == '' ? tampilanDaftarGenre() : tampilanFilmGenre(),
    );
  }

  // ---------- TAMPILAN DAFTAR GENRE ----------
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
        return GestureDetector(
          // setState() dipakai agar halaman langsung menampilkan film
          // dari genre yang baru saja ditekan.
          onTap: () {
            setState(() {
              genreDipilih = daftarGenre[index]['nama'];
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
                // Ikon genre dengan warna aksen emas.
                Icon(
                  daftarGenre[index]['ikon'],
                  size: 34,
                  color: const Color(0xFFE5B96A),
                ),
                const SizedBox(height: 10),
                Text(
                  daftarGenre[index]['nama'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  '${jumlahFilm(daftarGenre[index]['nama'])} film',
                  style: const TextStyle(fontSize: 12, color: Colors.white54),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ---------- TAMPILAN FILM SESUAI GENRE ----------
  Widget tampilanFilmGenre() {
    List<Map<String, dynamic>> hasil = filmSesuaiGenre();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tombol untuk kembali melihat daftar semua genre.
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              TextButton.icon(
                onPressed: () {
                  setState(() {
                    genreDipilih = '';
                  });
                },
                icon: const Icon(Icons.arrow_back, size: 18),
                label: const Text('Semua Genre'),
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFFE5B96A),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: Text(
            '$genreDipilih (${hasil.length} film)',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        // Daftar film dengan genre yang dipilih.
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: hasil.length,
            itemBuilder: (context, index) {
              return KartuFilmGenre(film: hasil[index]);
            },
          ),
        ),
      ],
    );
  }
}

// Widget kecil untuk menampilkan satu film pada daftar genre.
class KartuFilmGenre extends StatelessWidget {
  // Data film dikirim melalui constructor.
  final Map<String, dynamic> film;

  const KartuFilmGenre({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Ketukan pada kartu membuka halaman detail film.
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage(film: film)),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFF202127),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Poster kecil film.
            Container(
              width: 60,
              height: 85,
              decoration: BoxDecoration(
                color: const Color(0xFF111318),
                borderRadius: BorderRadius.circular(8),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                film['poster'],
                fit: BoxFit.cover,
                // Pengganti gambar jika file poster belum tersedia.
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.movie, size: 24, color: Colors.white38),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            // Judul dan tahun film.
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    film['judul'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${film['tahun']}  •  ${film['genre']}',
                    style: const TextStyle(fontSize: 12, color: Colors.white54),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.white38),
          ],
        ),
      ),
    );
  }
}
