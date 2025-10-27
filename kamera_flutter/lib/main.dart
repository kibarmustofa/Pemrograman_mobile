import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'takepicture_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Ambil semua kamera di device
  final cameras = await availableCameras();

  // Gunakan kamera pertama (biasanya belakang)
  final firstCamera = cameras.first;

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: TakePictureScreen(camera: firstCamera),
  ));
}
