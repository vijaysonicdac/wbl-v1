import 'package:flutter/material.dart';

// Define the MyWelcomeBuildRowItem widget
class MyWelcomeBuildRowItem extends StatelessWidget {
  final String imagePath;
  final String text;

  const MyWelcomeBuildRowItem({
    super.key,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image(image: AssetImage(imagePath)),
        const SizedBox(width: 10), // Space between image and text
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
