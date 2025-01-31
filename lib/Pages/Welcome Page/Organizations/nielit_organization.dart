import 'package:flutter/material.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_organizations.dart';

class NielitOrganization extends StatelessWidget {
  NielitOrganization({super.key});

  final Map<String, dynamic> nielitData = {
    "organizationName": "National Institute of Electronics and Information Technology (NIELIT)",
    "organizationNameShortForm": "NIELIT",
    "description":
        'National Institute of Electronics and Information Technology (NIELIT) is an autonomous scientific body under the administrative control of the Ministry of Electronics & Information Technology (MeitY), Government of India and has its presence at 53 locations across India, which are offering Degree/Diploma and Skill Oriented courses in the area of Information, Electronics and Communication Technology (IECT). NIELIT is delivering industry-oriented quality education and training programmes in various relevant and emerging areas including Hardware, Cyberlaw, Cyber Security, Cloud Computing, IT, GIS, Blockchain, Electronic System Design & Manufacturing (ESDM), e-Governance and related verticals. The SC/ST students are also benefitted as the training for such candidates is provided free of cost under various schemes of MeitY mostly in Tier-II /III cities NIELIT is also working hard to become the talent enabler to support the vision of the Government, poising India to become a Trillion-dollar digital economy by the next decade, as the next decade is going to be the tech-ade for India. NIELIT is also one of the National Examination Body conducting national level examinations.',
    "logoPath": 'assets/images/NIELIT2.png',
    "keyProjects": [
      'NIELIT-CII Centre of Excellence for Skills (NICCS)',
      'Setting up State of Art Digital Forensic Data Centre to provide forensic services Including remote forensics live acquisition and analysis of digital evidence, Virtual Training Services to NE States',
      'Empowerment of SC/ ST Youth & Women on Enhancement of Livelihood activities using IT & Tool and PMU for IT for Masses',
      'Training of Visually Impaired Persons in Manipur on Course on Computer Concepts (CCC) of NIELIT',
      'Skill Development Training of Unemployed SC & ST youths of Tripura towards enabling entrepreneurship & sustainable development',
      'Setting up of Medical Electronics Laboratory at Silchar Extension Centre of (NIELIT) Guwahati',
      'Indigenous Color Doppler Ultrasound Scanner with PNDT Compliance',
      'Enhancement of livelihood activities for SC candidates of Delhi NCR through Capacity Building using ICT',
      'Skill Training for Empowering SC/ST in Kerala & Karnataka',
      'Blended Learning framework Under Future Skills \'PRIME\' through NIELIT and C-DAC centre',
      'Awareness Campaigns/Events for empowerment of Senior Citizens in e-Services through ICT Tools',
      'Skill Development of youths in Aspirational Districts in the area of IECT leading to enhancement in Employability',
      'Development of Cyber Forensic Training cum Investigation Labs in North-Eastern States and Cloud based centralized Cyber Forensics Lab Infrastructures',
      'IT enabled Incubation Centre for Handloom and Handicraft Sector',
      'Capacity Building and Training in Emerging Technologies for Enhancing Employment Opportunities and Skilling',
      'Digital Intervention of Handloom and Handicraft Sector for Livelihood enhancement of artisans of NE States',
      'Self-employment Capacity building of the Engineering pass-out students belonging to Scheduled Caste/Scheduled Tribe community',
      'Capacity Building for unemployed ST youths of Manipur in Assembly and Repair & Maintenance of Solar Lighting system, Household Electronics/Electrical & IoT Devices NIELIT (Senapati), Imphal',
      'Capacity Building in IECT including training in Digital Skill sets and Current Industry Demanding Technologies for various sections of society in the NE States',
      'ICT intervention in Travel & Tourism (T&T) Industry Through Capacity Building in New Age Digital Technologies',
      'Imitative for Cyber Security Aware Society in NE States',
      'Work Based Learning (WBL) programme to Strengthen and Empower SC/ST/Women/EWS Graduates Engineers through MeitY Institutions',
      'Creation of IT industries ready Software professional in Manipur for unemployed Graduate/Diploma holders in Manipur through awareness, motivation and Experts training',
      'Design and Development of EEG Based Real-Time Depth of Anaesthesia (DoA) Monitoring System',
      'Capacity Building and Training on Cutting-edge technologies for employable youth of Tripura',
      'Mission-“Awareness Vriddhi and Training for Urban Cooperative Banks”'
    ],
    "branches": [
      'Currently, NIELIT is having 47 nos of own centres located at Agartala, Aizawl, Ajmer, Aurangabad, Bhubaneswar, Buxar, Calicut, Chandigarh, Chennai, Chuchuyimlang, Churachandpur, Daman, Delhi, Dibrugarh, Dimapur, Gangtok, Gorakhpur, Guwahati, Haridwar, Imphal, Itanagar, Jammu, Jorhat, Kargil, Kohima, Kolkata, Kokrajhar, Kurukshetra, Leh, Lucknow, Lunglei, Majuli, Mandi, Muzaffarpur, Pasighat, Patna, Pali, Ranchi, Ropar, Senapati, Shillong, Shimla, Silchar, Srinagar, Tezpur, Tura and Tezu with its Headquarters at New Delhi.  NIELIT is also having a network of 700+ Accredited Training Partners and 4,100+ facilitation centres across the nation.'
    ],
    "nodalOfficerName": 'Sh. Hirdesh Sihare',
    "nodalOfficerPosition": 'Nodal Officer',
    "nodalOfficerEmail": 'h.sihare@nielit.gov.in',
    "organizationImagePath": 'assets/images/NIELIT2.png',
    "organizationUrl": 'https://x.com/NIELITIndia?ref_src=twsrc%5Etfw',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: MyWelcomeOrganizations(
          organizationName: nielitData["organizationName"],
          organizationNameShortForm: nielitData["organizationNameShortForm"],
          description: nielitData["description"],
          logoPath: nielitData["logoPath"],
          keyProjects: List<String>.from(nielitData["keyProjects"]),
          branches: List<String>.from(nielitData["branches"]),
          nodalOfficerName: nielitData["nodalOfficerName"],
          nodalOfficerPosition: nielitData["nodalOfficerPosition"],
          nodalOfficerEmail: nielitData["nodalOfficerEmail"],
          organizationImagePath: nielitData["organizationImagePath"],
          organizationUrl: nielitData["organizationUrl"],
        ),
      ),
    );
  }
}
