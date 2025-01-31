import 'package:flutter/material.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_organizations.dart';

class CdacOrganization extends StatelessWidget {
  CdacOrganization({super.key});

  final Map<String, dynamic> cdacData = {
    "organizationName": "Centre for Development of Advanced Computing (C-DAC)",
    "organizationNameShortForm": "C-DAC",
    "description":
        "Centre for Development of Advanced Computing (C-DAC) is the premier R&D organization of the Ministry of Electronics and Information Technology (MeitY) for carrying out R&D in IT, Electronics and associated areas. Different areas of C-DAC, had originated at different times, many of which came out as a result of identification of opportunities. The setting up of C-DAC in 1988 itself was to build Supercomputers in context of denial of import of Supercomputers by USA. Since then C-DAC has been undertaking building of multiple generations of Supercomputer starting from PARAM with 1 GF in 1988.",
    "logoPath": 'assets/images/cdacLogo.png',
    "keyProjects": [
      'eSanjeevani (National Telemedicine Service)',
      'Emergency Response Support System (ERSS)',
      'eSign Service',
      'PMG DISHA',
      'e-Pramaan 2.0: Authentication Enhanced',
      'Mobile Seva – National Rollout of the Mobile Services Delivery Gateway',
      'National Appstore',
      'Mobile e-governance Service Delivery Gateway–III',
      'Technology Mediated Delivery of e-courses in Medical Science Education for NER Medical Colleges',
      'Online labs(Olabs) for schools',
      'Facilitating Skill Development and Enhancing Employability in IT-ITeS Sector for SC/ST Candidates',
      'Cyber CLOSET',
      'Design and Development of Quantum Computing Toolkit (Simulator, Workbench) and Capacity Building',
      'Design and Development of a Unified Blockchain Framework for offering National Blockchain Service and creation of Ecosystem',
      'Development & Implementation of Services eHealth Assistance and Teleconsultation (SeHAT)',
      'Development of Web-based Integrated Workflow System (iWS) for CARICOM Secretariat, Guyana',
      'Digitization of Manuscript including Repository and Retrieval System for Acharya Jogesh Chandra Purakriti Bhaban (District Museum) Bishnupur, Bankura, West Bengal',
      'Web-based Integrated Information Management and Digitization of Old Records Including Retrieval System for Special Branch, Kolkata Police',
      'Digitization of Rare Books including Repository & Retrieval System and Portal for West Bengal Secretariat Library',
      'Nation-Wide Rapid Rollout of Honeypot Threat Sensors',
      'Development & Maintenance of Web Portal for Design Submission Package to Chip Centre under SMDP-C2SD',
      'Design, Development & Implementation of Web Portal and Project Management System for ‘Chips to Startup (C2S) Programme’',
      'A Brain Machine Interface enabled Assistive System for children with special needs',
      'A Multi-Model Neuro-Physiological Framework for Behaviour Analysis',
      'Cyber Security Training Centre at National Defence University in Ulaanbaatar, Mongolia',
      'Loan & Recovery Software',
      'Online National Drug Licensing System',
      'SUGAM 2.0 - e-Governance Solution for CDSCO',
      'Design and Deployment of IOT Based Hydroponics System for Agri-Research in North East Region',
      'Online system for Medical Devices Regulatory Processes for CDSCO',
      '\'ARJUN\', ADIP - Web Portal for Empowerment of Persons with Disabilities (Divyangjan)',
      'Development of Multi-modal Analytics framework for Machine-assisted diagnosis of pediatric pneumonia',
      'Shaala Darpan – End to End School Management System',
      'Adverse Drug Reactions Monitoring System',
      'Drug and Vaccine Distribution Management System (DVDMS)',
      'Human Resource Management System (eHRMS)',
      'Setting up of Cyber Forensics Laboratory Cum Training Lab, State of Arunachal Pradesh',
      'Security Audit, SSL Certification, and Hosting of the Website of NID, Assam',
      'Multilingual Website: Development of Bilingual National Institute of Design Assam Website',
      'Cyber Security Audit :Vulnerability and Penetration Testing at NERLDC Shillong, and Guwahati Office',
      'ICT Solution for India’s Northeast Heritage',
      'JKPWDMS',
      'India - Syria NexGen Centre of Excellence in IT at National Agency for Network Services in Damascus',
      'India - Namibia Centre of Excellence in IT at Namibia University of Science & Technology',
      'Developing Data Science Framework, Architecture and Methodology for Fraud Detection in ATM Transactions in Banks',
      'MANAS – Mental Health and Normalcy Augmentation System',
      'Internet Governance - Structured Implementation Module',
      'Operation and Management of Centre for e-Governance',
      'and many more...',
    ],
    "branches": [
      'Currently, C-DAC centres are located at Bengaluru, Chennai, Delhi, Hyderabad, Kolkata, Mohali, Mumbai, Noida, Patna, Pune, Silchar, Thiruvananthapuram.'
    ],
    "nodalOfficerName": "Mr. Munish Ratti",
    "nodalOfficerPosition": "Principal Engineer",
    "nodalOfficerEmail": "munishratti@cdac.in",
    "organizationImagePath": 'assets/images/cdacLogo.png',
    "organizationUrl": 'https://x.com/cdacindia?ref_src=twsrc%5Etfw',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: MyWelcomeOrganizations(
          organizationName: cdacData["organizationName"],
          organizationNameShortForm: cdacData["organizationNameShortForm"],
          description: cdacData["description"],
          logoPath: cdacData["logoPath"],
          keyProjects: List<String>.from(cdacData["keyProjects"]),
          branches: List<String>.from(cdacData["branches"]),
          nodalOfficerName: cdacData["nodalOfficerName"],
          nodalOfficerPosition: cdacData["nodalOfficerPosition"],
          nodalOfficerEmail: cdacData["nodalOfficerEmail"],
          organizationImagePath: cdacData["organizationImagePath"],
          organizationUrl: cdacData["organizationUrl"],
        ),
      ),
    );
  }
}
