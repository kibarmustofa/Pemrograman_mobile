// File: lib/main.dart

import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/item_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Halaman awal yang akan ditampilkan
      initialRoute: '/',
      // Daftar rute/halaman yang tersedia di aplikasi
      routes: {
        // PERBAIKAN 2: Menambahkan 'const' untuk optimasi performa.
        '/': (context) =>  HomePage(),
        '/item': (context) => const ItemPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}