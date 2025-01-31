import 'package:flutter/material.dart';
import 'package:wbl/Pages/Welcome%20Page/Resume%20Bank%20Page/resume_bank_for_company.dart';
import 'package:wbl/Reusable Widgets/Welcome Page Reusable Widgets/my_welcome_footer.dart';
import 'package:wbl/Reusable Widgets/Welcome Page Reusable Widgets/my_welcome_header.dart';
import 'package:wbl/Reusable Widgets/Welcome Page Reusable Widgets/my_welcome_resume_profile_card.dart';
import 'package:wbl/Reusable Widgets/Welcome Page Reusable Widgets/my_welcome_searchable_dropdown.dart';
import 'package:wbl/Reusable%20Functions/reusable_function.dart';

class ResumeBank extends StatefulWidget {
  const ResumeBank({super.key});

  @override
  State<ResumeBank> createState() => _ResumeBankState();
}

class _ResumeBankState extends State<ResumeBank> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controllerTechnology = TextEditingController();
  String? selectedTechnology;
  List<Map<String, String>> filteredResumes = [];
  int currentPage = 0; // current page index
  final int itemsPerPage = 6; // Number of
  List<Map<String, String>> allResumes = [];
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

  final List<Map<String, String>> resumeProfileData = [
    {
      "name": 'Suraj Kumar Choudhary',
      "title": 'Artificial Intelligence (AI) and Machine Learning',
      "location": 'Jammu',
      "skills": 'AI, ML, Javascript, ReactJs, C++, Python',
      "about": 'Can be added later',
    },
    {
      "name": 'Mahalakshmi B',
      "title": 'Electronics',
      "location": 'Chennai',
      "skills":
          'Java programming, EMI EMC calibration and Testing, Data analytics, Ms office, Ms excel, Cloud computing',
      "about":
          'I am Mahalakshmi B completed my engineering degree at Jerusalem College of Engineering...',
    },
    {
      "name": 'John Doe',
      "title": 'Software Engineering',
      "location": 'Delhi',
      "skills": 'Java, Python, Flutter, Node.js',
      "about":
          'Software engineer with experience in web and mobile development.',
    },
    {
      "name": 'Jane Smith',
      "title": 'Data Science',
      "location": 'Mumbai',
      "skills": 'Machine Learning, Data Visualization, R, Python',
      "about": 'Data scientist with a passion for solving complex problems.',
    },
    {
      "name": 'Alice Johnson',
      "title": 'Web Development',
      "location": 'Bangalore',
      "skills": 'HTML, CSS, JavaScript, React, Node.js',
      "about": 'Front-end developer with a love for clean code and design.',
    },
    {
      "name": 'Bob Brown',
      "title": 'Cyber Security',
      "location": 'Pune',
      "skills": 'Network Security, Ethical Hacking, Python',
      "about": 'Cybersecurity expert focused on securing systems and networks.',
    },
    {
      "name": 'Charlie Davis',
      "title": 'Mobile Development',
      "location": 'Kolkata',
      "skills": 'Flutter, Dart, Android Development',
      "about":
          'Mobile app developer with expertise in cross-platform solutions.',
    },
  ];

  // Function to get items for the current page
  // Add this method to get items from filtered resumes
  List<Map<String, String>> getCurrentPageItems() {
    int totalPages = getTotalPages();

    // Ensure currentPage is not greater than the total pages
    if (currentPage >= totalPages) {
      currentPage = totalPages - 1; // Set to last page if out of range
    }

    int start = currentPage * itemsPerPage;
    int end = start + itemsPerPage;

    // Return a sublist safely
    return filteredResumes.sublist(
      start,
      end > filteredResumes.length ? filteredResumes.length : end,
    );
  }

  int getTotalPages() {
    if (filteredResumes.isEmpty) {
      return 1; // At least one page for empty results
    }
    return (filteredResumes.length / itemsPerPage).ceil();
  }

  String? validateDropdown(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select an option';
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    // Initialize with the complete list of resumes
    allResumes =
        resumeProfileData; // Assuming this is your complete data source
    filteredResumes = List.from(allResumes); // Display all resumes by default
  }

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
                              'Resume Bank',
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
              color: const Color(0xffF0F9FA),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * .06,
                  vertical: screenWidth * .03,
                ),
                child: screenWidth < 850
                    ? Column(
                        children: [
                          Form(
                            key: _formKey,
                            child: Container(
                              padding: EdgeInsets.all(screenWidth * .03),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Search",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  SizedBox(
                                    height: 50,
                                    child: MyWelcomeSearchableDropdown(
                                      dropdownItems: technologies,
                                      hintText: "Select Technology Domain",
                                      controller: controllerTechnology,
                                      validator: validateDropdown,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        if (_formKey.currentState!.validate()) {
                                          setState(() {
                                            selectedTechnology =
                                                controllerTechnology.text
                                                    .trim();

                                            // If the search field is empty, reset to show all resumes
                                            if (selectedTechnology!.isEmpty) {
                                              filteredResumes =
                                                  List.from(allResumes);
                                            } else {
                                              // Filter resumes based on the search input
                                              filteredResumes =
                                                  allResumes.where((resume) {
                                                return resume['title']!
                                                    .contains(
                                                        selectedTechnology!);
                                              }).toList();
                                            }
                                            currentPage =
                                                0; // Reset to first page
                                          });
                                        }
                                      }
                                    },
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
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                              height: 16), // Space between dropdown and cards
                          // Profile Resume bank cards
                          ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: filteredResumes.isNotEmpty
                                ? getCurrentPageItems().map((profile) {
                                    return MyWelcomeResumeProfileCard(
                                      name: profile['name']!,
                                      title: profile['title']!,
                                      location: profile['location']!,
                                      skills: profile['skills']!,
                                      about: profile['about']!,
                                      onResumePressed: () {
                                        MyFun.navigatToPage(context,
                                            const ResumeBankForCompany());
                                      },
                                    );
                                  }).toList()
                                : [
                                    // Display a message if no resumes match
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth * .01,
                                          vertical: screenWidth * .01),
                                      decoration: BoxDecoration(
                                        color: const Color(
                                            0xfffff3cd), // Background color
                                        borderRadius: BorderRadius.circular(
                                            12), // Border radius
                                      ),
                                      child: Center(
                                        child: Wrap(
                                          children: [
                                            const Icon(
                                              Icons.warning,
                                              color: Color(0xff664d03),
                                            ),
                                            const Text(
                                              "No Resume Found Based on Your Search.",
                                              style: TextStyle(
                                                color: Color(0xff664d03),
                                                fontSize: 18,
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                // Logic to go back or reset the search
                                                setState(() {
                                                  selectedTechnology =
                                                      null; // Reset selection
                                                  filteredResumes = List.from(
                                                      allResumes); // Reset filtered resumes to show all
                                                  currentPage =
                                                      0; // Reset to the first page
                                                });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor: Colors.white,
                                                backgroundColor: const Color(
                                                    0xff214492), // Set the button color
                                              ),
                                              child: const Text("Go Back"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                          ),

                          // Pagination Controls
                          if (filteredResumes.isNotEmpty)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // Previous button
                                TextButton(
                                  onPressed: currentPage > 0
                                      ? () {
                                          setState(() {
                                            currentPage--;
                                          });
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
                                    width: 16), // Space between buttons
                                // Next button
                                TextButton(
                                  onPressed: (currentPage + 1) * itemsPerPage <
                                          resumeProfileData.length
                                      ? () {
                                          setState(() {
                                            currentPage++;
                                          });
                                        }
                                      : null,
                                  child: Row(
                                    children: [
                                      Text('Next',
                                          style: TextStyle(
                                            color: (currentPage + 1) *
                                                        itemsPerPage <
                                                    resumeProfileData.length
                                                ? Colors.blue
                                                : Colors.grey,
                                          )),
                                      Icon(
                                        Icons.arrow_right,
                                        color:
                                            (currentPage + 1) * itemsPerPage <
                                                    resumeProfileData.length
                                                ? Colors.blue
                                                : Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Form(
                            key: _formKey,
                            child: Flexible(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.all(screenWidth * .025),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Search",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    SizedBox(
                                      height: 50,
                                      child: MyWelcomeSearchableDropdown(
                                        dropdownItems: technologies,
                                        hintText: "Select Technology Domain",
                                        controller: controllerTechnology,
                                        validator: validateDropdown,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            setState(() {
                                              selectedTechnology =
                                                  controllerTechnology.text
                                                      .trim();

                                              // If the search field is empty, reset to show all resumes
                                              if (selectedTechnology!.isEmpty) {
                                                filteredResumes =
                                                    List.from(allResumes);
                                              } else {
                                                // Filter resumes based on the search input
                                                filteredResumes =
                                                    allResumes.where((resume) {
                                                  return resume['title']!
                                                      .contains(
                                                          selectedTechnology!);
                                                }).toList();
                                              }
                                              currentPage =
                                                  0; // Reset to first page
                                            });
                                          }
                                        }
                                      },
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
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Resume cards
                          Flexible(
                            flex: 3,
                            child: Column(
                              children: [
                                ListView(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: filteredResumes.isNotEmpty
                                      ? getCurrentPageItems().map((profile) {
                                          return MyWelcomeResumeProfileCard(
                                            name: profile['name']!,
                                            title: profile['title']!,
                                            location: profile['location']!,
                                            skills: profile['skills']!,
                                            about: profile['about']!,
                                            onResumePressed: () {
                                              MyFun.navigatToPage(context,
                                                  const ResumeBankForCompany());
                                            },
                                          );
                                        }).toList()
                                      : [
                                          // Display a message if no resumes match
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: screenWidth * .01,
                                                vertical: screenWidth * .01),
                                            decoration: BoxDecoration(
                                              color: const Color(
                                                  0xfffff3cd), // Background color
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      12), // Border radius
                                            ),
                                            child: Center(
                                              child: Wrap(
                                                children: [
                                                  const Icon(
                                                    Icons.warning,
                                                    color: Color(0xff664d03),
                                                  ),
                                                  const Text(
                                                    "No Resume Found Based on Your Search.",
                                                    style: TextStyle(
                                                      color: Color(0xff664d03),
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      // Logic to go back or reset the search
                                                      setState(() {
                                                        selectedTechnology =
                                                            null; // Reset selection
                                                        filteredResumes = List.from(
                                                            allResumes); // Reset filtered resumes to show all
                                                        currentPage =
                                                            0; // Reset to the first page
                                                      });
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      foregroundColor:
                                                          Colors.white,
                                                      backgroundColor: const Color(
                                                          0xff214492), // Set the button color
                                                    ),
                                                    child:
                                                        const Text("Go Back"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                ),

                                // Pagination Controls
                                if (filteredResumes.isNotEmpty)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      // Previous button
                                      TextButton(
                                        onPressed: currentPage > 0
                                            ? () {
                                                setState(() {
                                                  currentPage--;
                                                });
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
                                      const SizedBox(width: 16),
                                      // Next button
                                      TextButton(
                                        onPressed:
                                            (currentPage + 1) * itemsPerPage <
                                                    resumeProfileData.length
                                                ? () {
                                                    setState(() {
                                                      currentPage++;
                                                    });
                                                  }
                                                : null,
                                        child: Row(
                                          children: [
                                            Text('Next',
                                                style: TextStyle(
                                                  color: (currentPage + 1) *
                                                              itemsPerPage <
                                                          resumeProfileData
                                                              .length
                                                      ? Colors.blue
                                                      : Colors.grey,
                                                )),
                                            Icon(
                                              Icons.arrow_right,
                                              color: (currentPage + 1) *
                                                          itemsPerPage <
                                                      resumeProfileData.length
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
                        ],
                      ),
              ),
            ),
            const MyWelcomeFooter(),
          ],
        ),
      ),
    );
  }
}
