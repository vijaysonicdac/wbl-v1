import 'package:flutter/material.dart';

class LevelOnePage extends StatefulWidget {
  const LevelOnePage({super.key});
  @override
  State<LevelOnePage> createState() => _LevelOnePageState();
}

class _LevelOnePageState extends State<LevelOnePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: screenWidth,
                      height: 300,
                      child: const Image(
                        image: AssetImage('assets/images/certificate.png'),
                      ),
                    ),
                  ),
                  const Column(
                    children: [Text("No certificate available")],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
