import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(title: Text(item.nama)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: item.id,
              child: Image.asset(
                item.foto,
                width: 350,
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(item.nama, style: const TextStyle(fontSize: 24)),
            Text("Rp ${item.harga}", style: const TextStyle(fontSize: 20)),
            Text("Stok: ${item.stok}", style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
