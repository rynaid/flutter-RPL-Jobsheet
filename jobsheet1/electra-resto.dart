void main() {
  // 1 & 2. Menentukan variabel dengan tipe data yang tepat dan mengisinya
  String namaRestoran = "Electra Seafood";
  int tahunDidirikan = 2023;
  String pemilik = "Mbok Yem";
  String alamat = "JL. Prof. Soedarto, SH, Tembalang";
  bool isBuka = true; // Menggunakan boolean untuk status Buka/Tutup

  // Menggunakan Map untuk Daftar Makanan (Nama Makanan: Harga)
  Map<String, int> daftarMakanan = {
    "Kepiting Rebus": 40000,
    "Nasi Goreng": 20000,
    "Udang Asam Manis": 50000,
    "Sate Cumi": 30000,
  };

  // Menggunakan Map untuk Daftar Minuman (Nama Minuman: Harga)
  Map<String, int> daftarMinuman = {
    "Es Jeruk": 5000,
    "Es Teh": 2000,
    "Es Jus": 6000,
  };

  // 3. Mencetak data restoran dengan fungsi print()
  print("Data Restoran");
  print("---------------------------------------------------------------");
  print("Nama            : $namaRestoran");
  print("Tahun Didirikan : $tahunDidirikan");
  print("Pemilik         : $pemilik");
  print("Alamat          : $alamat");
  print("Status Buka     : ${isBuka ? 'Buka' : 'Tutup'}");

  // Fix: Make the "Daftar Makanan" header conditional.
  // This addresses a potential (albeit unusual) linter warning if it considers
  // printing a header for an empty list as "dead" or "unnecessary" code.
  if (daftarMakanan.isNotEmpty) {
    print("Daftar Makanan  :");
    daftarMakanan.forEach((nama, harga) {
      print("- $nama (${harga ~/ 1000}rb)");
    });
  }

  // Apply the same conditional logic to "Daftar Minuman" for consistency.
  if (daftarMinuman.isNotEmpty) {
    print("Daftar Minuman  :");
    daftarMinuman.forEach((nama, harga) {
      print("- $nama (${harga ~/ 1000}rb)");
    });
  }
}
