//langkah 3
(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}
void main(){

  //langkah 1 
  //   var record = ('first', a: 2, b: true, 'last'); 
  // print(record);

  //langkah 3 lanjutan
  var recordAwal = (10, 25);
  print('Record sebelum ditukar: $recordAwal');

  var recordSetelahDitukar = tukar(recordAwal);
  print('Record setelah ditukar: $recordSetelahDitukar');

  //langkah 4
  // Record type annotation in a variable declaration:
  (String, int) mahasiswa;
  mahasiswa = ('Kibar Mustofa ', 2341720034);
  print(mahasiswa);
  //langkah 5
  var mahasiswa2 = ('Kibar Mustofa', a: 2341720034, b: true, 'last');
  print("="*20+"langkah 5");
  print(mahasiswa2.$1); // Prints 'first'
  print(mahasiswa2.a); // Prints 2
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$2); // Prints 'last'
}

