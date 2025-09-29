import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const LoadingCupertino());
}

class LoadingCupertino extends StatelessWidget {
  const LoadingCupertino({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        margin: const EdgeInsets.only(top: 30),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoButton(
              child: const Text("Contoh button"),
              onPressed: () {
                debugPrint("Tombol ditekan!");
              },
            ),
            const SizedBox(height: 20),
            const CupertinoActivityIndicator(), // Loading spinner gaya iOS
          ],
        ),
      ),
    );
  }
}
