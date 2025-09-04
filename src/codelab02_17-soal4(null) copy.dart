void main() {

  // Tanpa late → harus langsung isi
  // String nama = "Kibar";

  // Dengan late → bisa isi nanti
  late String hobi;
  hobi = "Coding";
  print(hobi); //  aman karena sudah diisi

  // late tanpa isi lalu dipakai → error runtime
  //late String pekerjaan;
  // print(pekerjaan); // Error: variabel belum diisi
}


  


