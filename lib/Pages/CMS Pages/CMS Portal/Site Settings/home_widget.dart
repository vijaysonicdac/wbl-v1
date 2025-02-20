import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});
  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  // Statistics Data
  final Map<String, String> statisticsData = {
    'applicationsReceived': '44320+\nApplications Received',
    'enrolled': '2000+\nEnrolled',
    'liveProjects': '200+\nLive Projects',
    'hostCenters': '81\nHost Centers',
    'cities': '52\nCities',
  };

  Widget buildResponsiveRow(List<Widget> children) {
    return MediaQuery.of(context).size.width <= 1800
        ? Wrap(
            spacing: 10,
            runSpacing: 10,
            children: children,
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children,
          );
  }

  Widget buildTextBox(String title, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
      ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 300
        ),
       
          child: TextField(
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildStatCard(String imagePath, String text) {
    return Column(
      children: [
        Image.asset(imagePath, width: 60, height: 60),
        const SizedBox(height: 8),
        Text(text, textAlign: TextAlign.center),
      ],
    );
  }

  Widget buildFileUploadColumn(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        FileUploadWidget(label: label),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Candidates Section
              buildResponsiveRow(
                [
                  const SizedBox(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/images/image1.png'),
                        ),
                        Positioned(
                          left: 20,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage('assets/images/image2.png'),
                          ),
                        ),
                        Positioned(
                          left: 40,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage('assets/images/image3.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    '2000+ candidates already enrolled',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  buildFileUploadColumn('Image 1'),
                  buildFileUploadColumn('Image 2'),
                  buildFileUploadColumn('Image 3'),
                  buildTextBox('Candidate Enrolled', ''),
                ],
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  '**Use the same type of small circle .png image',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
              const SizedBox(height: 16),
              // Statistics Section
                  Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * .01,
                  vertical: screenWidth * .02,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff214492),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * .01),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double width = constraints.maxWidth;
                        return Wrap(
                          alignment: WrapAlignment.spaceEvenly,
                          spacing: 100.0,
                          runSpacing: 16.0,
                          children: [
                            MyWelcomeBuildRowItem(
                              imagePath: 'assets/images/application.png',
                              text: statisticsData['applicationsReceived'] ?? '',
                            ),
                            MyWelcomeBuildRowItem(
                              imagePath: 'assets/images/enrolled.png',
                              text: statisticsData['enrolled'] ?? '',
                            ),
                            MyWelcomeBuildRowItem(
                              imagePath: 'assets/images/liveprojects.png',
                              text: statisticsData['liveProjects'] ?? '',
                            ),
                            if (width > 1000)
                              MyWelcomeBuildRowItem(
                                imagePath: 'assets/images/hostcentres.png',
                                text: statisticsData['hostCenters'] ?? '',
                              ),
                            if (width > 1300)
                              MyWelcomeBuildRowItem(
                                imagePath: 'assets/images/cities.png',
                                text: statisticsData['cities'] ?? '',
                              ),
                            if (width <= 1300)
                              MyWelcomeBuildRowItem(
                                imagePath: 'assets/images/hostcentres.png',
                                text: statisticsData['hostCenters'] ?? '',
                              ),
                            if (width <= 1000)
                              MyWelcomeBuildRowItem(
                                imagePath: 'assets/images/cities.png',
                                text: statisticsData['cities'] ?? '',
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Input Fields
              Wrap(
                spacing: 30,
                runSpacing: 10,
                children: [
                  buildTextBox('Stipend Released', ''),
                  buildTextBox('Applications Received', ''),
                  buildTextBox('Live Projects', ''),
                ],
              ),
              const SizedBox(height: 10),
              // Update Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff049304),
                  ),
                  onPressed: () {
                    // Add your update logic here
                  },
                  child: const Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
    return Column(
      children: [
        Image.asset(imagePath, width: 60, height: 60),
        const SizedBox(height: 8),
        Text(text, textAlign: TextAlign.center),
      ],
    );
  }
}

class FileUploadWidget extends StatefulWidget {
  final String label;
  const FileUploadWidget({super.key, required this.label});

  @override
  State<FileUploadWidget> createState() => _FileUploadWidgetState();
}

class _FileUploadWidgetState extends State<FileUploadWidget> {
  String fileName = "No file chosen";
  final int maxFileSize = 500 * 1024;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'bmp', 'pdf'],
    );
    if (result != null) {
      int fileSize = result.files.single.size;
      if (fileSize <= maxFileSize) {
        setState(() {
          fileName = result.files.single.name;
        });
      } else {
        setState(() {
          fileName = "File too large. Must be under 500KB.";
        });
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('File size must be under 500KB')),
        );
      }
    } else {
      setState(() {
        fileName = "No file chosen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 300,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: pickFile,
                    child: const Text(
                      "Choose File",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      fileName,
                      style: TextStyle(color: Colors.grey[600]),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
