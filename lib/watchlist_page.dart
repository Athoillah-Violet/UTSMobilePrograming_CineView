import 'package:flutter/material.dart';
import 'data.dart';
import 'detail_page.dart';

// Halaman Watchlist menampilkan film yang sudah ditambahkan pengguna.
// Datanya diambil dari daftarWatchlist di data.dart.
class WatchlistPage extends StatefulWidget {
  const WatchlistPage({super.key});

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  // build() menyusun tampilan daftar watchlist.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Watchlist')),
      body: daftarWatchlist.isEmpty
          // ---------- PESAN JIKA DAFTAR MASIH KOSONG ----------
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.bookmark_border, size: 64, color: Colors.white24),
                  SizedBox(height: 12),
                  Text(
                    'Watchlist masih kosong',
                    style: TextStyle(fontSize: 16, color: Colors.white54),
                  ),
                ],
              ),
            )
          // ---------- DAFTAR FILM WATCHLIST ----------
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: daftarWatchlist.length,
              itemBuilder: (context, index) {
                return kartuWatchlist(index);
              },
            ),
    );
  }

  // Membuat satu kartu film di halaman Watchlist.
  // Ditulis sebagai method di dalam class ini agar bisa memakai setState().
  Widget kartuWatchlist(int index) {
    Map<String, dynamic> film = daftarWatchlist[index];

    return GestureDetector(
      // Ketukan pada kartu membuka halaman detail film.
      onTap: () async {
        // Menunggu hingga halaman detail ditutup, lalu memperbarui tampilan.
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage(film: film)),
        );
        // setState() dipakai agar daftar terbaru langsung ditampilkan.
        setState(() {});
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
              width: 70,
              height: 95,
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
                    child: Icon(Icons.movie, size: 26, color: Colors.white38),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),

            // Judul dan keterangan film.
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    film['judul'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${film['tahun']}  •  ${film['genre']}',
                    style: const TextStyle(fontSize: 12, color: Colors.white54),
                  ),
                  const SizedBox(height: 4),
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

            // Tombol untuk menghapus film dari watchlist.
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.white54),
              onPressed: () {
                // setState() dipakai agar daftar langsung berubah setelah dihapus.
                setState(() {
                  daftarWatchlist.removeAt(index);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
