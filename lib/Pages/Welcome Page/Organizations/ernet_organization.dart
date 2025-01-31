import 'package:flutter/material.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_organizations.dart';

class ErnetOrganization extends StatelessWidget {
  ErnetOrganization({super.key});

  final Map<String, dynamic> ernetData = {
    "organizationName": "Education and Research Network of India (ERNET India)",
    "organizationNameShortForm": "ERNET",
    "description":
        'Education and Research Network of India (ERNET India) is an autonomous scientific society under the aegis of Ministry of Electronics and Information Technology, Government of India providing cutting edge ICT technology to education and research institutions. ERNET India made a significant contribution to the emergence of networking in the country. ERNET started as an UNDP sponsored project and   brought internet to India way back in 1986 and since then supported in building national capabilities in the area of networking. It is dedicated to facilitate ICT needs of the education and research community and stake holders and also supported creation of pool of strongly trained manpower.',
    "logoPath": 'assets/images/ERNET2.png',
    "keyProjects": [
      'Domain Registration',
      'Web-hosting',
      'Setting up of smart virtual class room and high resolution e-class room for medical colleges and hospitals, eduroam, campus WiFi for universities/research institutes',
      'VSAT connectivity to mainland India and in North-Eastern part of India, Union Territory of Andaman & Nicobar Islands and Lakshadweep',
      'Research and development in newer areas like Quantum Communication, Tactile Internet, Optical Wireless Communication, Internet of Things, Virtual Reality, Augmented reality (AR) & Artificial Intelligence (AI) etc.'
    ],
    "branches": [
      'Delhi',
      'Chennai',
      'Bangalore',
    ],
    "nodalOfficerName": 'Dr. A Paventhan',
    "nodalOfficerPosition": 'Director (R&D), ERNET',
    "nodalOfficerEmail": 'paventhan@eis.ernet.in',
    "organizationImagePath": 'assets/images/ERNET2.png',
    "organizationUrl":
        'https://x.com/ERNET_India?ref_src=twsrc%5Etfw%7Ctwcamp%5Eembeddedtimeline%7Ctwterm%5Escreen-name%3AERNET_India%7Ctwcon%5Es2',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: MyWelcomeOrganizations(
          organizationName: ernetData["organizationName"],
          organizationNameShortForm: ernetData["organizationNameShortForm"],
          description: ernetData["description"],
          logoPath: ernetData["logoPath"],
          keyProjects: List<String>.from(ernetData["keyProjects"]),
          branches: List<String>.from(ernetData["branches"]),
          nodalOfficerName: ernetData["nodalOfficerName"],
          nodalOfficerPosition: ernetData["nodalOfficerPosition"],
          nodalOfficerEmail: ernetData["nodalOfficerEmail"],
          organizationImagePath: ernetData["organizationImagePath"],
          organizationUrl: ernetData["organizationUrl"],
        ),
      ),
    );
  }
}
