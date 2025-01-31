import 'package:flutter/material.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_organizations.dart';

class SameerOrganization extends StatelessWidget {
  SameerOrganization({super.key});

  final Map<String, dynamic> sameerData = {
    "organizationName": "Society for Applied Microwave Electronics Engineering & Research (SAMEER)",
    "organizationNameShortForm": "SAMEER",
    "description":
        'Society for Applied Microwave Electronics Engineering & Research (SAMEER), is an autonomous R&D institution under Ministry of Electronics & Information Technology (MeitY), Government of India. SAMEER was set up as an autonomous R & D laboratory at Mumbai in 1984 under the then Department of Electronics, Government of India with a broad mandate to undertake R & D work in the areas of Microwave Engineering and Electromagnetic Engineering Technology. It is an offshoot of the special microwave products unit (SMPU) set up in 1977 at the TATA INSTITUTE OF FUNDAMENTAL RESEARCH (TIFR), Mumbai. In its five centers located at Mumbai, Chennai, Visakhapatnam, Guwahati and Kolkata, SAMEER pursues application-oriented research and development activities in the areas of Medical Linear Accelerator, RF and Microwave systems, Photonics, EMI/EMC Engineering, Antenna and Electromagnetics, Communications, Thermal Engineering, Radar Based Atmospheric Instrumentation and related software. SAMEER with focus on application-oriented R&D undertakes projects, customized product development and design consultancy in these specialized areas.',
    "logoPath": 'assets/images/Sameer2.png',
    "keyProjects": [
      '6G: Sub-THz Wireless Communication with IRS',
      '6G: THz Test bed with Orbital Angular Momentum and Multiplexing',
      'Indigenous 5G Test bed',
      '6 MV Medical Linear Accelerator',
      'Indigenous Magnetic Resonance Imaging',
      'EMI/EMC Services and Consultancy',
      'Establishment of MIL-STD EMC test Laboratory',
      'High Energy Based 99mTc Generation',
      'MST and ST Weather Radars',
      'Microwave Disinfection System',
      'Development of High power microwave components',
    ],
    "branches": [
      'Mumbai: SAMEER, Mumbai is pursuing research and development in the field of Opto-electronics, medical Electronics, Radar based instrumentation, Atmospheric remote sensing & Meteorology, RF & Microwave systems and components, Navigational electronics etc. Many of its R&D outputs and spin-offs have found applications and acceptance in industry.',
      'Chennai: SAMEER-CEM, Chennai is pursuing Research and Development, Consultancy, test and evaluation services in the areas of electromagnetics and antennas, EMI/EMC, communications and thermal management.',
      'Kolkata: SAMEER, Kolkata, is pursuing R&D activities in the area of antennas, electromagnetics, RF/Microwave components and subsystems.',
      'Visakhapatnam: SAMEER Centre for E3 has been pursuing its objective of doing Electromagnetic Environmental Effects (E3) Research, Development, Test, and Evaluation. The E3 facility specializes in a variety of capabilities, ranging from box level to complete system level testing.',
      'Guwahati: Guwahati Centre for High Power Microwave Tube & Component Technology (CHMTCT) under SAMEER, located in IIT Guwahati, Assam, has been started with specialization in area of high power microwave tube and component technology.',
    ],
    "nodalOfficerName": 'Shri Shri. S. N. Pethe',
    "nodalOfficerPosition": 'Scientist ‘F’',
    "nodalOfficerEmail": 'sanjay@sameer.gov.in',
    "organizationImagePath": 'assets/images/Sameer2.png',
    "organizationUrl": 'https://x.com/intent/follow?screen_name=SAMEER_RnD&ref_src=twsrc%5Etfw%7Ctwcamp%5Eembeddedtimeline%7Ctwterm%5Escreen-name%3ASAMEER_RnD%7Ctwcon%5Es2',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: MyWelcomeOrganizations(
          organizationName: sameerData["organizationName"],
          organizationNameShortForm: sameerData["organizationNameShortForm"],
          description: sameerData["description"],
          logoPath: sameerData["logoPath"],
          keyProjects: List<String>.from(sameerData["keyProjects"]),
          branches: List<String>.from(sameerData["branches"]),
          nodalOfficerName: sameerData["nodalOfficerName"],
          nodalOfficerPosition: sameerData["nodalOfficerPosition"],
          nodalOfficerEmail: sameerData["nodalOfficerEmail"],
          organizationImagePath: sameerData["organizationImagePath"],
          organizationUrl: sameerData["organizationUrl"],
        ),
      ),
    );
  }
}
