import 'package:flutter/material.dart';

class KantinDetailScreen extends StatelessWidget {
  const KantinDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Kantin Teknik Elektro'),
          backgroundColor: const Color(0xFF1E3A8A),
          foregroundColor: Colors.white,
          bottom: const TabBar(
            tabs: [Tab(text: 'Semua'), Tab(text: 'Makanan'), Tab(text: 'Minuman')],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
          ),
        ),
        body: const TabBarView(
          children: [
            MenuList(filter: 'semua'),
            MenuList(filter: 'makanan'),
            MenuList(filter: 'minuman'),
          ],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1E3A8A), padding: const EdgeInsets.all(16)),
            onPressed: () => Navigator.pushNamed(context, '/keranjang'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Lihat Keranjang (2 items)', style: TextStyle(color: Colors.white)),
                Text('Rp 19.000', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuList extends StatelessWidget {
  final String filter;
  const MenuList({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    final allItems = [
      {'name': 'Mie Ayam', 'price': 'Rp 15.000', 'type': 'makanan'},
      {'name': 'Nasi Goreng', 'price': 'Rp 15.000', 'type': 'makanan'},
      {'name': 'Es Teh', 'price': 'Rp 4.000', 'type': 'minuman'},
      {'name': 'Nutrisari', 'price': 'Rp 4.000', 'type': 'minuman'},
    ];

    final filtered = filter == 'semua' ? allItems : allItems.where((i) => i['type'] == filter).toList();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filtered.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(filtered[index]['name']!),
          subtitle: Text(filtered[index]['price']!),
          trailing: IconButton(icon: const Icon(Icons.add_circle, color: Color(0xFF1E3A8A)), onPressed: () {}),
        ),
      ),
    );
  }
}