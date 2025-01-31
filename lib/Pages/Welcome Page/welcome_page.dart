import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wbl/Pages/Welcome%20Page/WBL%20Opportunities/wbl_opportunities_page.dart';
import 'package:wbl/Reusable%20Functions/reusable_function.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_candidate_speak_card.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_footer.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_header.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_popup_list.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_technologies_offered_card.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_divider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _MyState();
}

class _MyState extends State<WelcomePage> {
  // Map for your StatisticsData
  final Map<String, String> statisticsData = {
    'applicationsReceived': '44320+\nApplications Received',
    'enrolled': '1941+\nEnrolled',
    'liveProjects': '200+\nLive Projects',
    'hostCenters': '81\nHost Centers',
    'cities': '52\nCities',
  };
  // List that shows more technologies
  final List<String> moretechnologies = [
    ".NET Core",
    "3D Printing",
    "3D Printing & Addictive Manufacturing",
    "Accessibility Based Applications",
    "Accessibility or Usability or Human-Computer Interaction",
    "Addictive Manufacturing",
    "Addictive Manufacturing, Sensors",
    "AI & ML using Python",
    "Android & IOS Development",
    "Android Application Development",
    "Android Programming",
    "App Development",
    "Application Aware Firewall",
    "AR & VR",
    "Artificial Intelligence",
    "Artificial Intelligence (Al) and Machine Learning",
    "Augmented Reality (AR)",
    "Augmented Reality & Virtual Reality (AR/VR)",
    "Augmented Reality or Virtual Reality",
    "Basic electronics oriented Design",
    "Basics of Machine Learning",
    "Battery or Energy Storage Materials",
    "Big Data Analytics",
    "BigData",
    "Blockchain",
    "Blockchain (Ethereurn)",
    "Blockchain (Hyperledger)",
    "Blockchain Technology",
    "Brain Computing",
    "Business Development",
    "C++",
    "Campus Network",
    "Circulator",
    "CISCO Networking",
    "Cloud and Network Security",
    "Cloud Computing",
    "Consumer Electronics",
    "Content Writer",
    "CPU Design",
    "Cyber Forensics",
    "Cyber Security",
    "Cyber Security & Cyber Forensics",
    "Cyber Security and Cyber Forensics",
    "Cyber Security and Networking",
    "Data Analytics",
    "Data Analytics Using Python",
    "Data Analytics Using Python & R",
    "Data centre Management",
    "Data Science",
    "Data Science & Analytics",
    "Data Science with Python",
    "Database",
    "Database & Linux",
  ];
  // List that shows more Available Locations
  final List<String> availablelocations = [
    "Agartala",
    "Aizawl",
    "Ajmer",
    "Aurangabad",
    "Bengaluru",
  ];
  // Map for your candidates' data to display in card
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
    }
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MyWelcomeHeader(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.06,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Check if screen width is less than 750px (750 logical pixels in Flutter)
                  bool isSmallScreen = constraints.maxWidth < 750;

                  return isSmallScreen
                      ? Padding(
                          padding: EdgeInsets.all(screenWidth * .1),
                          child: Column(
                            children: [
                              // Text, Search box, etc. goes on top
                              SizedBox(
                                width: double.infinity, // Take up full width
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        text: 'Get ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize:
                                              28, // Smaller font size for mobile
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Paid to Learn! ',
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Find Your ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'WBL Programme ',
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Today',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    RichText(
                                      text: const TextSpan(
                                        text: 'Participating Organizations: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                            text:
                                                'C-DAC, CERT-IN, CMET, ERNET, NIELIT, SAMEER, STQC\n',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    RichText(
                                      text: const TextSpan(
                                        text: 'Funded by: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                            text:
                                                'Ministry Of Electronics & Information Technology, Government Of India\n',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              suffixIcon: ElevatedButton(
                                                onPressed: () {
                                                  // Search action
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          255, 50, 194, 57),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                ),
                                                child: const Text(
                                                  'Search',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              hintText:
                                                  'Technology or organization or city',
                                              prefixIcon:
                                                  const Icon(Icons.search),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                borderSide: BorderSide.none,
                                              ),
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    const Row(
                                      children: [
                                        Stack(
                                          children: [
                                            CircleAvatar(
                                              radius: 20,
                                              backgroundImage: AssetImage(
                                                  'assets/images/image1.png'),
                                            ),
                                            Positioned(
                                              left: 20,
                                              child: CircleAvatar(
                                                radius: 20,
                                                backgroundImage: AssetImage(
                                                    'assets/images/image2.png'),
                                              ),
                                            ),
                                            Positioned(
                                              left: 40,
                                              child: CircleAvatar(
                                                radius: 20,
                                                backgroundImage: AssetImage(
                                                    'assets/images/image3.png'),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          '1941+ candidates already enrolled',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // India Map goes below
                              const SizedBox(height: 20),
                              const SizedBox(
                                width: double.infinity, // Take up full width
                                child: Image(
                                  image:
                                      AssetImage('assets/images/indianmap.png'),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Row(
                          children: [
                            // Left Side: Text, Search box, etc.
                            SizedBox(
                              width: screenWidth * 0.44,
                              child: Padding(
                                padding: EdgeInsets.all(screenWidth * .04),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // RichText for Title
                                    RichText(
                                      text: const TextSpan(
                                        text: 'Get ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize:
                                              35, // Larger font size for wide screens
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Paid to Learn! ',
                                            style: TextStyle(
                                              color: Color(0xff049304),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Find Your ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'WBL Programme ',
                                            style: TextStyle(
                                              color: Color(0xff049304),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Today',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    // Organization & Funding Info
                                    RichText(
                                      text: const TextSpan(
                                        text: 'Participating Organizations: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                            text:
                                                'C-DAC, CERT-IN, CMET, ERNET, NIELIT, SAMEER, STQC\n',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    RichText(
                                      text: const TextSpan(
                                        text: 'Funded by: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                            text:
                                                'Ministry Of Electronics & Information Technology, Government Of India\n',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              suffixIcon: ElevatedButton(
                                                onPressed: () {
                                                  // Search action
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color(0xff049304),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                ),
                                                child: const Text(
                                                  'Search',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              hintText:
                                                  'Technology or organization or city',
                                              prefixIcon:
                                                  const Icon(Icons.search),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                borderSide: BorderSide.none,
                                              ),
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    const Row(
                                      children: [
                                        Stack(
                                          children: [
                                            CircleAvatar(
                                              radius: 20,
                                              backgroundImage: AssetImage(
                                                  'assets/images/image1.png'),
                                            ),
                                            Positioned(
                                              left: 20,
                                              child: CircleAvatar(
                                                radius: 20,
                                                backgroundImage: AssetImage(
                                                    'assets/images/image2.png'),
                                              ),
                                            ),
                                            Positioned(
                                              left: 40,
                                              child: CircleAvatar(
                                                radius: 20,
                                                backgroundImage: AssetImage(
                                                    'assets/images/image3.png'),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          '1941+ candidates already enrolled',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Right Side: India Map
                            SizedBox(
                              width: screenWidth * 0.44,
                              height: screenHeight,
                              child: const Image(
                                image:
                                    AssetImage('assets/images/indianmap.png'),
                              ),
                            ),
                          ],
                        );
                },
              ),
            ),
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
                  padding: EdgeInsets.all(
                    screenWidth * .01,
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double width = constraints.maxWidth;

                      return Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        spacing: 100.0, // Horizontal space between items
                        runSpacing: 16.0, // Vertical space between rows
                        children: [
                          // Applications Received
                          _buildRowItem('assets/images/application.png',
                              statisticsData['applicationsReceived'] ?? ''),

                          // Enrolled
                          _buildRowItem('assets/images/enrolled.png',
                              statisticsData['enrolled'] ?? ''),

                          // Live Projects
                          _buildRowItem('assets/images/liveprojects.png',
                              statisticsData['liveProjects'] ?? ''),

                          // Host Centers - conditionally rendered based on screen width
                          if (width > 1000)
                            _buildRowItem('assets/images/hostcentres.png',
                                statisticsData['hostCenters'] ?? ''),

                          // Cities - conditionally rendered based on screen width
                          if (width > 1300)
                            _buildRowItem('assets/images/cities.png',
                                statisticsData['cities'] ?? ''),

                          // These items will move down as the screen narrows
                          if (width <= 1300)
                            _buildRowItem('assets/images/hostcentres.png',
                                statisticsData['hostCenters'] ?? ''),
                          if (width <= 1000)
                            _buildRowItem('assets/images/cities.png',
                                statisticsData['cities'] ?? ''),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            const MyWelcomeDivider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * .05),
              child: Row(
                children: [
                  Expanded(child: Image.asset('assets/images/cdacLogo.png')),
                  Expanded(child: Image.asset('assets/images/Certin2.png')),
                  Expanded(child: Image.asset('assets/images/cmet-logo.png')),
                  Expanded(child: Image.asset('assets/images/ERNET2.png')),
                  Expanded(child: Image.asset('assets/images/NIELIT2.png')),
                  Expanded(child: Image.asset('assets/images/Sameer2.png')),
                  Expanded(child: Image.asset('assets/images/STQC1.png')),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * .01,
                  right: screenWidth * .01,
                  bottom: screenWidth * .03),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Beneficiaries",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Image.asset('assets/images/Vector1.png'),
                  // Reusable cards
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Wrap(
                      spacing: 16.0, // Space between cards horizontally
                      runSpacing: 16.0, // Space between cards vertically
                      alignment: WrapAlignment.center, // Center align the cards
                      children: [
                        BeneficiaryCard(
                          imagePath: 'assets/images/card1.png',
                          description: [
                            'Engineering Students of ',
                            '7th or 8th Semester',
                            ' & ',
                            'M.Sc/MCA last semester',
                            '(Relevant Disciplines)'
                          ],
                          boldTextIndices: [1, 3],
                        ),
                        BeneficiaryCard(
                          imagePath: 'assets/images/card2.png',
                          description: [
                            'Passed out ',
                            'B.Tech/B.E./MCA/MSc.',
                            '(Relevant Disciplines) in last 3 years'
                          ],
                          boldTextIndices: [1],
                        ),
                        BeneficiaryCard(
                          imagePath: 'assets/images/card3.png',
                          description: ['SC, ST, EWS and Women ', 'candidates'],
                          boldTextIndices: [0],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xFFF0F9FA),
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(
                  screenWidth * .05,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Technologies Offered",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Image.asset('assets/images/Vector1.png'),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: screenWidth * .01),
                      child: const Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        // alignment: WrapAlignment.center,
                        children: [
                          MyWelcomeTechnologiesOfferedCard(
                              text: "Artificial Intelligence, Machine Learning",
                              imagePath: 'assets/images/aimlrpa.png'),
                          MyWelcomeTechnologiesOfferedCard(
                              text: "Augmented Reality / Virtual Reality",
                              imagePath: 'assets/images/arvr.png'),
                          MyWelcomeTechnologiesOfferedCard(
                              text: "Blockchain",
                              imagePath: 'assets/images/blockchain.png'),
                          MyWelcomeTechnologiesOfferedCard(
                              text: "Wireless Networks",
                              imagePath: 'assets/images/wireless.png'),
                          MyWelcomeTechnologiesOfferedCard(
                              text: "Smart Mobility",
                              imagePath: 'assets/images/smartmobility.png'),
                          MyWelcomeTechnologiesOfferedCard(
                              text: "Health Informatics",
                              imagePath: 'assets/images/healthinformatics.png'),
                          MyWelcomeTechnologiesOfferedCard(
                              text: "Digital Preservation & Language Computing",
                              imagePath:
                                  'assets/images/digitalpreservation.png'),
                          MyWelcomeTechnologiesOfferedCard(
                              text: "IoT, Cloud Computing",
                              imagePath: 'assets/images/iot.png'),
                          MyWelcomeTechnologiesOfferedCard(
                              text: "e-Waste & Smart City",
                              imagePath: 'assets/images/ewaste.png'),
                          MyWelcomeTechnologiesOfferedCard(
                              text: "Testing/QA Methodology",
                              imagePath: 'assets/images/testing.png'),
                          MyWelcomeTechnologiesOfferedCard(
                              text: "Flexible Electronics, Robotics",
                              imagePath:
                                  'assets/images/flexibleelectronics.png'),
                          MyWelcomeTechnologiesOfferedCard(
                              text: "CPU Design, Quantum Computing",
                              imagePath: 'assets/images/cpu.png'),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width *
                                    0.7, // Set width relative to screen size
                                height: 500, // Set height as needed
                                padding: EdgeInsets.all(
                                  screenWidth * .01,
                                ),
                                child: MyWelcomePopupList(
                                  title: 'Technologies',
                                  technologies: moretechnologies,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: const Text(
                        "and many more",
                        style: TextStyle(
                          color: Color(0xff049304),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage(
              //         'assets/images/opportunitiesavailablebgimg.png'),
              //     fit: BoxFit.cover,
              //   ),
              // ),
              child: Padding(
                padding: EdgeInsets.all(
                  screenWidth * .05,
                ),
                child: Column(
                  children: [
                    const Text(
                      'Opportunities Available In',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset('assets/images/Vector1.png'),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        int crossAxisCount;
                        if (constraints.maxWidth < 800) {
                          crossAxisCount = 3; // 3 columns for small screens
                        } else if (constraints.maxWidth < 1000) {
                          crossAxisCount = 4; // 4 columns for medium screens
                        } else {
                          crossAxisCount = 7; // 7 columns for large screens
                        }
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * .05),
                          child: GridView.count(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                            shrinkWrap: true,
                            children: [
                              cityCard(context, "Bangalore",
                                  'assets/images/banglore.png'),
                              cityCard(context, "Bhubaneswar",
                                  'assets/images/bhubhaneshwar.png'),
                              cityCard(context, "Chennai",
                                  'assets/images/chennai.png'),
                              cityCard(
                                  context, "Delhi", 'assets/images/delhi.png'),
                              cityCard(context, "Gangtok",
                                  'assets/images/gangtok.png'),
                              cityCard(context, "Guwahati",
                                  'assets/images/guwahati.png'),
                              cityCard(context, "Hyderabad",
                                  'assets/images/hyderabad.png'),
                              cityCard(context, "Jaipur",
                                  'assets/images/jaipur.png'),
                              cityCard(context, "Kolkata",
                                  'assets/images/kolkata.png'),
                              cityCard(context, "Lucknow",
                                  'assets/images/lucknow.png'),
                              cityCard(context, "Mohali",
                                  'assets/images/mohali.png'),
                              cityCard(context, "Mumbai",
                                  'assets/images/mumbai.png'),
                              cityCard(
                                  context, "Noida", 'assets/images/noida.png'),
                              cityCard(
                                  context, "Patna", 'assets/images/patna.png'),
                              cityCard(
                                  context, "Pune", 'assets/images/pune.png'),
                              cityCard(context, "Shillong",
                                  'assets/images/shillong.png'),
                              cityCard(context, "Shimla",
                                  'assets/images/shimla.png'),
                              cityCard(context, "Srinagar",
                                  'assets/images/Srinagar.png'),
                              cityCard(context, "Thiruvananthapuram",
                                  'assets/images/thiruvananthapuram.png'),
                              cityCard(
                                  context, "Tura", 'assets/images/tura.png'),
                              cityCard(
                                  context, "Vizag", 'assets/images/vizag.png'),
                            ],
                          ),
                        );
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width *
                                    0.7, // Set width relative to screen size
                                height: 500, // Set height as needed
                                padding: EdgeInsets.all(
                                  screenWidth * .01,
                                ),
                                child: MyWelcomePopupList(
                                  title: 'Available Locations',
                                  technologies: availablelocations,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: const Text(
                        "and many more",
                        style: TextStyle(
                          color: Color(0xff049304),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenWidth * .01,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Candidates Speak",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Image.asset('assets/images/Vector1.png'),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: screenWidth * .05),
                    child: CarouselSlider(
                      items: candidateData.map((candidate) {
                        return MyWelcomeCandidateSpeakCard(
                          imagePath: candidate['imagePath'],
                          description: candidate['description'],
                          boldTextIndices: candidate['boldTextIndices'],
                          name: candidate['name'],
                          role: candidate['role'],
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 300,
                        // enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 5),
                        scrollDirection: Axis.horizontal,
                      ),
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

// Reusable widget for the card
class BeneficiaryCard extends StatelessWidget {
  final String imagePath;
  final List<String> description;
  final List<int> boldTextIndices;

  const BeneficiaryCard({
    super.key,
    required this.imagePath,
    required this.description,
    required this.boldTextIndices,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Check if the screen width is small
        bool isSmallScreen = constraints.maxWidth < 400;

        return Card(
          color: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            width: isSmallScreen ? constraints.maxWidth : 350,
            height:
                isSmallScreen ? 180 : 200, // Adjust height for small screens
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  height: isSmallScreen
                      ? 50
                      : 60, // Adjust image height for small screens
                ),
                const SizedBox(height: 16),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    children: description.map((text) {
                      final isBold =
                          boldTextIndices.contains(description.indexOf(text));
                      return TextSpan(
                        text: text,
                        style: TextStyle(
                          fontWeight:
                              isBold ? FontWeight.bold : FontWeight.normal,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// reusable widget for displaying technologies offered in cities..
Widget cityCard(BuildContext context, String cityName, String imagePath) {
  return SizedBox(
    width: 10,
    height: 10,
    // color: Colors.teal,
    child: InkWell(
      onTap: () {
        MyFun.navigatToPage(context, const WblOpportunitiesPage());
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 70,
            height: 70,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              cityName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

// Helper method to create image and text in a row
Widget _buildRowItem(String imagePath, String text) {
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
