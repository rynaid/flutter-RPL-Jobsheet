import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Menggunakan package ini agar tidak perlu download file font manual

// Attention, This Assignment was Created with assistance by LLM
// Assignment: Create a Flutter app with the following features:
// 1. A TextField to input text, and a button that shows the input text in a popup when pressed.
// 2. Two buttons that show different fonts in a popup when pressed (Menggunakan Google Fonts online).
// 3. A dropdown menu with two options: "Beautiful Mountain" and "Green Forest". When selected, show corresponding network images.
// 4. A volume control with a Text widget showing the current volume level and two buttons to increase and decrease the volume. 

void main() { 
  runApp(const MyApp());
}

// Fungsi ini menampilkan popup dialog berisi gambar dari network
void _showImagePopup(BuildContext context, String title, Widget imageWidget) { 
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min, 
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: imageWidget, // Menampilkan gambar network yang dipilih
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Close"),
          ),
        ],
      );
    },
  );
}

class MyApp extends StatelessWidget { 
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      title: 'First Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false, // Mempertahankan style biru klasik sesuai template awal
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget { 
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState(); 
}

class _HomeState extends State<Home> { 
  String? selectedValue; 
  int volumeValue = 10; 
  final TextEditingController _controller = TextEditingController(); 

  // URL Gambar Pemandangan Alam (Tema Baru)
  final String imageUrlThemeA = 'https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=500&auto=format&fit=crop&q=60'; // Yosemite Valley (Mountain)
  final String imageUrlThemeB = 'https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?w=500&auto=format&fit=crop&q=60'; // Mystical Forest

  @override
  void dispose() {
    _controller.dispose(); // Memastikan controller dihapus dari memori saat widget dihancurkan
    super.dispose();
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jobsheet 4 - Flutter Widgets"),
        centerTitle: true,
      ), 
      body: Center( 
        child: SingleChildScrollView( // Mencegah terjadinya overflow saat keyboard muncul
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              // --- SEKSI 1: 1 TextField & Submit Button ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: TextField( 
                  controller: _controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Silahkan Masukkan Kalimat Anda',
                  ),
                ),
              ),

              ElevatedButton( 
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Kalimat Anda:"),
                        content: Text(_controller.text.isEmpty ? "No command entered!" : _controller.text),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Close'),
                          ), 
                        ],
                      );
                    },
                  );
                },
                child: const Text('Submit'),
              ),
              
              const SizedBox(height: 30),      
              
              // --- SEKSI 2: 2 Buttons (Custom Fonts via Google Fonts) ---    
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton( 
                    onPressed: () {
                      showDialog( 
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(
                              'Font A (Marker Style)',
                              // Menggunakan Google Fonts "Permanent Marker" (Gaya komik/kasual yang tebal)
                              style: GoogleFonts.permanentMarker(fontSize: 32),
                            ),
                            actions: [ 
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text("Font A", style: TextStyle(fontSize: 18)),
                  ),

                  const SizedBox(width: 20), // Jarak horizontal antar tombol

                  OutlinedButton( 
                    onPressed: () {
                      showDialog( 
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(
                              'Font B (Elegant Style)',
                              // Menggunakan Google Fonts "Cinzel" (Gaya serif yang elegan dan formal)
                              style: GoogleFonts.cinzel(
                                fontSize: 24, 
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            actions: [ 
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('Close'), 
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text("Font B", style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
              
              const SizedBox(height: 30), 
              
              // --- SEKSI 3: Dropdown & Volume Control ---
              Column(
                children: [
                  // Dropdown dengan dua Gambar Pemandangan Alam
                  DropdownButton<String>( 
                    hint: const Text("Select Media Type"),
                    value: selectedValue,
                    items: [
                      DropdownMenuItem( 
                        value: "Network_A",
                        child: Row(
                          children: [
                            Image.network(imageUrlThemeA, width: 24, height: 24, fit: BoxFit.cover),
                            const SizedBox(width: 10),
                            const Text("Beautiful Mountain"),
                          ],
                        ),
                      ),
                      DropdownMenuItem( 
                        value: "Network_B",
                        child: Row(
                          children: [
                            Image.network(imageUrlThemeB, width: 24, height: 24, fit: BoxFit.cover),
                            const SizedBox(width: 10),
                            const Text("Green Forest"),
                          ],
                        ),
                      ),
                    ],
                    onChanged: (val) { 
                      setState(() => selectedValue = val); 
                      
                      if (val == "Network_A") { 
                        _showImagePopup(
                          context, 
                          "Yosemite Valley", 
                          Image.network(imageUrlThemeA, fit: BoxFit.cover)
                        );
                      } else if (val == "Network_B") { 
                        _showImagePopup(
                          context, 
                          "Mystical Forest", 
                          Image.network(imageUrlThemeB, fit: BoxFit.cover)
                        );
                      }
                    },
                  ),
                  
                  const SizedBox(height: 20), 

                  // Volume Control Row
                  Row( 
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton( 
                        icon: const Icon(Icons.volume_down),
                        onPressed: () => setState(() {
                          if (volumeValue > 0) volumeValue--; // Mencegah volume minus
                        }),
                      ),
                      Text(
                        "Volume: $volumeValue", 
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      IconButton( 
                        icon: const Icon(Icons.volume_up),
                        onPressed: () => setState(() {
                          if (volumeValue < 100) volumeValue++; // Batas maksimal volume 100
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}