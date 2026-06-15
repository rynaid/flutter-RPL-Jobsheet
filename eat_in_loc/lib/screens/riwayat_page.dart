import 'package:flutter/material.dart';

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pesanan'),
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.amber[100],
            child: Text( // Diperbaiki: Kata const di sini sudah dihapus
              'Kamu sudah pesan 4 kali minggu ini!',
              style: TextStyle(color: Colors.amber[900], fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.all(12),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Kantin T. Elektro', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(color: Colors.green[100], borderRadius: BorderRadius.circular(8)),
                            child: const Text('Done', style: TextStyle(color: Colors.green)),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text('Hari ini, 12:30 • 2 item', style: TextStyle(color: Colors.grey)),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Nasi Goreng Spesial, Es Teh Manis'),
                          Text('Rp 12.000', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Text('Beri nilai pesanan ini: '),
                          ...List.generate(5, (i) => const Icon(Icons.star_border, color: Colors.amber, size: 20)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}