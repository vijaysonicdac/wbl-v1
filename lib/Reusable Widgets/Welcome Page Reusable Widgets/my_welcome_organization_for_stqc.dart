import 'package:flutter/material.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_footer.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_header.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_unordered_list.dart';
// ignore: avoid_web_libraries_in_flutter
//import 'dart:js' as js;

class MyFunUrlLauncher {
  static void navigateToPage(String url) {
    // Use JavaScript interop to open the URL
    //   js.context.callMethod('open', [url]);
  }
}

class MyWelcomeOrganizationForStqc extends StatelessWidget {
  final String organizationName;
  final String organizationNameShortForm;
  final String description;
  final String logoPath;
  final List<String> aboutPoints;
  final Map<String, List<String>> keyProjectSections;
  final List<String> branches;
  final String nodalOfficerName;
  final String nodalOfficerPosition;
  final String nodalOfficerEmail;
  final String organizationImagePath;
  final String organizationUrl;

  const MyWelcomeOrganizationForStqc({
    super.key,
    required this.organizationName,
    required this.organizationNameShortForm,
    required this.description,
    required this.logoPath,
    required this.aboutPoints,
    required this.keyProjectSections, // Use Map for categorized sections
    required this.branches,
    required this.nodalOfficerName,
    required this.nodalOfficerPosition,
    required this.nodalOfficerEmail,
    required this.organizationImagePath,
    required this.organizationUrl,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Header and main organization image
          const MyWelcomeHeader(),
          Stack(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/aboutbgimg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(logoPath),
                    Text(
                      organizationName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Main content container
          Container(
            padding: EdgeInsets.all(screenWidth * .03),
            margin: EdgeInsets.symmetric(
                horizontal: screenWidth * .1, vertical: screenWidth * .03),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 207, 204, 204),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'About',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(color: Color(0xff5A5A72)),
                ),
                ...aboutPoints
                    .map((point) => MyWelcomeUnorderedList(listText: point)),

                const SizedBox(height: 20),

                // Key Services Section
                const Text(
                  'Key Services',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                for (var section in keyProjectSections.entries) ...[
                  const SizedBox(height: 10),
                  Text(
                    section.key,
                    style: const TextStyle(fontSize: 16),
                  ),
                  ...section.value.map(
                      (project) => MyWelcomeUnorderedList(listText: project)),
                ],

                const SizedBox(height: 20),

                Text(
                  '$organizationNameShortForm Branches',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                ...branches
                    .map((branch) => MyWelcomeUnorderedList(listText: branch)),

                const SizedBox(height: 20),

                const Text(
                  'WBL Nodal Officer',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
                Text(nodalOfficerName,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(nodalOfficerPosition,
                    style: const TextStyle(color: Color(0xff5A5A72))),
                Row(
                  children: [
                    const Icon(Icons.email, color: Color(0xff049304)),
                    Text(nodalOfficerEmail),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.asset(organizationImagePath,
                              fit: BoxFit.contain)),
                      const SizedBox(height: 5),
                      TextButton(
                        onPressed: () {
                          MyFunUrlLauncher.navigateToPage(organizationUrl);
                        },
                        child: Text(
                          "Tweets by $organizationNameShortForm",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff43BDF0),
                            decoration: TextDecoration.underline,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const MyWelcomeFooter(),
        ],
      ),
    );
  }
}
