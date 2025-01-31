import 'package:flutter/material.dart';
import 'package:wbl/Reusable%20Functions/reusable_function.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_footer.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_header.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_popup_list.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_technologies_offered_card.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_divider.dart';

class RecruitersPage extends StatelessWidget {
  RecruitersPage({super.key});
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
  final List<Map<String, String>> profilecarddata = [
    {
      'name': 'Chirag Ubnare',
      'degree': '(B.Tech), ',
      'wblpYear': 'WBLP 2023',
      'organization': 'C-DAC, Mohali',
      'domain': 'Artificial Intelligence (AI) and Machine Learning',
      'placement': 'Software Engineer at TCS, Mumbai',
      'imageUrl': 'assets/images/chiragubnare.png',
    },
    {
      'name': 'Rupinder Kaur',
      'degree': '(B.Tech), ',
      'wblpYear': 'WBLP 2023',
      'organization': 'C-DAC, Mohali',
      'domain': 'Cyber Security',
      'placement': 'Project Engineer at C-DAC, Mohali',
      'imageUrl': 'assets/images/rupinderkaur.png',
    },
    {
      'name': 'Neha Yadav',
      'degree': '(B.Tech), ',
      'wblpYear': 'WBLP 2023',
      'organization': 'C-DAC, Mohali',
      'domain': 'Digital Health',
      'placement': 'Project Engineer at C-DAC, Mohali',
      'imageUrl': 'assets/images/nehayadav.png',
    },
    {
      'name': 'Agnus Teresa',
      'degree': '(B.Tech), ',
      'wblpYear': 'WBLP 2023',
      'organization': 'STQC, Thiruvananthapuram',
      'domain': 'IT Testing',
      'placement': 'System Engineer, TCS',
      'imageUrl': 'assets/images/agnusteresa.jpg',
    },
    {
      'name': 'Agnus Teresa',
      'degree': '(B.Tech), ',
      'wblpYear': 'WBLP 2023',
      'organization': 'STQC, Thiruvananthapuram',
      'domain': 'IT Testing',
      'placement': 'System Engineer, TCS',
      'imageUrl': 'assets/images/default.jpg',
    }
  ];
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
                            'For Recruiters',
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
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * .07, vertical: screenWidth * .03),
            color: const Color(0xffF0F9FA),
            child: Column(
              children: [
                const Text(
                  'Work-Based Learning (WBL) programme: A Gateway to Promising Talent',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                    "The Work-Based Learning (WBL) programme of Govt. of India is a groundbreaking initiative designed to equip fresh Graduate Engineers with hands-on experience in cutting-edge Information Technology, Electronics, and related fields. The programme offers candidates the remarkable opportunity to immerse themselves in the dynamic world of Design, Development, and Research activities at premier MeitY Institutions, working with state-of-the-art technologies and real-life projects of national importance. Through this programme, participants embark on a journey of Technical Knowledge Expansion, Real-time Working Skills development, Technology Application, Problem Solving, Reasoning, Ideation, Analytical Thinking, and the cultivation of Interpersonal Skills. All of this unfolds within a professional work environment, setting them on the path to success."),
                const SizedBox(height: 20),
                const Text(
                    'The "Work-Based Learning (WBL) programme" has a noble goal: to empower and fortify SC/ST/Women/EWS Graduate Engineers through the esteemed MeitY Institutions. This initiative is currently underway in seven prominent organizations under MeitY, including CERT-In, C-DAC, NIELIT, STQC, CMET, ERNET, and SAMEER. Within these organizations, participants are exposed to specific and targeted projects, capacity-building endeavors, design-based tasks, developmental projects, and cutting-edge research activities. Their journey includes immersion in the vibrant world of Information Technology and Electronics, which equips them with practical expertise to complement their theoretical knowledge, making them job-ready.'),
                const SizedBox(height: 20),
                const Text(
                    'WBL programme presents a rich opportunity to recruit graduates who have undergone a transformative journey and are now primed to contribute to your organization \'s success. Don\'t miss out on these exceptional candidates coming out of our WBL program.'),
                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: screenWidth * .05,
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
                                text:
                                    "Artificial Intelligence, Machine Learning",
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
                                imagePath:
                                    'assets/images/healthinformatics.png'),
                            MyWelcomeTechnologiesOfferedCard(
                                text:
                                    "Digital Preservation & Language Computing",
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
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.center,
                        'Prospective recruiters may connect with the following members for the further information',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: screenWidth * .03,
                  ),
                  child: const Wrap(
                    direction: Axis.horizontal,
                    children: [
                      RecruiterCardWidget(
                        name: 'Mr. Munish Ratti',
                        email: 'munishratti@cdac.in',
                        address:
                            'A-34,Phase 8, Industrial Area Sector \n73, SAS Nagar Punjab 160071',
                        phoneNumber: '9815972884',
                        organization: 'CDAC',
                        cardColor: Color(0xff1E2D48),
                        logoPath: 'assets/images/cdacLogo.png',
                        textColor: Color(0xffE8D7AE),
                      ),
                      RecruiterCardWidget(
                        name: 'Mr. R Marimuthu',
                        email: 'marimuthu@cmet.gov.in',
                        address:
                            'C-MET Panchawati, Off Pashan Road\nPune : 411 008',
                        phoneNumber: '9422521713',
                        organization: 'CMET',
                        cardColor: Color(0xffE8D7AE),
                        logoPath: 'assets/images/cmet-logo.png',
                        textColor: Color(0xff1E2D48),
                      ),
                      RecruiterCardWidget(
                        name: 'Dr . Paventhan',
                        email: 'paventhan@eis.ernet.in',
                        address:
                            'ERNET India 5th Floor, Block-I, A Wing, DMRC IT Park, Shastri Park, New Delhi-110053',
                        phoneNumber: '9916919763',
                        organization: 'ERNET',
                        cardColor: Color(0xff1E2D48),
                        logoPath: 'assets/images/ERNET2.png',
                        textColor: Color(0xffE8D7AE),
                      ),
                      RecruiterCardWidget(
                        name: 'Sh. Hirdesh Sihare',
                        email: 'h.sihare@nielit.gov.in',
                        address:
                            'NIELIT Bhawan, Plot No. 3, PSP Pocket, Sector-8, Dwarka, New Delhi-110077',
                        phoneNumber: '9717699854',
                        organization: 'NIELIT',
                        cardColor: Color(0xffE8D7AE),
                        logoPath: 'assets/images/NIELIT2.png',
                        textColor: Color(0xff1E2D48),
                      ),
                      RecruiterCardWidget(
                        name: 'Mr. Sanjay Pethe',
                        email: 'sanjay@sameer.gov.in',
                        address: 'IIT Mumbai Campus ,Powai, Mumbai 400076',
                        phoneNumber: '7021692405',
                        organization: 'SAMEER',
                        cardColor: Color(0xff1E2D48),
                        logoPath: 'assets/images/Sameer2.png',
                        textColor: Color(0xffE8D7AE),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: const Color(0xffF0F9FA),
            child: Column(
              children: [
                const MyWelcomeDivider(),
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.center,
                        'To directly hire candidates of the programme.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          MyFun.navigatToPage(context, RecruitersPage());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff049304),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Set the desired radius
                          ),
                        ),
                        child: const Text(
                          'Click Me',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      'to explore the Resume Bank',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const MyWelcomeDivider(),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * .009,
                      vertical: screenWidth * .03),
                  child: Column(
                    children: [
                      Positioned.fill(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'WBL Programme (Placement)',
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
                      Padding(
                        padding: EdgeInsets.symmetric(
                          // horizontal: screenWidth* .01,
                          vertical: screenWidth * .01,
                        ),
                        child: Wrap(
                          spacing: 20.0, // Horizontal space between the cards
                          runSpacing:
                              20.0, // Vertical space between rows of cards
                          children: profilecarddata.map((profile) {
                            return SizedBox(
                              width:
                                  440, // Set a fixed width for each card to make them consistent
                              height: 200,
                              child: ProfileCard(profileData: profile),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const MyWelcomeFooter(),
        ],
      )),
    );
  }
}

class RecruiterCardWidget extends StatelessWidget {
  final String name;
  final String email;
  final String address;
  final String phoneNumber;
  final String organization;
  final Color cardColor;
  final Color textColor;
  final String logoPath;

  const RecruiterCardWidget({
    super.key,
    required this.name,
    required this.email,
    required this.address,
    required this.phoneNumber,
    required this.organization,
    required this.cardColor,
    required this.textColor,
    required this.logoPath,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: 420,
      height: 300,
      child: Card(
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * .01),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: textColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * .01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        logoPath,
                        height: 50, // Adjust the logo size as needed
                        fit: BoxFit.contain,
                      ),
                      // const SizedBox(height: 10),
                      Text(
                        organization,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 16,
                          color: textColor,
                        ),
                      ),
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 16,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 16,
                          color: textColor,
                        ),
                      ),
                      Text(
                        email,
                        style: TextStyle(
                          fontSize: 16,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Address",
                        style: TextStyle(
                          fontSize: 16,
                          color: textColor,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.end,
                          address,
                          style: TextStyle(
                            fontSize: 14,
                            color: textColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Phone Number",
                        style: TextStyle(
                          fontSize: 16,
                          color: textColor,
                        ),
                      ),
                      Text(
                        phoneNumber,
                        style: TextStyle(
                          fontSize: 16,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final Map<String, String> profileData;

  const ProfileCard({
    super.key,
    required this.profileData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      // elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            profileData['imageUrl'] ?? 'assets/images/default.jpg',
            width: 150, // Set the image width
            height: 200, // Set the image height
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 12), // Add space between image and text
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        profileData['name'] ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff0c3f8f),
                        ),
                      ),
                      const SizedBox(
                          height: 4), // Space between name and degree
                      Text(
                        profileData['degree'] ?? '',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        profileData['wblpYear'] ?? '',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                      height: 8), // Space between organization and domain
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Domain: ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0c3f8f),
                          ),
                        ),
                        TextSpan(
                          text: profileData['domain'] ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Placed: ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0c3f8f),
                          ),
                        ),
                        TextSpan(
                          text: profileData['placement'] ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
