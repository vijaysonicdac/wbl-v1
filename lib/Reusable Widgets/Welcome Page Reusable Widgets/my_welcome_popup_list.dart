import 'package:flutter/material.dart';

class MyWelcomePopupList extends StatelessWidget {
  final String title;
  final List<String> technologies;

  const MyWelcomePopupList({
    super.key,
    required this.title,
    required this.technologies,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(16.0),
      width: screenWidth * 0.8, // Set width as a percentage of screen width
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height *
            0.8, // Set maximum height as a percentage of screen height
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the modal
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _calculateCrossAxisCount(
                    screenWidth), // Dynamically adjust number of columns
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: _calculateChildAspectRatio(
                    screenWidth), // Adjust aspect ratio
              ),
              itemCount: technologies.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            technologies[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  int _calculateCrossAxisCount(double screenWidth) {
    if (screenWidth < 800) {
      return 1;
    } else {
      return 2;
    }
  }

  double _calculateChildAspectRatio(double screenWidth) {
    // Adjust aspect ratio based on screen width
    final crossAxisCount = _calculateCrossAxisCount(screenWidth);
    final tileWidth = screenWidth *
        0.8 /
        crossAxisCount; // 80% of screen width divided by number of tiles
    const tileHeight = 90; // Default height
    return tileWidth / tileHeight;
  }
}
