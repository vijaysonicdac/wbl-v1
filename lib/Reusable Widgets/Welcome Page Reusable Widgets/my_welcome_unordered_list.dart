import 'package:flutter/material.dart';

class MyWelcomeUnorderedList extends StatelessWidget {
  const MyWelcomeUnorderedList({super.key, required this.listText});
  final String listText;

  @override
  Widget build(BuildContext context) {
    const Color iconColor = Colors.green;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 0.0), // Minimized padding
      leading: const Icon(Icons.arrow_right, color: iconColor),
      title: Text(
        listText,
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xff5A5A72),
        ),
      ),
      dense: true, // Reduces the height of the ListTile
    );
  }
}
