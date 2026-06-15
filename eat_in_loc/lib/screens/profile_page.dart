import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(radius: 50, backgroundColor: Colors.blue[100], child: const Icon(Icons.person, size: 50)),
                  const SizedBox(height: 16),
                  const Text('Mahasiswa Polines', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text('Tentang Aplikasi Ini', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text(
              'LOG IN LOC (Eat-in-Loc) adalah konsep aplikasi mobile berbasis lokasi yang dirancang untuk mentransformasi pengalaman kuliner mahasiswa di lingkungan kampus.\n\nAplikasi ini hadir sebagai solusi cerdas untuk mengatasi masalah antrean panjang, ketidakpastian stok menu, dan manajemen waktu istirahat mahasiswa yang terbatas.',
              style: TextStyle(height: 1.6, color: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}