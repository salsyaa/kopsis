import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 1. DATA BARANG (5 barang dengan atribut kategori, harga, dan stok)
  final List<Map<String, dynamic>> daftarBarang = const [
    {'nama': 'Buku Tulis', 'kategori': 'ATK', 'anggota': 3000, 'umum': 3500, 'stok': 40},
    {'nama': 'Pulpen', 'kategori': 'ATK', 'anggota': 2500, 'umum': 3000, 'stok': 25},
    {'nama': 'Roti', 'kategori': 'makanan', 'anggota': 5000, 'umum': 5500, 'stok': 15},
    {'nama': 'Teh Botol', 'kategori': 'minuman', 'anggota': 4000, 'umum': 4500, 'stok': 0},
    {'nama': 'Pensil', 'kategori': 'ATK', 'anggota': 2000, 'umum': 2500, 'stok': 10},
    // Tambahkan barang 
    {'nama': 'Kue Kering', 'kategori': 'makanan', 'anggota': 6000, 'umum': 6500, 'stok': 5},
    {'nama': 'Air Mineral', 'kategori': 'minuman', 'anggota': 3000, 'umum': 3500, 'stok': 20},
    {'nama': 'Penghapus', 'kategori': 'ATK', 'anggota': 1500, 'umum': 2000, 'stok': 30},
    {'nama': 'Snack', 'kategori': 'makanan', 'anggota': 7000, 'umum': 7500, 'stok': 8},
    {'nama': 'Susu UHT', 'kategori': 'minuman', 'anggota': 5000, 'umum': 5500, 'stok': 12},
  ];

  // 2. FUNGSI IKON OTOMATIS BERDASARKAN KATEGORI
  IconData getIconKategori(String kat) {
    if (kat == 'ATK') {
      return Icons.edit;
    } else if (kat == 'makanan') {
      return Icons.fastfood;
    } else if (kat == 'minuman') {
      return Icons.local_drink;
    }
    return Icons.inventory_2;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Koperasi Sekolah')),

        // 3. MENAMPILKAN DAFTAR SECARA OTOMATIS DENGAN LISTVIEW.BUILDER
        body: ListView.builder(
          itemCount: daftarBarang.length,
          itemBuilder: (context, index) {
            final barang = daftarBarang[index];
            return Card(
              elevation: 4, // Memberikan efek bayangan pada kartu
              margin: const EdgeInsets.all(8),
              child: ListTile(
                // Ikon otomatis dari fungsi getIconKategori
                leading: Icon(getIconKategori(barang['kategori'])),
                title: Text(
                  barang['nama'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Anggota Rp${barang['anggota']} | Umum Rp${barang['umum']}'),
                // Stok berwarna merah jika 0, hitam jika ada
                trailing: Text(
                  'Stok ${barang['stok']}',
                  style: TextStyle(
                    color: barang['stok'] == 0 ? Colors.red : Colors.black,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}