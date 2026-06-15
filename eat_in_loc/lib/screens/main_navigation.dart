import 'package:flutter/material.dart';
import 'home_page.dart';
import 'peta_page.dart';
import 'riwayat_page.dart';
import 'profile_page.dart';
import 'scan_qr_page.dart';

class MainNavigationWrapper extends StatefulWidget {
  const MainNavigationWrapper({super.key});

  @override
  State<MainNavigationWrapper> createState() => _MainNavigationWrapperState();
}

class _MainNavigationWrapperState extends State<MainNavigationWrapper> {
  int _currentTab = 0;
  
  final List<Widget> _screens = [
    const HomePage(),
    const PetaPage(),
    const RiwayatPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentTab, children: _screens),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: _currentTab == 0 ? const Color(0xFF1E3A8A) : Colors.grey),
                onPressed: () => setState(() => _currentTab = 0),
              ),
              IconButton(
                icon: Icon(Icons.map, color: _currentTab == 1 ? const Color(0xFF1E3A8A) : Colors.grey),
                onPressed: () => setState(() => _currentTab = 1),
              ),
              const SizedBox(width: 40), // Space for floating center QR button
              IconButton(
                icon: Icon(Icons.history, color: _currentTab == 2 ? const Color(0xFF1E3A8A) : Colors.grey),
                onPressed: () => setState(() => _currentTab = 2),
              ),
              IconButton(
                icon: Icon(Icons.person, color: _currentTab == 3 ? const Color(0xFF1E3A8A) : Colors.grey),
                onPressed: () => setState(() => _currentTab = 3),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF1E3A8A),
        child: const Icon(Icons.qr_code_scanner, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ScanQRPage()),
          );
        },
      ),
    );
  }
}