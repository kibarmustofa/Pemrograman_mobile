void main(){
  // var list = [1, 2, 3]; // langkah1 
  // var list2 = [0, ...list];
  
  // print(list);
  // print(list2);
  // print(list2.length);

  //langkah 3
  // var list1 = [1, 2, null];
  // print(list1);

  // var list3 = [0, ...?list1];
  // print('Panjang list3: ${list3.length}');
  // print('Isi list3: $list3');

  // // Menambahkan NIM menggunakan Spread Operator
  // var nim = [2, 0, 2, 3, 1, 0, 3, 7, 0];
  // var combinedList = [...list3, ...nim];

  // print('Combined List (list3 + nim): $combinedList');


  //langkah 4
  //Skenario 1: promoActive adalah true
  // var promoActive = true;
  // var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  // print('Navigasi saat promo aktif: $nav');

  // // Skenario 2: promoActive adalah false
  // promoActive = false;
  // nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  // print('Navigasi saat promo tidak aktif: $nav');


  //langkah 5
  
  // Skenario 1: login sebagai 'Manager'
  // var login = 'Manager';
  // var nav2 = ['Home', 'Furniture', 'Plants', if (login == 'Manager') 'Inventory'];
  // print('Navigasi untuk Manager: $nav2');

  // Skenario 2: login sebagai 'User'
  // login = 'User';
  // nav2 = ['Home', 'Furniture', 'Plants', if (login == 'Manager') 'Inventory'];
  // print('Navigasi untuk User: $nav2');

  //langkah 6
 
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);

}