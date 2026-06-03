import 'package:flutter_test/flutter_test.dart';
import 'package:jobsheet7/main.dart';

void main() {
  testWidgets('Menguji apakah halaman utama berhasil dimuat', (WidgetTester tester) async {
    // Memuat aplikasi ke dalam sistem pengujian
    await tester.pumpWidget(const MyApp());

    // Memverifikasi apakah judul aplikasi muncul dengan benar di layar
    expect(find.text('Flutter HTTP Tugas'), findsOneWidget);
  });
}