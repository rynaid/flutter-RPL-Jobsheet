import 'package:flutter_test/flutter_test.dart';

// Pastikan import ini mengarah ke file main.dart kamu yang baru
import 'package:navigation_project_modern/main.dart'; 

void main() {
  testWidgets('Navigation smoke test', (WidgetTester tester) async {
    // Bangun aplikasi kita dan picu frame pertama.
    // Ganti 'MyApp' jika kamu menggunakan nama kelas lain di main.dart
    await tester.pumpWidget(const MyApp());

    // Verifikasi bahwa halaman utama menampilkan teks 'Home Screen' atau 'Beranda'
    // Sesuaikan teks di bawah ini dengan judul AppBar di home_screen.dart kamu
    expect(find.text('Home Screen'), findsOneWidget);
    expect(find.text('Detail Screen'), findsNothing);

    // Mengetes ketukan tombol untuk navigasi
    await tester.tap(find.text('Ke Halaman Detail'));
    await tester.pumpAndSettle(); // Tunggu animasi selesai

    // Verifikasi apakah kita sudah pindah ke halaman detail
    expect(find.text('Detail Screen'), findsOneWidget);
  });
}