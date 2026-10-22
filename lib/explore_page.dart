import 'package:flutter/material.dart';
import 'data.dart';
import 'detail_page.dart';

// Halaman Explore untuk mencari film dan menyaring berdasarkan genre.
// Dibuat StatefulWidget karena isi halaman berubah mengikuti kata kunci
// pencarian dan genre yang dipilih.
class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  // Menyimpan teks yang diketik pengguna pada kolom pencarian.
  String kataKunci = '';

  // Menyimpan genre yang sedang dipilih. 'Semua' berarti tanpa filter.
  String genreDipilih = 'Semua';

  // Menyaring daftar film berdasarkan kata kunci dan genre yang dipilih.
  List<Map<String, dynamic>> hasilPencarian() {
    List<Map<String, dynamic>> hasil = [];
    for (int i = 0; i < daftarFilm.length; i++) {
      Map<String, dynamic> film = daftarFilm[i];

      // Mengecek apakah judul film mengandung kata kunci pencarian.
      bool cocokJudul = film['judul']
          .toString()
          .toLowerCase()
          .contains(kataKunci.toLowerCase());

      // Mengecek apakah genre film sama dengan genre yang dipilih.
      bool cocokGenre = genreDipilih == 'Semua' || film['genre'] == genreDipilih;

      // Film dimasukkan ke hasil hanya jika kedua syarat terpenuhi.
      if (cocokJudul && cocokGenre) {
        hasil.add(film);
      }
    }
    return hasil;
  }

  // Daftar pilihan genre untuk filter, ditambah pilihan 'Semua'.
  List<String> daftarFilterGenre() {
    List<String> semuaGenre = ['Semua'];
    for (int i = 0; i < daftarGenre.length; i++) {
      semuaGenre.add(daftarGenre[i]['nama']);
    }
    return semuaGenre;
  }

  // build() menyusun tampilan halaman Explore.
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> hasil = hasilPencarian();

    return Scaffold(
      appBar: AppBar(title: const Text('Explore')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------- KOLOM PENCARIAN ----------
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Cari judul film...',
                hintStyle: const TextStyle(color: Colors.white38),
                prefixIcon: const Icon(Icons.search, color: Colors.white54),
                filled: true,
                fillColor: const Color(0xFF202127),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              // setState() dipanggil setiap kali teks berubah
              // supaya hasil pencarian langsung diperbarui.
              onChanged: (teks) {
                setState(() {
                  kataKunci = teks;
                });
              },
            ),
          ),

          // ---------- PILIHAN GENRE ----------
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 16),
              itemCount: daftarFilterGenre().length,
              itemBuilder: (context, index) {
                String genre = daftarFilterGenre()[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(genre),
                    selected: genreDipilih == genre,
                    selectedColor: const Color(0xFFE5B96A),
                    backgroundColor: const Color(0xFF202127),
                    side: BorderSide.none,
                    labelStyle: TextStyle(
                      color: genreDipilih == genre ? Colors.black : Colors.white70,
                    ),
                    // setState() dipakai agar daftar film menyesuaikan genre baru.
                    onSelected: (dipilih) {
                      setState(() {
                        genreDipilih = genre;
                      });
                    },
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 12),

          // ---------- DAFTAR POSTER DALAM GRID DUA KOLOM ----------
          Expanded(
            child: hasil.isEmpty
                // Pesan jika tidak ada film yang cocok dengan pencarian.
                ? const Center(
                    child: Text(
                      'Film tidak ditemukan',
                      style: TextStyle(color: Colors.white54),
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: hasil.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      mainAxisExtent: 260,
                    ),
                    itemBuilder: (context, index) {
                      return KartuPosterGrid(film: hasil[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// Widget kecil untuk menampilkan poster film di dalam GridView.
class KartuPosterGrid extends StatelessWidget {
  // Data film dikirim melalui constructor.
  final Map<String, dynamic> film;

  const KartuPosterGrid({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Ketukan pada poster membuka halaman detail film.
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage(film: film)),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          Text(
            '${film['tahun']}  •  ${film['genre']}',
            style: const TextStyle(fontSize: 12, color: Colors.white54),
          ),
        ],
      ),
    );
  }
}
