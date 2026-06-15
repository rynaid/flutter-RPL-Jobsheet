import 'notification_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _activeFilter = 'Semua';

  final List<Map<String, dynamic>> _allCanteens = [
    {'name': 'Kantin Teknik Elektro', 'status': 'Sepi', 'color': Colors.green, 'time': '15-20 menit', 'dist': '80m'},
    {'name': 'Kantin Teknik Sipil', 'status': 'Ramai', 'color': Colors.orange, 'time': '15-20 menit', 'dist': '110m'},
    {'name': 'Kantin Tata Niaga', 'status': 'Padat', 'color': Colors.red, 'time': '15-20 menit', 'dist': '90m'},
    {'name': 'Kantin Teknik Mesin', 'status': 'Sepi', 'color': Colors.green, 'time': '15-20 menit', 'dist': '85m'},
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredCanteens = _activeFilter == 'Semua'
        ? _allCanteens
        : _allCanteens.where((c) => c['status'] == _activeFilter).toList();

    return Scaffold(
      body: Column(
        children: [
          _buildHeader(context),
          _buildFilterRow(),
          Expanded(child: _buildCanteenList(filteredCanteens)),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
      color: const Color(0xFF1E3A8A),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Selamat datang 😊', style: TextStyle(color: Colors.white70, fontSize: 14)),
                  Text('Eat In Loc', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.white),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationPage()));
                },
              )
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Cari menu atau kantin...',
              prefixIcon: const Icon(Icons.search),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterRow() {
    List<String> filters = ['Semua', 'Sepi', 'Ramai', 'Padat'];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: filters.map((f) {
          bool isSelected = _activeFilter == f;
          return ChoiceChip(
            label: Text(f),
            selected: isSelected,
            selectedColor: const Color(0xFF1E3A8A),
            labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black87),
            onSelected: (val) => setState(() => _activeFilter = f),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCanteenList(List<Map<String, dynamic>> canteens) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: canteens.length,
      itemBuilder: (context, index) {
        final item = canteens[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: Container(width: 60, height: 60, color: Colors.blue[50]),
            title: Text(item['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(width: 10, height: 10, decoration: BoxDecoration(color: item['color'], shape: BoxShape.circle)),
                    const SizedBox(width: 6),
                    Text(item['status'], style: TextStyle(color: item['color'], fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 4),
                Text('${item['time']} • ${item['dist']}'),
              ],
            ),
            onTap: () => Navigator.pushNamed(context, '/kantin', arguments: item),
          ),
        );
      },
    );
  }
}