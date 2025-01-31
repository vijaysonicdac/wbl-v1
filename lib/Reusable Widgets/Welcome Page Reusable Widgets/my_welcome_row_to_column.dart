import 'package:flutter/material.dart';

class MyWelcomeRowToColumn extends StatelessWidget {
  final List<Widget> children;

  const MyWelcomeRowToColumn({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    // Check the screen width
    if (MediaQuery.of(context).size.width <= 600) {
      return Wrap(children: children);
    } else {
      return Row(children: children);
    }
  }
}
