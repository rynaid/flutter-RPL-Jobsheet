// ------------------------------------------------Import libraries
import 'package:flutter/material.dart';
// ------------------------------------------------Import libraries

// Project ini berisi:
// Widgets: Expanded, Flexible, LayoutBuilder, MediaQuery, 
// Dan sebuah custom ResponsiveLayout widget yang berganti antara mobile 
// dan desktop berdasarkan lebar layar. Home screen menampilkan info layar 
// serta eksperimen penataan widget Expanded & Flexible untuk tampilan mobile dan desktop.

//--------------------------------------------------Main Function
void main() {
  runApp(const MyApp());
}
//--------------------------------------------------Main Function

//------------------------------::----------------MyApp Class
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false, // Mempertahankan kecocokan dengan struktur kode lama
        primarySwatch: Colors.teal, // Mengganti Blue standar menjadi Teal yang lebih segar
      ),
      home: const Home(),
    );
  }
}
//----------------------------------------------MyApp Class

//----------------------------------------------------Class Of Home Widget
class Home extends StatefulWidget { 
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState(); 
}
//----------------------------------------------------Class Of Home Widget

//----------------------------------------------------Class Of Expanded Widget
class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          // WARNA BARU: Warm Mustard/Sand Accent
          color: const Color(0xFFD97706), 
          borderRadius: BorderRadius.circular(12), // Border radius lebih lembut (modern)
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Center(
            child: Text(
              'Expanded Widget',
              style: TextStyle(
                color: Colors.white, 
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//------------------------------------------------------------------Expanded Widget

//------------------------------------------------------Class Of Flexible Widget
class FlexibleWidget extends StatelessWidget {
  const FlexibleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          // WARNA BARU: Terracotta / Warm Rust Red
          color: const Color(0xFFB91C1C), 
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Center(
            child: Text(
              'Flexible Widget',
              style: TextStyle(
                color: Colors.white, 
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//------------------------------------------------------------------Flexible Widget

//------------------------------------------------------Class Of Responsive Layout Widget
class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody; 
  final Widget desktopBody; 

  const ResponsiveLayout({
    super.key,
    required this.mobileBody,
    required this.desktopBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Jika lebar layar lebih dari 800px, tampilkan Desktop
        if (constraints.maxWidth > 800) {
          return desktopBody;
        } else {
          return mobileBody;
        }
      },
    );
  }
}
//------------------------------------------------------Class Of Responsive Layout Widget

//----------------------------------------------------State Class For Home Screen
class _HomeState extends State<Home> { 
  @override
  Widget build(BuildContext context) { 
    Size screenSize = MediaQuery.of(context).size; 
    Orientation orientation = MediaQuery.of(context).orientation; 

    return Scaffold( 
      // WARNA BARU: AppBar menggunakan Slate Dark yang solid & modern
      appBar: AppBar(
        title: const Text(
          "Jobsheet 5 - Responsive Widgets",
          style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.5),
        ),
        backgroundColor: const Color(0xFF0F172A), 
        elevation: 0,
      ),
      // WARNA BARU: Background menggunakan warna Slate Grey lembut
      backgroundColor: const Color(0xFF1E293B), 
      body: ResponsiveLayout( 
//------------------------------------------------------MOBILE VIEW        
        mobileBody: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          children: <Widget>[
            // Screen Info Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF334155), // Card background abu-abu gelap
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    'Screen width: ${screenSize.width.toStringAsFixed(2)} px',
                    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Orientation: ${orientation.toString().split('.').last.toUpperCase()}',
                    style: const TextStyle(color: Color(0xFF38BDF8), fontSize: 16, fontWeight: FontWeight.bold), // Highlight warna biru cyan
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Widget Row Experiments
            Column(
              children: [
                const Row(children: [ExpandedWidget()]),
                const SizedBox(height: 12),
                const Row(children: [FlexibleWidget()]),
                const SizedBox(height: 24),
                const Row(children: [FlexibleWidget()]),
                const SizedBox(height: 12),
                const Row(children: [ExpandedWidget()]),
                const SizedBox(height: 24),
                const Row(children: [ExpandedWidget()]),
                const SizedBox(height: 12),
                const Row(children: [ExpandedWidget()]),
                const SizedBox(height: 24),
                const Row(children: [FlexibleWidget()]),
                const SizedBox(height: 12),
                const Row(children: [FlexibleWidget()]),
              ],
            ),
          ],
        ),
//------------------------------------------------------MOBILE VIEW

//------------------------------------------------------DESKTOP VIEW
        desktopBody: Container(
          color: const Color(0xFF0F172A), // Background dasar desktop gelap
          width: double.infinity,
          height: double.infinity,
          // PERUBAHAN UTAMA: Dibungkus dengan SingleChildScrollView agar bisa di-scroll saat overflow
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(), // Efek mantul saat scroll habis (opsional)
            child: Center(
              child: Container(
                // Menggunakan BoxConstraints untuk membatasi lebar maksimal di desktop
                constraints: const BoxConstraints(maxWidth: 1000), 
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Screen Info Section
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E293B),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Screen width: ${screenSize.width.toStringAsFixed(2)} px',
                            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Orientation: ${orientation.toString().split('.').last.toUpperCase()}',
                            style: const TextStyle(color: Color(0xFF38BDF8), fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    // Widget Row Experiments
                    Column(
                      children: [
                        const Row(children: [ExpandedWidget(), SizedBox(width: 12), FlexibleWidget()]),
                        const SizedBox(height: 20),
                        const Row(children: [FlexibleWidget(), SizedBox(width: 12), ExpandedWidget()]),
                        const SizedBox(height: 20),
                        const Row(children: [ExpandedWidget(), SizedBox(width: 12), ExpandedWidget()]),
                        const SizedBox(height: 20),
                        const Row(children: [FlexibleWidget(), SizedBox(width: 12), FlexibleWidget()]),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
//------------------------------------------------------DESKTOP VIEW
      ),
    );
  }
}
//----------------------------------------------------State Class For Home Screen