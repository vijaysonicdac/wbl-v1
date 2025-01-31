import 'package:flutter/material.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_candidate_speak_card_for_testimonials.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_footer.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_header.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_unordered_list.dart';

class Testimonials extends StatefulWidget {
  const Testimonials({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TestimonialsState createState() => _TestimonialsState();
}

class _TestimonialsState extends State<Testimonials> {
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> candidateData = [
    {
      'imagePath': 'assets/images/rupinderkaur.png',
      'description': [
        "Thanks to the Work-based Learning (WBL) program, I've had the opportunity to gain valuable experience and exposure to a real-world project at C-DAC Mohali. This has helped me understand where I stand in the fast-paced technology field and hone my skills in Cybersecurity. Experts in this institute are really helpful. I have been working in the Cyber security domain where I worked in different teams working on a large project through which I understood the domain on a good level. WBL is a truly amazing initiative by the government to upgrade students’ skills in cutting edge technologies.",
      ],
      'boldTextIndices': [0],
      'name': "Rupinder Kaur (Amritsar)",
      'role': "WBL-2023, C-DAC Mohali",
    },
    {
      'imagePath': 'assets/images/akritisabharwal.png',
      'description': [
        "I learned about this organization through the AICTE internship program and was fortunate enough to get Work Based Learning internship awarded. This experience is invaluable and has provided me with a great opportunity to work in a supportive and dynamic environment. The mentors here are incredibly helpful and have guided me in enhancing my skills in multiple fields. I'm confident that the skills I've gained here will have a positive impact on my future endeavors.",
      ],
      'boldTextIndices': [0],
      'name': "Akriti Sabharwal (Mohali)",
      'role': "WBL-2023, C-DAC Mohali",
    },
    {
      'imagePath': 'assets/images/samuel.jpg',
      'description': [
        "Finding the Government of India’s Work-Based Learning Program (WBLP) through the AICTE Internship Portal was a transformative moment for me. The program offers a wide array of sectors that caught my eye, inspiring me to secure an internship within WBLP. I am now working in the Software technology domain at C-DAC Mohali, where I'm immersed in a pioneering Agri-Innovation project. The guidance from a knowledgeable mentor, along with access to extensive resources, creates a dynamic and supportive learning environment among experienced professionals. This role not only enables me to enhance my technical skills but also provides a valuable platform to explore areas of personal interest, paving the way for substantial professional development.",
      ],
      'boldTextIndices': [0],
      'name': "Samuel (Mohali, Punjab)",
      'role': "WBL-2023, C-DAC Mohali",
    },
    {
      'imagePath': 'assets/images/maheshkumar.jpeg',
      'description': [
        "Discovering the Government of India’s Work-Based Learning Program (WBLP) through the AICTE Internship Portal was a game-changer for me. The program's diverse range of domains immediately captured my interest, prompting me to pursue an internship within WBLP. Currently engaged in the Software technology domain at C-DAC Mohali, I'm deeply involved in an Agri-Innovation project. The supportive and knowledgeable supervisor, coupled with abundant resources, fosters an enriching learning environment among seasoned professionals. This opportunity not only allows me to upskill myself but also offers a platform to delve into domains of personal interest, making it an ideal avenue for professional growth.",
      ],
      'boldTextIndices': [0],
      'name': "Mahesh Kumar (Mohali, Punjab)",
      'role': "WBL-2023, C-DAC Mohali",
    },
    {
      'imagePath': 'assets/images/gopikaps.jpg',
      'description': [
        "My time as an IT testing intern at ERTL(S),Thiruvananthapuram has been truly invaluable. Working on testing government websites has not only refined my technical abilities but has also deepened my appreciation for the critical role of quality assurance in the digital landscape. The mentorship and support provided by the seasoned professionals at ERTL(S),Thiruvananthapuram have been instrumental in my professional and personal growth. I am genuinely thankful for the chance to contribute to meaningful projects and eagerly anticipate employing the skills and insights gained here in my future pursuits. Moreover, being part of this role through the work-based learning program has significantly enriched my educational journey, offering a seamless transition from theory to practical application",
      ],
      'boldTextIndices': [0],
      'name': "Gopika P.S. (Thiruvananthapuram)",
      'role': "WBL-2023, STQC Thiruvananthapuram",
    },
    {
      'imagePath': 'assets/images/siddhiraj.jpg',
      'description': [
        "I learned about this organization through the AICTE Internship program and was fortunate enough to get a Work Based Learning internship awarded. This experience is invaluable and has provided me with a great opportunity to work in a supportive and dynamic environment. The mentors here are Incredibly helpful and have guided me in enhancing my skills in multiple fields. I'm confident that the skills I've gained here will have a positive impact on my future endeavors. WBL is a truly amazing initiative by the government to upgrade students’ skills in cutting edge technologies.",
      ],
      'boldTextIndices': [0],
      'name': "Siddhi Raj (Jaipur)",
      'role': "WBL-2023, STQC Jaipur",
    },
    {
      'imagePath': 'assets/images/ankitatanwar.jpg',
      'description': [
        "Working as an IT testing intern at ETDC Jaipur has been an invaluable experience. Testing government websites has not only honed my technical skills but also provided me with a deep understanding of the importance of quality assurance in the digital realm. The guidance and support from the experienced team at ETDC Jaipur have helped me grow professionally and personally. I am grateful for the opportunity to contribute to such impactful projects and look forward to applying the knowledge and expertise gained here in my future endeavors. Additionally, participating in this role under the work-based learning program has further enhanced my learning experience, allowing me to bridge the gap between academic knowledge and real-world application.",
      ],
      'boldTextIndices': [0],
      'name': "Ankita Tanwar (Sirsa)",
      'role': "WBL-2023, STQC Jaipur",
    },
    {
      'imagePath': 'assets/images/shivanitiwari.jpg',
      'description': [
        "I have been selected for the role of Cybersecurity Intern in the Work Based Learning Program (WBLP). This is my domain, and I love working in it. My skills have developed in cybersecurity, network security, cloud security, cryptography, risk management, and incident response. My project mentor and other senior faculty have always supported me. I would like to express my sincere gratitude to all the seniors of that organization. My project is on ransomware resistant cloud backups, in which I have used services from AWS, Azure, and Google Cloud. It was my good fortune to be selected.",
      ],
      'boldTextIndices': [0],
      'name': "Shivani Tiwari (Lucknow)",
      'role': "WBL-2023, CERT-IN Delhi",
    },
    {
      'imagePath': 'assets/images/adilakhan.jpg',
      'description': [
        "During my Work Based learning (WBL) internship in the field of cybersecurity from CERT-IN I have had the invaluable opportunity to immerse myself in real-world challenges and solutions. Through hands-on experience, I've developed a deep understanding of cybersecurity concepts, and strengthened my problem-solving skills. I've thrived in an environment with the help of the Experts in the organization that constantly pushed me to adapt and grow, and I'm confident that the skills and insights gained during this experience will serve as a solid foundation for my future career in cybersecurity.",
      ],
      'boldTextIndices': [0],
      'name': "Adila Khan (Hyderabad)",
      'role': "WBL-2023, CERT-IN Delhi",
    },
    {
      'imagePath': 'assets/images/chiragubnare.png',
      'description': [
        "I learnt about Govt. of India’s Work Based Learning Program (WBLP) through AICTE Internship Portal and the diversity of domains it covers excited me to apply for an internship in WBLP. I have been working in the Artificial Intelligence domain at C-DAC Mohali wherein I am working on an Agri-Innovation project. The supervisor is friendly and helpful there are plenty of resources and the place provides a great learning environment under experienced professionals. This is a perfect opportunity to upskill self and experience the domain of your choice.",
      ],
      'boldTextIndices': [0],
      'name': "Chirag Ubnare (Gwalior)",
      'role': "WBL-2023, C-DAC Mohali",
    },
    {
      'imagePath': 'assets/images/shivanitiwari.jpg',
      'description': [
        "I have been selected for the role of Cybersecurity Intern in the Work Based Learning Program (WBLP). This is my domain, and I love working in it. My skills have developed in cybersecurity, network security, cloud security, cryptography, risk management, and incident response. My project mentor and other senior faculty have always supported me. I would like to express my sincere gratitude to all the seniors of that organization. My project is on ransomware resistant cloud backups, in which I have used services from AWS, Azure, and Google Cloud. It was my good fortune to be selected.",
      ],
      'boldTextIndices': [0],
      'name': "Shivani Tiwari (Lucknow)",
      'role': "WBL-2023, CERT-IN Delhi",
    },
    {
      'imagePath': 'assets/images/adilakhan.jpg',
      'description': [
        "During my Work Based learning (WBL) internship in the field of cybersecurity from CERT-IN I have had the invaluable opportunity to immerse myself in real-world challenges and solutions. Through hands-on experience, I've developed a deep understanding of cybersecurity concepts, and strengthened my problem-solving skills. I've thrived in an environment with the help of the Experts in the organization that constantly pushed me to adapt and grow, and I'm confident that the skills and insights gained during this experience will serve as a solid foundation for my future career in cybersecurity.",
      ],
      'boldTextIndices': [0],
      'name': "Adila Khan (Hyderabad)",
      'role': "WBL-2023, CERT-IN Delhi",
    },
    {
      'imagePath': 'assets/images/chiragubnare.png',
      'description': [
        "I learnt about Govt. of India’s Work Based Learning Program (WBLP) through AICTE Internship Portal and the diversity of domains it covers excited me to apply for an internship in WBLP. I have been working in the Artificial Intelligence domain at C-DAC Mohali wherein I am working on an Agri-Innovation project. The supervisor is friendly and helpful there are plenty of resources and the place provides a great learning environment under experienced professionals. This is a perfect opportunity to upskill self and experience the domain of your choice.",
      ],
      'boldTextIndices': [0],
      'name': "Chirag Ubnare (Gwalior)",
      'role': "WBL-2023, C-DAC Mohali",
    }
  ];
  final Map<String, List<String>> stateInstitutions = {
    'Punjab': [
      'Thapar Institute of Engineering and Technology, Patiala (17)',
      'Guru Nanak Dev Engineering College, Ludhiana (3)'
    ],
    'Haryana': [
      'JC Bose University of Science and Technology YMCA, Faridabad (3)',
      'Guru Jambeshwar University of Science & Technology, Hisar (2)'
    ],
    'Himachal': [
      'Atal Bihari Vajpayee Government Institute Of Engineering And Technology, Shimla (3)',
      'Government PG College, Hamirpur (2)'
    ],
  };

  // Pagination variables
  int currentPage = 0;
  final int itemsPerPage = 8;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate the range of candidates to display
    final startIndex = currentPage * itemsPerPage;
    final endIndex = (startIndex + itemsPerPage < candidateData.length)
        ? startIndex + itemsPerPage
        : candidateData.length;

    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            const MyWelcomeHeader(),
            Container(
              color: const Color(0xffF0F9FA),
              child: Column(
                children: [
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
                            const Text(
                              'Testimonials',
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
                  Padding(
                    padding: EdgeInsets.all(screenWidth * .05),
                    child: (screenWidth > 750)
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.all(screenWidth * .03),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                            255, 207, 204, 204),
                                        spreadRadius: 1,
                                        blurRadius: 4,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: endIndex - startIndex,
                                        itemBuilder: (context, index) {
                                          final candidate =
                                              candidateData[startIndex + index];
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child:
                                                MyWelcomeCandidatespeakcardForTestimonials(
                                              imagePath: candidate['imagePath'],
                                              description:
                                                  candidate['description'],
                                              boldTextIndices:
                                                  candidate['boldTextIndices'],
                                              name: candidate['name'],
                                              role: candidate['role'],
                                            ),
                                          );
                                        },
                                      ),
                                      // Pagination Controls
                                      if (candidateData.length > itemsPerPage)
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            // Previous button
                                            TextButton(
                                              onPressed: currentPage > 0
                                                  ? () {
                                                      setState(() {
                                                        currentPage--;
                                                      });
                                                      _scrollController
                                                          .animateTo(
                                                        0, // Scroll to the top
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        curve: Curves.easeInOut,
                                                      );
                                                    }
                                                  : null,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.arrow_left,
                                                    color: currentPage > 0
                                                        ? Colors.blue
                                                        : Colors.grey,
                                                  ),
                                                  Text('Previous',
                                                      style: TextStyle(
                                                        color: currentPage > 0
                                                            ? Colors.blue
                                                            : Colors.grey,
                                                      )),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                                width:
                                                    16), // Space between buttons
                                            // Next button
                                            TextButton(
                                              onPressed: (currentPage + 1) *
                                                          itemsPerPage <
                                                      candidateData.length
                                                  ? () {
                                                      setState(() {
                                                        currentPage++;
                                                      });
                                                      _scrollController
                                                          .animateTo(
                                                        0, // Scroll to the top
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        curve: Curves.easeInOut,
                                                      );
                                                    }
                                                  : null,
                                              child: Row(
                                                children: [
                                                  Text('Next',
                                                      style: TextStyle(
                                                        color: (currentPage +
                                                                        1) *
                                                                    itemsPerPage <
                                                                candidateData
                                                                    .length
                                                            ? Colors.blue
                                                            : Colors.grey,
                                                      )),
                                                  Icon(
                                                    Icons.arrow_right,
                                                    color: (currentPage + 1) *
                                                                itemsPerPage <
                                                            candidateData.length
                                                        ? Colors.blue
                                                        : Colors.grey,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: screenWidth * .01),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.all(screenWidth * .01),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                            255, 207, 204, 204),
                                        spreadRadius: 1,
                                        blurRadius: 4,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Candidates from following institutions have already enrolled for WBL Programme:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      // ExpansionTile for each state
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: stateInstitutions.length,
                                        itemBuilder: (context, index) {
                                          String state = stateInstitutions.keys
                                              .elementAt(index);
                                          List<String> institutions =
                                              stateInstitutions[state]!;
                                          return ExpansionTile(
                                            title: Text(
                                              state,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            initiallyExpanded: index == 0,
                                            children: institutions
                                                .map((institution) =>
                                                    MyWelcomeUnorderedList(
                                                      listText: institution,
                                                    ))
                                                .toList(),
                                          );
                                        },
                                      ),
                                      const Center(
                                          child: Text(
                                        'Total:129',
                                        style: TextStyle(
                                          color: Color(0xff5A5A72),
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(screenWidth * .03),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                          255, 207, 204, 204),
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: endIndex - startIndex,
                                      itemBuilder: (context, index) {
                                        final candidate =
                                            candidateData[startIndex + index];
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child:
                                              MyWelcomeCandidatespeakcardForTestimonials(
                                            imagePath: candidate['imagePath'],
                                            description:
                                                candidate['description'],
                                            boldTextIndices:
                                                candidate['boldTextIndices'],
                                            name: candidate['name'],
                                            role: candidate['role'],
                                          ),
                                        );
                                      },
                                    ),
                                    // Pagination Controls
                                    if (candidateData.length > itemsPerPage)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          // Previous button
                                          TextButton(
                                            onPressed: currentPage > 0
                                                ? () {
                                                    setState(() {
                                                      currentPage--;
                                                    });
                                                    _scrollController.animateTo(
                                                      0, // Scroll to the top
                                                      duration: const Duration(
                                                          milliseconds: 100),
                                                      curve: Curves.easeInOut,
                                                    );
                                                  }
                                                : null,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.arrow_left,
                                                  color: currentPage > 0
                                                      ? Colors.blue
                                                      : Colors.grey,
                                                ),
                                                Text('Previous',
                                                    style: TextStyle(
                                                      color: currentPage > 0
                                                          ? Colors.blue
                                                          : Colors.grey,
                                                    )),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                              width:
                                                  16), // Space between buttons
                                          // Next button
                                          TextButton(
                                            onPressed: (currentPage + 1) *
                                                        itemsPerPage <
                                                    candidateData.length
                                                ? () {
                                                    setState(() {
                                                      currentPage++;
                                                    });
                                                    _scrollController.animateTo(
                                                      0, // Scroll to the top
                                                      duration: const Duration(
                                                          milliseconds: 100),
                                                      curve: Curves.easeInOut,
                                                    );
                                                  }
                                                : null,
                                            child: Row(
                                              children: [
                                                Text('Next',
                                                    style: TextStyle(
                                                      color: (currentPage + 1) *
                                                                  itemsPerPage <
                                                              candidateData
                                                                  .length
                                                          ? Colors.blue
                                                          : Colors.grey,
                                                    )),
                                                Icon(
                                                  Icons.arrow_right,
                                                  color: (currentPage + 1) *
                                                              itemsPerPage <
                                                          candidateData.length
                                                      ? Colors.blue
                                                      : Colors.grey,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * .01,
                                height: screenWidth * .01,
                              ),
                              Container(
                                padding: EdgeInsets.all(screenWidth * .01),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                          255, 207, 204, 204),
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
                                      'Candidates from following institutions have already enrolled for WBL Programme:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    // ExpansionTile for each state
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: stateInstitutions.length,
                                      itemBuilder: (context, index) {
                                        String state = stateInstitutions.keys
                                            .elementAt(index);
                                        List<String> institutions =
                                            stateInstitutions[state]!;
                                        return ExpansionTile(
                                          title: Text(
                                            state,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          initiallyExpanded: index == 0,
                                          children: institutions
                                              .map((institution) =>
                                                  MyWelcomeUnorderedList(
                                                    listText: institution,
                                                  ))
                                              .toList(),
                                        );
                                      },
                                    ),
                                    const Center(
                                        child: Text(
                                      'Total:129',
                                      style: TextStyle(
                                        color: Color(0xff5A5A72),
                                      ),
                                    )),
                                  ],
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
      ),
    );
  }
}
