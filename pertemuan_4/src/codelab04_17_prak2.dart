void main() {
  // praktikum 1
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);
  //praktikum 2
  // var names1 = <String>{};
  // Set<String> names2 = {}; // This works, too.
  // var names3 = {}; // Creates a map, not a set.

  // print(names1);
  // print(names2);
  // print(names3);

  var names1 = <String>{};
  Set<String> names2 = {};
  var names3 = {}; // Dibuat sebagai Map, bukan Set.

  // set names1 menggunakan .add()
  names1.add("Kibar Mustofa"); 
  names1.add("2341720034"); 

  // Set names2 menggunakan .addAll()
  names2.addAll(["Kibar Mustofa ", "2341720034"]); 

  // Mencetak hasil akhir
  print('names1 (Set): $names1');
  print('names2 (Set): $names2');
  print('names3 (Map): $names3');

}
  


