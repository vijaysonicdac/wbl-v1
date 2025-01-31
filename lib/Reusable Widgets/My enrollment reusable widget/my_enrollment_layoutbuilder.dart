import 'package:flutter/material.dart';

class MyLayout extends StatelessWidget {
  final List<Widget> children;
  final double breakpoint;

  const MyLayout({
    super.key,
    required this.children,
    this.breakpoint = 600,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > breakpoint) {
          // Display children in a Row for wide screens
          return Row(
            children: children.map((child) {
              return Flexible(child: child); // Use Flexible instead of Expanded
            }).toList(),
          );
        } else {
          // Display children in a Column for small screens
          return Column(
            children: children,
          );
        }
      },
    );
  }
}
