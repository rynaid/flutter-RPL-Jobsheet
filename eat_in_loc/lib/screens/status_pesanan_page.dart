import 'package:flutter/material.dart';

class StatusPesananScreen extends StatelessWidget {
  const StatusPesananScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Status Pesanan'), backgroundColor: const Color(0xFF1E3A8A), foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(color: Colors.green[500], borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: const [
                  Text('Nomor Antrian', style: TextStyle(color: Colors.white70, fontSize: 16)),
                  Text('024', style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold)),
                  Text('Kantin Teknik Sipil', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                  SizedBox(height: 8),
                  Text('Silahkan ambil pesananmu!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView(
                children: [
                  _buildProgressStep('Pesanan Diterima', 'Selesai', true),
                  _buildProgressStep('Sedang Dimasak', 'Selesai', true),
                  _buildProgressStep('Siap Diambil', 'Ambil di Kantin Sipil', false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressStep(String title, String subtitle, bool isDone) {
    return ListTile(
      leading: Icon(isDone ? Icons.check_circle : Icons.radio_button_unchecked, color: isDone ? Colors.green : Colors.grey),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: isDone ? Colors.black : Colors.grey)),
      subtitle: Text(subtitle),
    );
  }
}