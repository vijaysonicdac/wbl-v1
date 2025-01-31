// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:wbl/Pages/Admin%20Pages/admin_login_page.dart';
import 'package:wbl/Pages/CMS%20Pages/CMS%20Portal/Site%20Settings/home_widget.dart';
import 'package:wbl/Pages/CMS%20Pages/CMS%20Portal/Opportunity/technology.dart';
import 'package:wbl/Pages/CMS%20Pages/CMS%20Portal/Site%20Settings/addon_setting.dart';
import 'package:wbl/Pages/CMS%20Pages/CMS%20Portal/Advertisement/advertisements.dart';
import 'package:wbl/Pages/CMS%20Pages/CMS%20Portal/Application/candidate_application.dart';
import 'package:wbl/Pages/CMS%20Pages/CMS%20Portal/Site%20Settings/collegelist.dart';
import 'package:wbl/Pages/CMS%20Pages/CMS%20Portal/Companies/company.dart';
import 'package:wbl/Pages/CMS%20Pages/CMS%20Portal/FAQs/faq.dart';
import 'package:wbl/Pages/CMS%20Pages/CMS%20Portal/IO%20List/implementing.dart';
import 'package:wbl/Pages/CMS%20Pages/CMS%20Portal/Opportunity/placement.dart';
import 'package:wbl/Pages/CMS%20Pages/CMS%20Portal/Site%20Settings/privacy_policy.dart';
import 'package:wbl/Pages/CMS%20Pages/CMS%20Portal/Site%20Settings/report_update.dart';
import 'package:wbl/Pages/CMS%20Pages/CMS%20Portal/Opportunity/resume.dart';
import 'package:wbl/Pages/CMS%20Pages/CMS%20Portal/Opportunity/testimonials.dart';
import 'package:wbl/Pages/Login%20Page/Enrollment%20Form/Admin%20Enrollment%20Form/participating_institution_registration.dart';
import 'package:wbl/Reusable%20Widgets/Admin%20Page%20Reusable%20Widgets/login_page_format.dart';

class CmsDrawer extends StatefulWidget {
  CmsDrawer({
    super.key,
    this.bodyWidget,
    this.selectedButtonName,
  });
  Widget? bodyWidget;
  final String? selectedButtonName;
  @override
  State<CmsDrawer> createState() => _CmsDrawerState();
}

class _CmsDrawerState extends State<CmsDrawer> {
  List<Map<String, dynamic>> menuItems = [
    {
      'icon': Icons.work,
      'title': <String, dynamic>{'Advertisements': const Advertisement()},
    },
    {
      'icon': Icons.insert_drive_file,
      'title': <String, dynamic>{'Applications': const CandidateApplication()},
    },
    {
      'icon': Icons.work,
      'title': <String, dynamic>{'Opportunity': null},
      'subtitle': {
        "Placement": PlacementClass(),
        'Technology': const TechnologyClass(),
        'Testimonials': const TestimonialsClass(),
        'Resumes': const Resume_Class(),
      }
    },
    {
      'icon': Icons.help,
      'title': <String, dynamic>{'FAQs': const FaqClass()},
    },
    {
      'icon': Icons.people,
      'title': <String, dynamic>{'IO list': const ImplementingClass()},
    },
    {
      'icon': Icons.add_card_sharp,
      'title': <String, dynamic>{'Companies': const CompanyClass()},
    },
    {
      'icon': Icons.settings,
      'title': <String, dynamic>{'Site Settings': null},
      "subtitle": {
        "Home": HomeWidget(),
        "Collage List": CollegeList(),
        "Addon Setting": AddonSetting(),
        "Report Update": ReportUpdateClass(),
        "Privacy Policy": PrivacyPolicyPage(),
      }
    }
  ];
  Map<String, dynamic> user = {
    'firstName': 'Munish',
    'lastName': 'Ratti',
    'profileImage': null,
    'center': 'C-DAC, Mohali',
    'center type': 'PMU',
    'profile': AdminLoginPage(
      selectedButtonName: 'Admin Proflie',
      bodyWidget: const AdminParticipatingRegs(
        isHeaderRequied: false,
      ),
    )
  };
  @override
  Widget build(BuildContext context) {
    LoginPageFormat.bodyWidget = widget.bodyWidget;
    LoginPageFormat.selectedButtonName = widget.selectedButtonName;
    return LoginPageFormat(
      menuItems: menuItems,
      user: user,
    );
  }
}
