void main(){
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1
  };

  
  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 2,
  };
  //langkah 3
  var mhs1 = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  var mhs2 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';
  
  //langkah 3-1
  // Menambahkan ke 'gifts' (Value bisa String atau int karena tipenya Object)
  gifts['nama'] = 'Kibar Mustofa';
  gifts['nim'] = 2341720034;

  // Menambahkan ke 'nobleGases' (Key harus int, Value bisa Object)
  nobleGases[100] = 'Kibar Mustofa';
  nobleGases[101] = '2341720034';

  // Menambahkan ke 'mhs1' (Key dan Value harus String)
  mhs1['nama'] = 'Kibar Mustofa';
  mhs1['nim'] = '2341720034';

  // Menambahkan ke 'mhs2' (Key harus int, Value harus String)
  mhs2[1] = 'Kibar Mustofa';
  mhs2[20] = '2341720034';

  print(gifts);
  print(nobleGases);
  print('MHS1: $mhs1');
  print('MHS2: $mhs2');

}