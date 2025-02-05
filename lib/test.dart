// ignore_for_file: non_constant_identifier_names, unused_element
import 'package:flutter/material.dart';
import 'package:wbl/Pages/Candidate%20Pages/Certificates/level_one_page.dart';
import 'package:wbl/Pages/Candidate%20Pages/Certificates/level_two_page.dart';
import 'package:wbl/Pages/Candidate%20Pages/Profile%20Details/candidate_profile_details.dart';
import 'package:wbl/Pages/Candidate%20Pages/Resume/add_resume_page.dart';
import 'package:wbl/Pages/Candidate%20Pages/Stipend/stipend.dart';
import 'package:wbl/Pages/Login%20Page/Enrollment%20Form/Candidate%20Enrollment%20Form/candidate_enrollment_form.dart';
import 'package:wbl/Pages/Login%20Page/login_page.dart';
import 'package:wbl/Reusable%20Widgets/Admin%20Page%20Reusable%20Widgets/login_page_format.dart';
import 'package:wbl/Reusable%20Widgets/Admin%20Page%20Reusable%20Widgets/new_loginpage_format.dart';

// ignore: must_be_immutable
class TestPage extends StatefulWidget {
  TestPage({super.key, this.selectedButtonName, this.bodyWidget});

  Widget? bodyWidget;
  final String? selectedButtonName;

  @override
  State<TestPage> createState() => _CandidateProfileState();
}

class _CandidateProfileState extends State<TestPage> {
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
      'icon': Icons.work,
      'title': <String, dynamic>{'Certi': const LevelOnePage()},
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

  Map<String, dynamic> user = {
    'firstName': 'Dimple',
    'lastName': 'Kaundal',
    'profileImage': null,
    "center": "C-DAC, Mohali",
    'roll': 'Student',
    'profile': Text('Add Profile page in user details')
  };

  @override
  Widget build(BuildContext context) {
    LoginPageFormat.bodyWidget = widget.bodyWidget;
    LoginPageFormat.selectedButtonName = widget.selectedButtonName;
    return NewLoginpageFormat(
      user: user,
      menuItems: menuItems,
    );
  }
}
