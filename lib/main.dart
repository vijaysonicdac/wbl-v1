import 'package:flutter/material.dart';
import 'package:wbl/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WBLP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: Colors.indigo[900],
      ),
      // home: AdminLoginPage(),
      home: TestPage(),
    );
  }
}
