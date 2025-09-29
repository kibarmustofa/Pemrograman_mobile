void main() {
  String nama = "Kibar Mustofa";
  String nim = "2341720034"; // ganti dengan NIM Anda

  for (int angka = 0; angka <= 201; angka++) {
    if (isPrima(angka)) {
      print("$nama ($nim)");
    }else {
      print("$angka");
    }
  }
}

// Fungsi untuk mengecek bilangan prima
bool isPrima(int n) {
  if (n < 2) return false;
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) return false;
  }
  return true;
}