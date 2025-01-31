import 'package:flutter/material.dart';

class MyRowToColumn extends StatelessWidget {
  final List<Widget> children;

  const MyRowToColumn({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWideScreen = constraints.maxWidth > 600;
        return isWideScreen
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children.map((child) {
                  return Expanded(child: child);
                }).toList())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children.map((child) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: child,
                  );
                }).toList(),
              );
      },
    );
  }
}
