import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/detail'),
              child: const Text('Halaman Detail'),
            ),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () async {
                final result = await Navigator.pushNamed(context, '/form');
                if (result != null && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Riwayat Pesan: $result')),
                  );
                }
              },
              child: const Text('Input Data'),
            ),
          ],
        ),
      ),
    );
  }
}