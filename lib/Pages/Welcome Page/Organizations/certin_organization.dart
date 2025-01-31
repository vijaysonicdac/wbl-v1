import 'package:flutter/material.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_organization_for_certin.dart';

class CertinOrganization extends StatelessWidget {
  CertinOrganization({super.key});

  final Map<String, dynamic> certinData = {
    "organizationName": "Computer Emergency Response Team (CERT-in)",
    "organizationNameShortForm": "CERT-in",
    "description":
        "The Indian Computer Emergency Response Team (CERT-In) is a Government organisation under the Ministry of Electronics and Information Technology, Government of India. CERT-In has been designated under Section 70B of the Information Technology Act, 2000 to serve as the national agency to perform the following functions in the area of cyber security:",
    "aboutPoints": [
      "Collection, analysis and dissemination of information on cyber security incidents",
      "Forecast and alerts of cyber security incidents",
      "Emergency measures for handling cyber security incidents",
      "Coordination of cyber security incident response activities",
      "Issue guidelines, advisories, vulnerability notes and white papers relating to information security practices, procedures, prevention, response and reporting of cyber incidents",
      "Such other functions relating to cyber security as may be prescribed",
    ],
    "logoPath": 'assets/images/Certin2.png',
    "keyProjects": [
      "Cyber Swachhta Kendra (www.csk.gov.in)",
      "National Cyber Coordination Centre (NCCC)",
      "Cyber Threat Intelligence Sharing Platform",
      "Cyber Abhyas Suvidha (CAS) Advanced Skill Development Platform",
    ],
    "branches": [
      "Indian Computer Emergency Response Team (CERT-In) Electronics Niketan, 6, CGO Complex, Lodhi Road, New Delhi - 110 003",
      "Indian Computer Emergency Response Team (CERT-In) 7th Floor, Tower B, Delhi IT Park, Shastri Park, New Delhi-110053",
    ],
    "nodalOfficerName": "Mr. V. V. Rao",
    "nodalOfficerPosition": "Scientist ‘E’",
    "nodalOfficerEmail": "rao.vv@meity.gov.in",
    "organizationImagePath": 'assets/images/Certin2.png',
    "organizationUrl": 'https://x.com/IndianCERT?ref_src=twsrc%5Etfw',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: MyWelcomeOrganizationForCertin(
          organizationName: certinData["organizationName"],
          organizationNameShortForm: certinData["organizationNameShortForm"],
          description: certinData["description"],
          aboutPoints: List<String>.from(certinData["aboutPoints"]),
          logoPath: certinData["logoPath"],
          keyProjects: List<String>.from(certinData["keyProjects"]),
          branches: List<String>.from(certinData["branches"]),
          nodalOfficerName: certinData["nodalOfficerName"],
          nodalOfficerPosition: certinData["nodalOfficerPosition"],
          nodalOfficerEmail: certinData["nodalOfficerEmail"],
          organizationImagePath: certinData["organizationImagePath"],
          organizationUrl: certinData["organizationUrl"],
        ),
      ),
    );
  }
}
