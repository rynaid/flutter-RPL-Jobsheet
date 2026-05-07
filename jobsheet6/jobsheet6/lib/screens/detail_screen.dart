import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Memberi jarak dari tepi layar
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Judul Detail
            const Text(
              'Tentang Aplikasi',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15), // Jarak antar elemen
            
            // Kalimat detail ringkas
            const Text(
              'Aplikasi ini dirancang untuk memudahkan navigasi antar halaman serta '
              'pengelolaan data secara efisien dan responsif bagi pengguna.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            
            const SizedBox(height: 30),
            
            // Tombol Kembali
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}