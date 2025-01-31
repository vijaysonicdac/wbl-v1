import 'package:flutter/material.dart';
import 'package:wbl/Pages/Welcome%20Page/WBL%20opportunities/wbl_opportunities_apply_form.dart';
import 'package:wbl/Reusable%20Functions/reusable_function.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_footer.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_header.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_searchable_dropdown.dart';

//import 'dart:js' as js;

class MyFunUrlLauncher {
  static void navigateToPage(String url) {
    //js.context.callMethod('open', [url]);
  }
}

class WblOpportunitiesPage extends StatefulWidget {
  const WblOpportunitiesPage({super.key});

  @override
  WblOpportunitiesPageState createState() => WblOpportunitiesPageState();
}

class WblOpportunitiesPageState extends State<WblOpportunitiesPage> {
  String? selectedOrganization;
  String? selectedCenter;
  String? selectedState;
  String? selectedTechnology;
  final controllerOrganization = TextEditingController();
  final controllerCenter = TextEditingController();
  final controllerState = TextEditingController();
  final controllerTechnology = TextEditingController();
  List<String> center = [];
  List<Opportunity> allOpportunities = []; // All opportunities
  List<Opportunity> filteredOpportunities = []; // Filtered opportunities
  void onItemSelected(String? selectedItem) {
    setState(() {
      selectedOrganization = selectedItem; // Update the selected organization
    });
  }

  String? validateDropdown(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select an option';
    }
    return null;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> organizations = [
    'C-DAC',
    'CERT-IN',
    'CMET',
    'ERNET',
    'NIELIT',
    'SAMEER',
    'STQC'
  ];
  final Map<String, List<String>> centersByOrganization = {
    'C-DAC': [
      'Delhi',
      'Chennai',
      'Hyderabad',
      'Kolkata',
      'Mohali',
      'Noida',
      'Patna',
      'Pune',
      'Silchar',
      'Thiruvananthapuram',
      'Bengaluru',
      'Mumbai'
    ],
    'CERT-IN': ['Delhi'],
    'CMET': ['Pune'],
    'ERNET': ['Bengaluru', 'Chennai', 'Delhi'],
    'NIELIT': [
      'Muzaffarpur',
      'Buxar',
      'Agartala',
      'Aizawl',
      'Ajmer',
      'Aurangabad',
      'Bhubaneswar',
      'Calicut',
      'Chennai',
      'Chuchuyimlang',
      'Churachandpur',
      'Daman',
      'Dibrugarh',
      'Dimapur',
      'Gangtok',
      'Gorakhpur',
      'Guwahati',
      'Haridwar',
      'Imphal',
      'Itanagar',
      'Jammu',
      'Jorhat',
      'Kargil',
      'Kohima',
      'Kokrajhar',
      'Kolkata',
      'Kurukshetra',
      'Leh',
      'Lucknow',
      'Lunglei',
      'Majuli',
      'Mandi',
      'Pali',
      'Pasighat',
      'Patna',
      'Ranchi',
      'Ropar',
      'Senapati',
      'Shillong',
      'Shimla',
      'Silchar',
      'Srinagar',
      'Tezu',
      'Tezpur',
      'Tura'
    ],
    'SAMEER': ['Chennai', 'Guwahati', 'Kolkata', 'Mumbai', 'Vizag'],
    'STQC': [
      'Bengaluru',
      'Chennai',
      'Delhi',
      'Guwahati',
      'Hyderabad',
      'Jaipur',
      'Kolkata',
      'Mohali',
      'Mumbai',
      'Pune',
      'Thiruvananthapuram'
    ],
  };
  final List<String> states = [
    'Andaman & Nicobar Islands',
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chandigarh',
    'Chattisgarh',
    'Dadra & Nagar Haveli',
    'Daman & Diu',
    'Delhi',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jammu & Kashmir',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Lakshadweep',
    'Ladakh',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Puducherry',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal'
  ];
  final List<String> technologies = [
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
  final List<Opportunity> opportunities = [
    Opportunity(
      organization: 'C-DAC',
      center: 'Mohali',
      state: 'Punjab',
      technology: 'AI & ML using Python',
      duration: '6 Months',
      period: 'Jan 2025 - June 2025',
      stipend: '₹10000/month',
      vacancies: 50,
      applyBy: 'November 15, 2024',
      description:
          'The objective of the Work Based Learning Programme is to provide an opportunity for SC, ST, EWS, and Women candidates to acquire technical skills in emerging technologies to up-skill their professional career and as per the requirement of industrial needs.',
      logoUrl: 'assets/images/cdacLogo.png',
    ),
    Opportunity(
      organization: 'NIELIT',
      center: 'Guwahati',
      state: 'Assam',
      technology: 'Cyber Security',
      duration: '4 Months',
      period: 'Feb 2025 - May 2025',
      stipend: '₹8000/month',
      vacancies: 30,
      applyBy: 'December 1, 2024',
      description:
          'Cyber Security training to upskill professionals in secure network practices...',
      logoUrl: 'assets/images/NIELIT2.png',
    ),
  ];
  @override
  void initState() {
    super.initState();
    // Set the full list of opportunities initially
    allOpportunities = opportunities;
    filteredOpportunities =
        allOpportunities; // Initialize with all opportunities
    controllerOrganization.addListener(() {
      if (organizations.contains(controllerOrganization.text)) {
        setState(() {
          center = centersByOrganization[controllerOrganization.text]
              as List<String>;
        });
      } else {
        setState(() {
          center = [];
        });
      }
    });
  }

  void onSearchPressed() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        // Assign controller values before filtering
        selectedOrganization = controllerOrganization.text;
        selectedCenter = controllerCenter.text;
        selectedState = controllerState.text;
        selectedTechnology = controllerTechnology.text;

        // Filter opportunities based on the selected search criteria
        filteredOpportunities = allOpportunities.where((opportunity) {
          return (selectedOrganization == null ||
                  selectedOrganization!.isEmpty ||
                  opportunity.organization == selectedOrganization) &&
              (selectedCenter == null ||
                  selectedCenter!.isEmpty ||
                  opportunity.center == selectedCenter) &&
              (selectedState == null ||
                  selectedState!.isEmpty ||
                  opportunity.state == selectedState) &&
              (selectedTechnology == null ||
                  selectedTechnology!.isEmpty ||
                  opportunity.technology == selectedTechnology);
        }).toList();
      });
    }
  }

  @override
  void dispose() {
    controllerOrganization.dispose();
    controllerCenter.dispose();
    controllerState.dispose();
    controllerTechnology.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MyWelcomeHeader(),
            // Background color container
            Container(
              color: const Color(0xffF0F9FA),
              child: LayoutBuilder(builder: (context, constraints) {
                bool isSmallScreen = screenWidth < 800;
                return Column(
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
                                'WBL Opportunities',
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
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * .1,
                        vertical: screenWidth * .03,
                      ),
                      child: isSmallScreen
                          ? Column(
                              children: [
                                Form(
                                  key: _formKey,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Search WBL Opportunities",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 16.0),
                                        SizedBox(
                                          height: 50,
                                          child: MyWelcomeSearchableDropdown(
                                            dropdownItems: organizations,
                                            hintText: 'Select Organization',
                                            controller: controllerOrganization,
                                            validator: validateDropdown,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                          ),
                                        ),
                                        const SizedBox(height: 16.0),
                                        SizedBox(
                                            height: 50,
                                            child: centerDropdown()),
                                        const SizedBox(height: 16.0),
                                        SizedBox(
                                          height: 50,
                                          child: MyWelcomeSearchableDropdown(
                                              dropdownItems: states,
                                              hintText: 'Select State',
                                              controller: controllerState,
                                              validator: validateDropdown,
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction),
                                        ),
                                        const SizedBox(height: 16.0),
                                        SizedBox(
                                          height: 50,
                                          child: MyWelcomeSearchableDropdown(
                                              dropdownItems: technologies,
                                              hintText: 'Select Technology',
                                              controller: controllerTechnology,
                                              validator: validateDropdown,
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction),
                                        ),
                                        const SizedBox(height: 24.0),
                                        // Search button
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xff049304),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 16.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          onPressed: onSearchPressed,
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.search,
                                                color: Colors.white,
                                              ),
                                              SizedBox(width: 8.0),
                                              Text(
                                                "Search",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16.0),
                                // Right side - No opportunities message / search results
                                filteredOpportunities.isEmpty
                                    ? buildOhNoContainer()
                                    : buildOpportunityList(),
                              ],
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Left side - Search form
                                Form(
                                  key: _formKey,
                                  child: Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding:
                                          EdgeInsets.all(screenWidth * .03),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
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
                                            "Search WBL Opportunities",
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 16.0),
                                          SizedBox(
                                            height: 50,
                                            child: MyWelcomeSearchableDropdown(
                                              dropdownItems: organizations,
                                              hintText: 'Select Organization',
                                              controller:
                                                  controllerOrganization,
                                              validator: validateDropdown,
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                            ),
                                          ),
                                          const SizedBox(height: 16.0),
                                          SizedBox(
                                              height: 50,
                                              child: centerDropdown()),
                                          const SizedBox(height: 16.0),
                                          SizedBox(
                                            height: 50,
                                            child: MyWelcomeSearchableDropdown(
                                                dropdownItems: states,
                                                hintText: 'Select State',
                                                controller: controllerState,
                                                validator: validateDropdown,
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction),
                                          ),
                                          const SizedBox(height: 16.0),
                                          SizedBox(
                                            height: 50,
                                            child: MyWelcomeSearchableDropdown(
                                                dropdownItems: technologies,
                                                hintText: 'Select Technology',
                                                controller:
                                                    controllerTechnology,
                                                validator: validateDropdown,
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction),
                                          ),
                                          const SizedBox(height: 24.0),
                                          // Search button
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0xff049304),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 16.0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            onPressed: onSearchPressed,
                                            child: const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.search,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(width: 8.0),
                                                Text(
                                                  "Search",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16.0),
                                // Right side - No opportunities message / search results
                                Expanded(
                                  flex: 4,
                                  child: filteredOpportunities.isEmpty
                                      ? buildOhNoContainer()
                                      : buildOpportunityList(),
                                ),
                              ],
                            ),
                    ),
                  ],
                );
              }),
            ),
            const MyWelcomeFooter(),
          ],
        ),
      ),
    );
  }

  Widget buildOhNoContainer() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.amber[100],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Color(0xffffecb5)),
              SizedBox(width: 8.0),
              Text(
                "Oh no!",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          const Text(
            "There are no opportunities available. Please check back later.",
            style: TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 16.0),
          const Divider(color: Colors.black26),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Back",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOpportunityList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: filteredOpportunities.length,
      itemBuilder: (context, index) {
        final opportunity = filteredOpportunities[index];
        return Card(
          color: Colors.white,
          // margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          // elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Badge/Logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Organization and Technology
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${opportunity.organization}, ${opportunity.center} (${opportunity.state})',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            opportunity.technology,
                            style: const TextStyle(color: Color(0xff214492)),
                          ),
                        ],
                      ),
                    ),
                    // Logo or Badge (on the right)
                    Flexible(
                      flex: 1,
                      child: CircleAvatar(
                        radius: 35, // Adjust size based on screen width
                        backgroundImage: NetworkImage(opportunity.logoUrl),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                // Icons with Details Section
                Wrap(
                  spacing: 12,
                  runSpacing: 10,
                  alignment: WrapAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _infoIconText(Icons.location_on, 'Location',
                        '${opportunity.center}, ${opportunity.state}'),
                    _infoIconText(
                        Icons.timer, 'Duration', opportunity.duration),
                    _infoIconText(
                        Icons.calendar_month, 'Period', opportunity.period),
                    _infoIconText(
                        Icons.attach_money, 'Stipend', opportunity.stipend),
                    _infoIconText(
                        Icons.people, 'Vacancies', '${opportunity.vacancies}'),
                    _infoIconText(
                        Icons.calendar_month, 'Apply By:', opportunity.applyBy),
                    PopupMenuButton<String>(
                      onSelected: (String value) {
                        if (value == 'AICTE') {
                          MyFunUrlLauncher.navigateToPage(
                              'https://internship.aicte-india.org/internship-details.php?uid=SU5URVJOU0hJUEdPVl8xNzI4MDI1MDg5NjZmZjkyMDFkMjk1ZQ==&level=OA==');
                        } else if (value == 'WBLP') {
                          MyFun.navigatToPage(
                              context, const WblOpportunitiesApplyForm());
                        }
                      },
                      itemBuilder: (BuildContext context) => [
                        const PopupMenuItem(
                          value: 'AICTE',
                          child: Text('via AICTE'),
                        ),
                        const PopupMenuItem(
                          value: 'WBLP',
                          child: Text('via WBLP'),
                        ),
                      ],
                      child: ElevatedButton(
                        onPressed:
                            null, // Handled by PopupMenuButton, so set to null
                        style: ElevatedButton.styleFrom(
                          // backgroundColor: const Color(0xff049304),
                          disabledBackgroundColor: const Color(0xff049304),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Apply Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(height: 30, thickness: 1),
                // About Section
                const Text(
                  'About',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  opportunity.description,
                  style:
                      const TextStyle(fontSize: 14, color: Color(0xff5C739A)),
                ),
                const SizedBox(height: 20),
                // Footer Section
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Implement your view more action
                    },
                    child: const Text(
                      'View more',
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

// Helper function for icon and text rows
  Widget _infoIconText(IconData icon, String heading, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          children: [
            Icon(icon, color: const Color(0xff049304)),
            Text(
              heading,
              style: const TextStyle(color: Color(0xff5C739A), fontSize: 12),
            ),
          ],
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget centerDropdown() {
    String? centerValidation(String? value) {
      if (controllerOrganization.text.isEmpty ||
          !organizations.contains(controllerOrganization.text)) {
        return 'Please select organization first.';
      }
      if (value == null ||
          value.isEmpty ||
          !controllerCenter.text.contains(value)) {
        return 'Please select any option from the list';
      }
      return null;
    }

    return MyWelcomeSearchableDropdown(
      dropdownItems: center,
      hintText: 'Select Center',
      controller: controllerCenter,
      validator: centerValidation,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}

class Opportunity {
  final String organization;
  final String center;
  final String state;
  final String technology;
  final String duration;
  final String period;
  final String stipend;
  final int vacancies;
  final String applyBy;
  final String description;
  final String logoUrl;
  Opportunity({
    required this.organization,
    required this.center,
    required this.state,
    required this.technology,
    required this.duration,
    required this.period,
    required this.stipend,
    required this.vacancies,
    required this.applyBy,
    required this.description,
    required this.logoUrl,
  });
}
