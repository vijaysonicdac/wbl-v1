// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:wbl/Pages/Admin%20Pages/Dashboard/candidate_pichart.dart';
import 'package:wbl/Pages/Admin%20Pages/Manage%20Candidate/AICET%20%20ID/candidate_AICT.dart';
import 'package:wbl/Pages/Admin%20Pages/Manage%20Candidate/Assessment/candidate_assesment.dart';
import 'package:wbl/Pages/Admin%20Pages/Manage%20Candidate/CandidateList/candidatelist_page.dart';
import 'package:wbl/Pages/Admin%20Pages/Manage%20Candidate/Cohort/candidate_cohart.dart';
import 'package:wbl/Pages/Admin%20Pages/Manage%20Candidate/Stipend/candidate_stipend.dart';
import 'package:wbl/Pages/Admin%20Pages/Vacancy/candiatate_vacancy_page.dart';
import 'package:wbl/Pages/Login%20Page/Enrollment%20Form/Admin%20Enrollment%20Form/participating_institution_registration.dart';
import 'package:wbl/Pages/Welcome%20Page/welcome_page.dart';
import 'package:wbl/Reusable%20Widgets/Admin%20Page%20Reusable%20Widgets/new_loginpage_format.dart';

class AdminLoginPage extends StatefulWidget {
  AdminLoginPage({
    super.key,
    this.bodyWidget,
    this.selectedButtonName,
  });
  Widget? bodyWidget;
  final String? selectedButtonName;

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  Map<String, dynamic> user = {
    'firstName': 'Munish',
    'lastName': 'Ratti',
    'profileImage': null,
    'center': 'C-DAC, Mohali',
    'center type': 'PI',
    'profile': AdminLoginPage(
      selectedButtonName: 'Admin Proflie',
      bodyWidget: const AdminParticipatingRegs(
        isHeaderRequied: false,
      ),
    )
  };
  List<Map<String, dynamic>> menuItems = [
    {
      'icon': Icons.dashboard,
      'title': <String, dynamic>{'Dashboard': const MyColumn()},
    },
    {
      'icon': Icons.person,
      'title': <String, dynamic>{'Manage Candidate': null},
      'subtitle': {
        "Candidate List": CandidateList(),
        'Stipend': Stipendclass(),
        'Cohort': const Cohortpage(),
        'Assessment': const Assesmentpage(),
        'AICET IDs': const AicteId()
      }
    },
    {
      'icon': Icons.work,
      'title': <String, dynamic>{'Vacancy': VacancyClass()},
    },
    {
      'icon': Icons.logout,
      'title': <String, dynamic>{'Logout': const WelcomePage()},
    }
  ];

  @override
  Widget build(BuildContext context) {
    return NewLoginpageFormat(
      menuItems: menuItems,
      user: user,
      selectedButtonName: widget.selectedButtonName,
      // bodyWidget: widget.bodyWidget,
    );
  }
}
