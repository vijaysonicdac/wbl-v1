import 'package:flutter/material.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_footer.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_header.dart';

class Faqs extends StatelessWidget {
  Faqs({super.key});

  final Map<String, String> faqsData = {
    "What is Work Based Learning (WBL) Programme?":
        "The Work Based Learning (WBL) Programme is a unique initiative by Govt. of India that aims to provide employability skills to those eligible.",
    "Members from which categories are eligible to apply for WBL Programme?":
        "Those belonging to the Scheduled Castes (SC), Schedule Tribes (ST), Economically Weaker Sections (EWS) and Women are eligible for this programme.",
    "What are the educational qualifications required to apply for WBL Programme (WBLP)?":
        "Candidates who have passed B.Tech. M.Sc. and MCA within last 2 years can apply. Final year engineering students too can apply for the WBL Programme.",
    "WBL Programme is Private or Government's scheme?":
        "WBL Programme is Government of India initiative for the upliftment of Scheduled Castes (SCs), Scheduled Tribes (STs), Women and Economically Weaker Section (EWS) in the country.",
    "Is this programme offered in online mode?":
        "Work Based Learning (WBL) Programme is offered in person. The enrolled members are required to work with experts at the Centre of the period of 6 months.",
  };

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MyWelcomeHeader(),
            Container(
              color: const Color(0xffF0F9FA),
              child: Column(
                children: [
                  Stack(
                    children: [
                      // Background Image
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
                      // Centered content: Text and underline
                      Positioned.fill(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'FAQs',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Image.asset('assets/images/Vector1.png'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.all(screenWidth * .03),
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
                      margin: EdgeInsets.symmetric(
                        horizontal: screenWidth * .1,
                        vertical: screenWidth * .03,
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics:
                            const NeverScrollableScrollPhysics(), // Disable scroll inside ListView
                        itemCount: faqsData.length,
                        itemBuilder: (context, index) {
                          String question = faqsData.keys.elementAt(index);
                          String answer = faqsData[question]!;
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(255, 206, 202, 202),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ExpansionTile(
                              tilePadding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              collapsedBackgroundColor: Colors
                                  .transparent, // No background color on collapse
                              backgroundColor: Colors
                                  .transparent, // No background color on expand
                              title: Row(
                                children: [
                                  Text(
                                    "${index + 1}. ",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      question,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              initiallyExpanded:
                                  index == 0, // Open the first item by default
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 4),
                                  child: Align(
                                    alignment: Alignment
                                        .centerLeft, // Align text to the start (left)
                                    child: Text(
                                      answer,
                                      style: const TextStyle(
                                        color: Color(0xff5A5A72),
                                      ),
                                      textDirection: TextDirection.ltr,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      )),
                ],
              ),
            ),
            const MyWelcomeFooter(),
          ],
        ),
      ),
    );
  }
}
