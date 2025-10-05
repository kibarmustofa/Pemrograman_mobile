import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /* soal 1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* soal 2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'wisata kuliner di Malang',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Malang, klayatan, sukun, Indonesia',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          /* soal 3*/
          Icon(
          Icons.stars,
            color: Colors.red,
          ),
          const Text('41'),
        ],
      ),
    );
    Column buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }
    Color color = Theme.of(context).primaryColor;

    Widget butttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildButtonColumn(color, Icons.call, 'CALL'),
        buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Kedai Mie Kung Boy adalah tempat makan santai di kawasan Sukun, Malang,' 
        'yang mengusung konsep kafe dengan suasana ramah dan harga bersahabat. Terletak di Jl. Klayatan II No. 48a,' 
        'Bandungrejosari, kedai ini ideal untuk nongkrong bersama teman sambil menikmati secangkir kopi atau seporsi mie hangat. ' 
        'Menu andalannya adalah mie dengan berbagai topping kreatif, seperti Cwie Mie Ori, mie pangsit, dan tambahan ayam kering. '
        'Pelanggan juga bisa memilih lauk seperti ati ampela atau ayam geprek sebagai pelengkap.'
        'GoFood  Kedai ini sering dipuji karena “rasa makanannya lezat dan harga super murah”. Selain itu,'
        'tempatnya juga cocok untuk nongkrong karena tersedia fasilitas WiFi.'
        ' Kibar Mustofa / 2341720034',
        softWrap: true,
      ),
    );
    return MaterialApp(
      title: 'Flutter layout: Kibar Mustofa 2341720034',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: Column(
          children: [
            Image.asset('kungboy.png', 
            width: 600, 
            height: 240, fit:BoxFit.cover,),
            titleSection,
            butttonSection,
            textSection,

          ],
        ),
      ),
    );
  }
  
}