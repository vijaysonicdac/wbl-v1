import 'package:flutter/material.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_organization_for_stqc.dart';

class StqcOrganization extends StatelessWidget {
  StqcOrganization({super.key});

  final Map<String, dynamic> stqcData = {
    "organizationName":
        "Standardisation Testing and Quality Certification Directorate (STQC)",
    "organizationNameShortForm": "STQC",
    "description":
        'Standardisation Testing and Quality Certification (STQC) Directorate, an attached office of the Ministry of Electronics and Information Technology, Government of India, provides quality assurance services in the area of Electronics and IT through countrywide network of laboratories and centres. The services include Testing, Calibration, IT & e-Governance, Training and Certification having National / International accreditation and recognitions in the area of e-Governance assurance, training and certification services. Besides a network of ERTLs and ETDCs which are primarily engaged in testing and calibration services, STQC has specialized institutions such as Indian Institute of Quality Management (IIQM) for quality related training programmes and Centre for Reliability (CFR) for reliability related services. STQC provides Software Products/Systems and Process Assurance Services under IT & e-Governance by conducting Testing, Audit and Training Certification including assurance service domain',
    "logoPath": 'assets/images/STQC1.png',
    "aboutPoints": [
      "Testing for Safety of Electronics/Electrical products",
      "Environmental Testing",
      "Equipment/subsystem and module testing",
      "High Precision Calibration",
    ],
    "keyProjectSections": {
      'IT Testing / e-Governance Assurance Services': [
        'Software Functional Testing',
        'Application Performance Testing',
        'Application Security Testing',
        'Vulnerability Assessment & Penetration Testing (VAPT)',
        'Acceptance Testing of e-Governance Projects',
        'Independent Verification and Validation of Defence Projects',
        'Usability Testing',
        'Accessibility Testing',
        'Embedded Device/Software Security Testing',
        'Secure Code Review',
      ],
      'Product Certification Services': [
        'IOT system Certification',
        'Common Criteria (CC) evaluation for IT Products',
        'e-Procurement System Certification',
        'Biometric device certification',
        'Website quality Certification based on GIGW Guidelines',
        'Smart card testing and certification',
        'QR Code Scanner testing and certification',
        'NCMC Certification',
        'S Mark Certification',
      ],
      'Electronics Testing Services': [
        'Testing for Safety of Electronics/Electrical products',
        'Environmental Testing',
        'Equipment/subsystem and module testing',
        'Power / Energy meter Testing',
        'EMI/EMC testing',
        'Opto Electronics Component Testing of SMDs (passive and active, VLSI devices)',
        'Medical Electronics equipment testing',
        'EVM / VVPAT Testing',
      ],
      'Calibration Services': [
        'High Precision Calibration',
        'RF Calibration',
        'Optical Calibration',
        'EMI/EMC Calibration',
        'Precision Temperature and Resistance Calibration',
        'Biomedical equipment calibration',
      ],
      'Management System Certification Process Services': [
        'Information Security Management System (ISMS)',
        'ISO/IEC 27001',
        'Service Level Agreement (SLA) Audit',
        'Infrastructure Audit of Data Center/DR Site',
        'Quality Management System (QMS) ISO 9001',
      ],
      'Capacity Building': [
        'NBQP Accredited Lead Auditor training course for QMS (ISO 9001:2015)',
        'NBQP Accredited Lead Auditor training course for ISMS (ISO 27001:2021)',
        'NBQP Accredited Laboratory QMS and Internal Audit as per ISO 17025:2017',
      ],
    },
    "branches": [
      'Currently, STQC centres are located at Delhi, Kolkata, Mumbai, Thiruvananthapuram, Chennai, Bangalore, Hyderabad, Jaipur, Mohali, Solan, Ajmer, Guwahati, Agartala, Pune and Goa.'
    ],
    "nodalOfficerName": 'Shri Amit Tyagi',
    "nodalOfficerPosition": 'Scientist ‘D’',
    "nodalOfficerEmail": 'amit@stqc.gov.in',
    "organizationImagePath": 'assets/images/STQC1.png',
    "organizationUrl":
        'https://x.com/GoI_STQC?ref_src=twsrc%5Etfw%7Ctwcamp%5Eembeddedtimeline%7Ctwterm%5Escreen-name%3AGoI_STQC%7Ctwcon%5Es2',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: MyWelcomeOrganizationForStqc(
          organizationName: stqcData["organizationName"],
          organizationNameShortForm: stqcData["organizationNameShortForm"],
          description: stqcData["description"],
          logoPath: stqcData["logoPath"],
          aboutPoints: List<String>.from(stqcData["aboutPoints"]),
          keyProjectSections:
              Map<String, List<String>>.from(stqcData["keyProjectSections"]),
          branches: List<String>.from(stqcData["branches"]),
          nodalOfficerName: stqcData["nodalOfficerName"],
          nodalOfficerPosition: stqcData["nodalOfficerPosition"],
          nodalOfficerEmail: stqcData["nodalOfficerEmail"],
          organizationImagePath: stqcData["organizationImagePath"],
          organizationUrl: stqcData["organizationUrl"],
        ),
      ),
    );
  }
}
