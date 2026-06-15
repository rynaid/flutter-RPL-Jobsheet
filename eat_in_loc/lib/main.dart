import 'package:flutter/material.dart';
import 'screens/auth_onboarding.dart';
import 'screens/main_navigation.dart';
import 'screens/kantin_detail_page.dart';
import 'screens/keranjang_pesanan_page.dart';
import 'screens/status_pesanan_page.dart';

void main() {
  runApp(const EatInLocApp());
}

class EatInLocApp extends StatelessWidget {
  const EatInLocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eat In Loc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF1E3A8A), // Deep navy from UI
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/main': (context) => const MainNavigationWrapper(),
        '/kantin': (context) => const KantinDetailScreen(),
        '/keranjang': (context) => const KeranjangPesananScreen(),
        '/status': (context) => const StatusPesananScreen(),
      },
    );
  }
}