import 'package:flutter/material.dart';
// Reusable widget for the "Candidate Speaks" card

class MyWelcomeCandidateSpeakCard extends StatelessWidget {
  final String imagePath;
  final List<String> description;
  final List<int> boldTextIndices;
  final String name;
  final String role;

  const MyWelcomeCandidateSpeakCard({
    super.key,
    required this.imagePath,
    required this.description,
    required this.boldTextIndices,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 600;

        return Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: isSmallScreen
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Circular Avatar at the top
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xff214492),
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 56,
                                backgroundImage: AssetImage(imagePath),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Wrap content in SingleChildScrollView to avoid overflow
                      Flexible(
                        child: SingleChildScrollView(
                          child: _buildDescription(),
                        ),
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Circular Avatar on the left
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xff214492),
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 56,
                                backgroundImage: AssetImage(imagePath),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 50),
                      // Wrap content in SingleChildScrollView for responsive resizing
                      Expanded(
                        child: SingleChildScrollView(
                          child: _buildDescription(),
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }

  // Helper method to build the description section
  Widget _buildDescription() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..scale(-1.0, 1.0),
            child: const Icon(
              Icons.format_quote,
              color: Color(0xff049304),
              size: 25,
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Allow text to wrap inside RichText with flexible height
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xff5A5A72),
            ),
            children: description.map((text) {
              return TextSpan(
                text: text,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 8),
        const Align(
          alignment: Alignment.bottomRight,
          child: Icon(
            Icons.format_quote,
            color: Color(0xff049304),
            size: 25,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .end, // Align text to the right within the column
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(
                role,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xff5A5A72),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
