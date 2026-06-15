import 'package:flutter/material.dart';

class KeranjangPesananScreen extends StatefulWidget {
  const KeranjangPesananScreen({super.key});

  @override
  State<KeranjangPesananScreen> createState() => _KeranjangPesananScreenState();
}

class _KeranjangPesananScreenState extends State<KeranjangPesananScreen> {
  String _paymentMethod = 'QR'; // Default payment toggle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang Pesanan'), backgroundColor: const Color(0xFF1E3A8A), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('ITEM DIPILIH', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
            _buildCartItem('Mie Ayam', 'Rp 15.000'),
            _buildCartItem('Es Teh', 'Rp 4.000'),
            const SizedBox(height: 24),
            const Text('RINGKASAN', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
            const SizedBox(height: 8),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [Text('1x Mie Ayam'), Text('Rp 15.000')]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [Text('1x Es Teh'), Text('Rp 4.000')]),
            const Divider(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [Text('Total Pembayaran', style: TextStyle(fontWeight: FontWeight.bold)), Text('Rp 19.000', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue))]),
            const SizedBox(height: 24),
            const Text('METODE PEMBAYARAN', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ChoiceChip(
                    label: const Center(child: Text('Scan QR')),
                    selected: _paymentMethod == 'QR',
                    onSelected: (val) => setState(() => _paymentMethod = 'QR'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ChoiceChip(
                    label: const Center(child: Text('Tunai')),
                    selected: _paymentMethod == 'Tunai',
                    onSelected: (val) => setState(() => _paymentMethod = 'Tunai'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: _paymentMethod == 'QR' ? const Color(0xFF1E3A8A) : Colors.green,
            padding: const EdgeInsets.all(16),
          ),
          onPressed: () => Navigator.pushNamed(context, '/status'),
          child: Text(
            _paymentMethod == 'QR' ? 'Bayar via Scan QR • Rp 19.000' : 'Pesan & Bayar Tunai • Rp 19.000',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildCartItem(String name, String price) {
    return ListTile(
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(price),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(icon: const Icon(Icons.remove_circle_outline), onPressed: () {}),
          const Text('1'),
          IconButton(icon: const Icon(Icons.add_circle_outline), onPressed: () {}),
        ],
      ),
    );
  }
}