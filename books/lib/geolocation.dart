import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = '';
  Future<Position>? position;

  @override
  void initState() {
    super.initState();
    // Menginisialisasi future 'position' agar bisa dipakai di FutureBuilder
    position = getPosition();
  }

  @override
  Widget build(BuildContext context) {
    // --- KODE LAMA (DI-COMMENT) ---
    // final myWidget = myPosition == ''
    //     ? const CircularProgressIndicator()
    //     : Text(myPosition);

    // return Scaffold(
    //   appBar: AppBar(title: const Text('Current Location - Kibar')),
    //   body: Center(child: Text(myPosition)),
    // );
    // -------------------------------

    // --- KODE BARU SESUAI GAMBAR ---
    return Scaffold(
      appBar: AppBar(title: const Text('Current Location')),
      body: Center(
        child: FutureBuilder(
          future: position,
          builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              // Menampilkan data posisi jika selesai
              if (snapshot.hasError) {
                 return const Text('Something terrible happened!');
              }
              return Text(snapshot.data.toString());
            } else {
              return const Text('');
            }
          },
        ),
      ),
    );
  }

  Future<Position> getPosition() async {
    await Future.delayed(const Duration(seconds: 3)); // Simulasi delay 3 detik
    await Geolocator.requestPermission(); // Izin lokasi harus sudah diatur di AndroidManifest
    await Geolocator.isLocationServiceEnabled();
    Position? position = await Geolocator.getCurrentPosition();
    return position;
  }
}