import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final VoidCallback onTap;

  const ItemCard({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: item.id,
              child: Image.asset(item.foto, height: 200),
            ),
            const SizedBox(height: 20),
            Text(item.nama,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text("Rp${item.harga}",
                style: const TextStyle(color: Colors.green)),
            Text("⭐ ${item.rating}"),
            Text("Stok: ${item.stok}"),
          ],
        ),
      ),
    );
  }
}
