class Item {
  final int id;
  final String nama;
  final int harga;
  final String foto;
  final int stok;
  final double rating;

  Item({
    required this.id,
    required this.nama,
    required this.harga,
    required this.foto,
    required this.stok,
    required this.rating,
  });
}

final List<Item> items = [
  Item(
    id: 1,
    nama: "Sepatu Sneakers",
    harga: 250000,
    foto: "sneakers.png",
    stok: 12,
    rating: 4.5,
  ),
  Item(
    id: 2,
    nama: "Tas Ransel",
    harga: 180000,
    foto: "tas.png",
    stok: 8,
    rating: 4.2,
  ),
  Item(
    id: 3,
    nama: "Jam Tangan langka",
    harga: 300000,
    foto: "jamtangan.png",
    stok: 5,
    rating: 4.7,
  ),
  Item(
    id: 4,
    nama: "KacamataNVG",
    harga: 8000000,
    foto: "kacamataNVG.png",
    stok: 15,
    rating: 4.1,
  ),
  Item(
    id: 5,
    nama: "Topi Baseball",
    harga: 75000,
    foto: "topi.png",
    stok: 20,
    rating: 4.3,
  ),
  Item(
    id: 6,
    nama: "Jaket Hoodie",
    harga: 200000,
    foto: "hodie.png",
    stok: 10,
    rating: 4.6,
  ),
];
