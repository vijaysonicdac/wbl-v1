import 'package:flutter/material.dart';

class MyWelcomeFooter extends StatelessWidget {
  const MyWelcomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      height: 60,
      color: Color(0xff214492),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/images/cdacLogo.png"),
            width: 50,
            height: 50,
          ),
          Flexible(
            child: Text(
              "Designed, Deployed and Maintained by Centre for Development of Advanced Computing (C-DAC), Mohali | © 2023 WorkBasedLearning. All rights reserved | Privacy Policy",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
