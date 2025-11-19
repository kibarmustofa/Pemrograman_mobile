import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'kibar mustofa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';

  late Completer<int> completer; // ✅ variabel baru

  Future getNumber() {
    completer = Completer<int>();
    calculate();
    return completer.future;
  }

  // Future calculate() async {
  //   await Future.delayed(const Duration(seconds: 5));
  //   completer.complete(42);
  // }

  Future calculate() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      completer.complete(42);
      // throw Exception(); // Jika ini di-uncomment, akan memicu catch
    } catch (_) {
      completer.completeError('Terjadi error'); 
    }
  }

  void returnFG() {
    FutureGroup<int> futureGroup = FutureGroup<int>();
    futureGroup.add(returnOneAsync());
    futureGroup.add(returnTwoAsync());
    futureGroup.add(returnThreeAsync());
    futureGroup.close();
    futureGroup.future.then((List<int> value) {
      int total = 0;
      for (var element in value) {
        total += element;
      }
      setState(() {
        result = total.toString();
      });
    });
  }
    void returnFW() async {
    final futures = Future.wait<int>([
      returnOneAsync(),
      returnTwoAsync(),
      returnThreeAsync(),
    ]);

    List<int> hasil = await futures;

    setState(() {
      result = hasil.toString();   // tampilkan data tanpa dijumlah
    });
  }
  Future returnError() async{
    await Future.delayed (const Duration(seconds:2 ));
    throw Exception("ada sesuatu masalah") ;
  } 

  Future handleError() async {
    try {
      await returnError();
    }
    catch (error) {
      setState(() {
        result = error.toString();
      });
    }
    finally {
      print('Complete');
    }
  }

  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  Future count() async {
    int total = 0;
    total = await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();
    setState(() {
      result = total.toString();
    });
  }

  Future<http.Response> getData() async { 
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/GErEDwAAQBAJ';
    Uri url = Uri.https(authority, path);
    return http.get(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back from the Future'),
        backgroundColor: Colors.blue, // warna header
        foregroundColor: Colors.white, // warna teks ikon
      ),
      body: Center(
        child: Column(children: [
          const Spacer(),
          ElevatedButton(
            child: const Text('GO!'),
            onPressed: () {
              // setState(() {});                                      
              // getData().then((value) {
              //   result = value.body.toString().substring(0, 450);  //dari praktikum 1
              //   setState(() {}); 
              // }).catchError((_) {
              //   result = 'An error occurred';
              //   setState(() {});
              // });

              //count();                                             //langkah praktikum 2

              // getNumber().then((value) {
              //   setState(() {
              //     result = value.toString();
              //   });
              //   }).catchError((e) {
              //   // Perhatikan: setState() tidak ada di sini
              //   result = 'An error occurred'; 
              // });

              // returnFG();// pratikum 4
               returnError()
                .then((value) {
                  setState(() {
                    result = 'Success';
                  });
                })
                .catchError((onError) {
                  setState(() {
                    result = onError.toString();
                  });
                })
                .whenComplete(() => print('Complete'));
            },
            
          ),
          const Spacer(),
          Text(result),
          const Spacer(),
          const CircularProgressIndicator(),
          const Spacer(),
        ]),
      ),
    );
  }
}