// ignore_for_file: non_constant_identifier_names, unused_element
import 'package:flutter/material.dart';
import 'package:wbl/Pages/Candidate%20Pages/Certificates/level_one_page.dart';
import 'package:wbl/Pages/Candidate%20Pages/Certificates/level_two_page.dart';
import 'package:wbl/Pages/Candidate%20Pages/Profile%20Details/candidate_profile_details.dart';
import 'package:wbl/Pages/Candidate%20Pages/Resume/add_resume_page.dart';
import 'package:wbl/Pages/Candidate%20Pages/Stipend/stipend.dart';
import 'package:wbl/Pages/Login%20Page/Enrollment%20Form/Candidate%20Enrollment%20Form/candidate_enrollment_form.dart';
import 'package:wbl/Pages/Login%20Page/login_page.dart';
import 'package:wbl/Reusable%20Widgets/Admin%20Page%20Reusable%20Widgets/new_loginpage_format.dart';

// ignore: must_be_immutable
class CandidateHomePage extends StatefulWidget {
  CandidateHomePage({super.key, this.selectedButtonName, this.bodyWidget});

  Widget? bodyWidget;
  final String? selectedButtonName;

  @override
  State<CandidateHomePage> createState() => _CandidateProfileState();
}

class _CandidateProfileState extends State<CandidateHomePage> {
  List<Map<String, dynamic>> menuItems = [
    {
      'icon': Icons.person,
      'title': <String, dynamic>{'Manage Profile': null},
      'subtitle': {
        "Profile": const CandidateProfileDetails(),
        'Stipend': const StipendPage(),
        'Add Resume': const AddResumePage(),
      }
    },
    {
      'icon': Icons.work,
      'title': <String, dynamic>{'Certificate': null},
      "subtitle": {'L1': const LevelOnePage(), "L2": const LevelTwoPage()}
    },
    {
      'icon': Icons.logout,
      'title': <String, dynamic>{
        'Logout': const LoginPage(
          userName: 'Candidate login',
          registerPage: CandidateEnrollmentForm(),
        ),
      },
    }
  ];

  Map<String, String?> user = {
    'firstName': 'Dimple',
    'lastName': 'Kaundal',
    'profileImage': null,
    "center": "C-DAC, Mohali",
    'center type': 'Student',
  };

  @override
  Widget build(BuildContext context) {
    return NewLoginpageFormat(
      user: user,
      menuItems: menuItems,
    );
  }
}
