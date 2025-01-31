import 'package:flutter/material.dart';

class MyWelcomeDivider extends StatelessWidget {
  const MyWelcomeDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * .09,
      ),
      child: const Divider(
        color: Colors.black,
        thickness: 0.2,
      ),
    );
  }
}
