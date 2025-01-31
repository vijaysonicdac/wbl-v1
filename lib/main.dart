import 'package:flutter/material.dart';
import 'package:wbl/Pages/Welcome%20Page/welcome_page.dart';
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
        primarySwatch: Colors.blue,
      ),
      // home: WelcomePage(),
      home: TestPage(),
    );
  }
}
