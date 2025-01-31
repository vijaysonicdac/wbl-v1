import 'package:flutter/material.dart';

class LevelTwoPage extends StatefulWidget {
  const LevelTwoPage({super.key});

  @override
  State<LevelTwoPage> createState() => _LevelTwoPageState();
}

class _LevelTwoPageState extends State<LevelTwoPage> {
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
                    children: [Text('No certificate available')],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
