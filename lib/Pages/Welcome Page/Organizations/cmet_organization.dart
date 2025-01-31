import 'package:flutter/material.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_organizations.dart';

class CmetOrganization extends StatelessWidget {
  CmetOrganization({super.key});

  final Map<String, dynamic> cmetData = {
    "organizationName": "Centre for Materials for Electronics Technology (C-MET)",
    "organizationNameShortForm": "CMET",
    "description":
        "Dedicated to the furtherance of competent research and development in the firmament of Electronic Materials, the Centre for Materials for Electronics Technology (C-MET) functions as an autonomous scientific society under Ministry of Electronics & Information Technology (MeitY), Govt. of India. Besides augmenting core competence, C-MET envisions attainment of self-sufficiency in the sphere of Electronic materials, components and devices to cater to India’s strategic and industrial applications, exploiting indigenous resources of raw materials.",
    "logoPath": 'assets/images/cmet-logo.png',
    "keyProjects": [
      'Integrated Electronics Packaging',
      'Li-ion Battery',
      'Additive Manufacturing',
      'Nanomaterials and Devices',
      'Materials for Renewable Energy',
      'Piezo - sensors and Actuators',
    ],
    "branches": [
      'Centre for Materials for Electronics Technology (C-MET) Panchawati, Pashan Road Pune: 411 008',
    ],
    "nodalOfficerName": 'R Marimuthu',
    "nodalOfficerPosition": 'Scientist ‘D’',
    "nodalOfficerEmail": 'marimuthu@cmet.gov.in',
    "organizationImagePath": 'assets/images/cmet-logo.png',
    "organizationUrl":
        'https://x.com/cmetindia?ref_src=twsrc%5Etfw%7Ctwcamp%5Eembeddedtimeline%7Ctwterm%5Escreen-name%3Acmetindia%7Ctwcon%5Es2',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: MyWelcomeOrganizations(
          organizationName: cmetData["organizationName"],
          organizationNameShortForm: cmetData["organizationNameShortForm"],
          description: cmetData["description"],
          logoPath: cmetData["logoPath"],
          keyProjects: List<String>.from(cmetData["keyProjects"]),
          branches: List<String>.from(cmetData["branches"]),
          nodalOfficerName: cmetData["nodalOfficerName"],
          nodalOfficerPosition: cmetData["nodalOfficerPosition"],
          nodalOfficerEmail: cmetData["nodalOfficerEmail"],
          organizationImagePath: cmetData["organizationImagePath"],
          organizationUrl: cmetData["organizationUrl"],
        ),
      ),
    );
  }
}
