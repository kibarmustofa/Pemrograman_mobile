import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Strawberry Pavlova',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Layout Demo'),
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: PavlovaLayout(),
          ),
        ),
      ),
    );
  }
}

class PavlovaLayout extends StatelessWidget {
  const PavlovaLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔹 Foto profil dengan Stack
        Center(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("profile.png"),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // 🔹 Barisan gambar (3 foto horizontal)
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                'pavlova1.png',
                fit: BoxFit.cover,
                height: 120,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Image.asset(
                'pavlova2.png',
                fit: BoxFit.cover,
                height: 120,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Image.asset(
                'pavlova3.png',
                fit: BoxFit.cover,
                height: 120,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // 🔹 JUDUL
        const Center(
          child: Text(
            'Strawberry Pavlova',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        const SizedBox(height: 8),

        // 🔹 DESKRIPSI
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Pavlova is a meringue-based dessert named after the Russian ballerina '
            'Anna Pavlova. Pavlova features a crisp crust and soft, light inside, '
            'topped with fruit and whipped cream.',
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 16),

        // 🔹 Rating
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: List.generate(
                4,
                (index) => const Icon(Icons.star, color: Colors.black),
              ),
            ),
            const Icon(Icons.star_border, color: Colors.black),
            const SizedBox(width: 8),
            const Text('170 Reviews'),
          ],
        ),
        const SizedBox(height: 24),

        // 🔹 Info (Prep, Cook, Feeds)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            InfoColumn(icon: Icons.kitchen, label: 'PREP:', value: '25 min'),
            InfoColumn(icon: Icons.timer, label: 'COOK:', value: '1 hr'),
            InfoColumn(icon: Icons.restaurant, label: 'FEEDS:', value: '4-6'),
          ],
        ),
        const SizedBox(height: 24),

        // 🔹 GridView makanan serupa
        const Text("Similar Foods", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            children: [
              Image.asset("food1.png", fit: BoxFit.cover),
              Image.asset("food2.png", fit: BoxFit.cover),
              Image.asset("food3.png", fit: BoxFit.cover),
              Image.asset("food4.png", fit: BoxFit.cover),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // 🔹 ListView makanan lain
        const Text("Other Foods", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 200,
          child: ListView(
            children: const [
              ListTile(
                leading: Icon(Icons.fastfood),
                title: Text("Cheesecake"),
                subtitle: Text("Creamy & soft"),
              ),
              ListTile(
                leading: Icon(Icons.cake),
                title: Text("Chocolate Cake"),
                subtitle: Text("Rich and moist"),
              ),
              ListTile(
                leading: Icon(Icons.local_pizza),
                title: Text("Pizza"),
                subtitle: Text("Cheesy delight"),
              ),
              ListTile(
                leading: Icon(Icons.ramen_dining),
                title: Text("Ramen"),
                subtitle: Text("Japanese noodles"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// 🔹 Widget helper untuk info kecil
class InfoColumn extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoColumn({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.green[500]),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        Text(value, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
