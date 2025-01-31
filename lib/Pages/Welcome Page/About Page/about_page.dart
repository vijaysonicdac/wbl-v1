import 'package:flutter/material.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_footer.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_header.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_unordered_list.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MyWelcomeHeader(),
            // Background color container
            Container(
              color: const Color(0xffF0F9FA),
              child: Column(
                children: [
                  Stack(
                    children: [
                      // Background Image
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/aboutbgimg.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Centered content: Text and underline
                      Positioned.fill(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'About',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Image.asset('assets/images/Vector1.png'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(screenWidth * .03),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 207, 204, 204),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.symmetric(
                        horizontal: screenWidth * .1,
                        vertical: screenWidth * .03),
                    child: Column(
                      children: [
                        screenWidth < 750
                            ? Column(
                                children: [
                                  Image.asset(
                                    'assets/images/wblLogo.png',
                                    width: 100,
                                    height: 100,
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'The Work-Based Learning (WBL) programme (of Ministry of Electronics and IT , Govt. of India) is designed for fresh Graduate Engineers of Scheduled Caste (SC), Scheduled Tribe (ST), Women and Economically Weaker Section (EWS), to gain practical experience and exposure in Information Technology, Electronics and related areas. The programme will be implemented across seven MeitY organizations and aims to provide technical knowledge expansion, real-time working skills, problem-solving skills, and interpersonal skills. The scheme is expected to benefit a total of 4,530 SC/ST and Women/EWS candidates over five years. The identified candidates will be deployed under 81 units of the Ministry of Electronics and IT (MeitY) organizations namely C-DAC, CERT-In, CMET, ERNET, NIELIT, STQC and SAMEER.',
                                    style: TextStyle(color: Color(0xff5A5A72)),
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              )
                            : Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/images/wblLogo.png',
                                    width: 100,
                                    height: 100,
                                  ),
                                  const SizedBox(width: 10),
                                  const Expanded(
                                    flex: 5,
                                    child: Text(
                                      'The Work-Based Learning (WBL) programme (of Ministry of Electronics and IT , Govt. of India) is designed for fresh Graduate Engineers of Scheduled Caste (SC), Scheduled Tribe (ST), Women and Economically Weaker Section (EWS), to gain practical experience and exposure in Information Technology, Electronics and related areas. The programme will be implemented across seven MeitY organizations and aims to provide technical knowledge expansion, real-time working skills, problem-solving skills, and interpersonal skills. The scheme is expected to benefit a total of 4,530 SC/ST and Women/EWS candidates over five years. The identified candidates will be deployed under 81 units of the Ministry of Electronics and IT (MeitY) organizations namely C-DAC, CERT-In, CMET, ERNET, NIELIT, STQC and SAMEER.',
                                      style:
                                          TextStyle(color: Color(0xff5A5A72)),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ],
                              ),
                        const SizedBox(height: 20),
                        const Text(
                          'The programme\'s envisaged deliverables and outcomes for a period of five years (starting 2022) are to benefit a total of 4,530 Work-Based Learning (WBL) beneficiaries. The selected/identified candidates will be deployed at various branches of MeitY organizations. The programme\'s implementation is expected to bridge the skills gap and empower marginalized candidates to gain experience and be better equipped to participate in the rapidly advancing fields of IT and Electronics.',
                          style: TextStyle(color: Color(0xff5A5A72)),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Objective',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'The main objective of this programme is to provide an opportunity to SC/ST/EWS/Women candidates to acquire Technical Knowledge Expansion; Real-time Working Skills; Technology Use; Problem Solving Skills; Reasoning; Ideation; Analytical Thinking; Interpersonal Skills, etc. in a professional work environment. This programme would also aim to achieve the following objectives:',
                          style: TextStyle(color: Color(0xff5A5A72)),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 20),
                        screenWidth < 1050
                            ? Column(
                                children: [
                                  // Centered image for narrow screens
                                  Center(
                                    child: Image.asset(
                                      'assets/images/aboutObjective.png',
                                      width: 300,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(
                                      height:
                                          20), // Spacing between image and text

                                  // List of objectives for narrow screens
                                  _buildNumberedObjective(
                                      'assets/images/one.png',
                                      'To facilitate SC/ ST/ EWS/ Women candidates for transition from college environment to the corporate world, and thereby provide them with a real-time exposure on niche technological project/ activity in organizations under MeitY. '),
                                  const SizedBox(height: 10),
                                  _buildNumberedObjective(
                                      'assets/images/two.png',
                                      'To provide direct practical experience and exposure to Fresh Graduates Engineers on Niche Technologies thereby reducing the “deployable time” for both the candidate, as well as the prospective employer.'),
                                  const SizedBox(height: 10),
                                  _buildNumberedObjective(
                                      'assets/images/three.png',
                                      'To help candidates attain stability between theoretical studies and realistic job exposure through hands-on expertise in Design/Developmental Skills, Requirement Analysis, Testing skills, Exposure to Standardization/QA etc.'),
                                  const SizedBox(height: 10),
                                  _buildNumberedObjective(
                                      'assets/images/four.png',
                                      'To enhance professional skills among the candidates in various areas such as problem-solving abilities; communication skills; presentation skills, confidence enhancement, individual grooming, enterprise etiquettes, etc.'),
                                  const SizedBox(height: 10),
                                  _buildNumberedObjective(
                                      'assets/images/five.png',
                                      'To facilitate MeitY Organizations to infuse fresh thoughts/ Ideation/ value-additions in Emerging Technical domains; considering that the candidates would also leverage their updated knowledge base in the assigned Work Activities.'),
                                ],
                              )
                            : Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // The large image for wider screens
                                  Expanded(
                                    flex: 2,
                                    child: Image.asset(
                                      'assets/images/aboutObjective.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(
                                      width:
                                          20), // Spacing between image and text

                                  // List of objectives for wider screens
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _buildNumberedObjective(
                                            'assets/images/one.png',
                                            'To facilitate SC/ ST/ EWS/ Women candidates for transition from college environment to the corporate world, and thereby provide them with a real-time exposure on niche technological project/ activity in organizations under MeitY. '),
                                        const SizedBox(height: 10),
                                        _buildNumberedObjective(
                                            'assets/images/two.png',
                                            'To provide direct practical experience and exposure to Fresh Graduates Engineers on Niche Technologies thereby reducing the “deployable time” for both the candidate, as well as the prospective employer.'),
                                        const SizedBox(height: 10),
                                        _buildNumberedObjective(
                                            'assets/images/three.png',
                                            'To help candidates attain stability between theoretical studies and realistic job exposure through hands-on expertise in Design/Developmental Skills, Requirement Analysis, Testing skills, Exposure to Standardization/QA etc.'),
                                        const SizedBox(height: 10),
                                        _buildNumberedObjective(
                                            'assets/images/four.png',
                                            'To enhance professional skills among the candidates in various areas such as problem-solving abilities; communication skills; presentation skills, confidence enhancement, individual grooming, enterprise etiquettes, etc.'),
                                        const SizedBox(height: 10),
                                        _buildNumberedObjective(
                                            'assets/images/five.png',
                                            'To facilitate MeitY Organizations to infuse fresh thoughts/ Ideation/ value-additions in Emerging Technical domains; considering that the candidates would also leverage their updated knowledge base in the assigned Work Activities.'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                        const SizedBox(height: 20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Technology Areas',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'The constituent organizations of Ministry of Electronics & Information Technology (MeitY) are technical / scientific organizations and the Implementing Organizations (IO)  namely C-DAC, CERT-In, CMET, ERNET, NIELIT, STQC and SAMEER identified under the programme are working in the areas of niche / emerging technologies and related fields. This programme is expected to leverage the technical expertise of above mentioned MeitY organizations on one hand and the updated knowledge base on fresh graduate engineers on the other hand, which is envisaged to provide a fillip to the employability quotient of SC/ST/EWS/Women candidates.',
                          style: TextStyle(color: Color(0xff5A5A72)),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Some of the key technologies that can be leveraged under the programme are: Artificial Intelligence (AI) and Machine Learning, Robotic Process Automation (RPA), Quantum Computing, Augmented Reality & Virtual Reality (AR & VR), Blockchain, Wireless Networks (5G, WiFi 6 etc.), Smart Mobility (Including Vehicular and Drone Technology), Internet of Things (IoT), Cyber Security and Cyber Forensics, Big Data Analytics, Digital Preservation, Cloud Computing, 3D Printing, Silicon Photonics, Flexible Electronics, Emerging Memory/ Storage Technologies, Machine vision (MV), Software-Defined Radio, CPU Design, Testing/QA Methodology, Standards/Certification in Emerging Technologies, Rechargeable Battery Technology, e-Waste Management, Smart City, Health Informatics, Language Computing, Robotics, Edge Computing, Brain Computing etc.',
                          style: TextStyle(color: Color(0xff5A5A72)),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Area of work / activities in the organization can include specific / targeted project work, capability building initiatives, design-based activities, developmental activities, research-based activities, etc. Exposure of candidates in the domain of Information Technology and Electronics would provide a significant mileage to gain hand-on expertise over theory and make them more job ready.',
                          style: TextStyle(color: Color(0xff5A5A72)),
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Process and Implementation',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          '81 Centres or Units of the Implementing Organizations (IO) would act as Participating Institutes (PI) while C-DAC Mohali would act as the Programme Management Unit (PMU) for the overall scheme monitoring and implementation. Subsequent to the Admission/Selection and Centre Allotment by Implementing Organization (IO)/ Participating Institute (PI), the overall WBL programme are to be implemented in two levels. The Level-1 WBL is of 6-month duration involving various phases.',
                          style: TextStyle(color: Color(0xff5A5A72)),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'For the candidate to continue to Level-2, he/she needs to complete the review and selection by Technical Monitoring and Evaluation Committee (Tech-MEC) constituted by the PI. Maximum of 50% candidates who have completed Level-01 WBL of previous batch would be selected to Level-02 WBL programme. Towards this aspect, maximum of 50% seats would be allocated during selection cycle by the IO/PI. In the Level-2 WBL, the candidate would essentially carryout Implementation/ development/ prototype and Documentation. This would be followed by Final review and Certification by the Tech-MEC committee.',
                          style: TextStyle(color: Color(0xff5A5A72)),
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                'Programme Management Unit (PMU)',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'While the centres (IOs through PIs) are responsible towards implementation of the project, a Programme Management Unit (PMU) at C-DAC Mohali would be responsible  towards  efficiently manage, implement and monitor the overall programme across multiple institutions. The following broad activities would be carried out by the Programme Management Unit (PMU) through a dedicated team for implementing the programme. This includes: ',
                          style: TextStyle(color: Color(0xff5A5A72)),
                        ),
                        const MyWelcomeUnorderedList(
                            listText:
                                'Overall Coordination, Management, and Monitoring of the programme.'),
                        const MyWelcomeUnorderedList(
                            listText:
                                'The PMU would prepare and issue necessary Guidelines and Standard Operating Procedures (SOP) for overall implementation of the project. This includes: '),
                        const MyWelcomeUnorderedList(
                            listText:
                                'Selection & Centre allocation Guideline involving WBL Eligibility for Level-01 and Level-02 programme, Selection for Level-01 by IO through AICTE Portal, Certificate verification process by PI/IO, Examination/Interview, Centre/Technology mapping etc. to be carried out by Implementing Organization (IO)'),
                        const MyWelcomeUnorderedList(
                            listText:
                                'WBL Implementation Guidelines involving Work Allocation, Monitoring/Review, Monthly Status Update & recommendation through MIS, Administration, Retention, Attendance, Candidate Discontinuation etc.'),
                        const MyWelcomeUnorderedList(
                            listText:
                                'Remuneration and Promotional Guidelines & SOP involving monitoring and management of timely Remuneration/Stipend payment, Regular and Timely MIS update by agencies, Promotional Activities and Expense Reimbursement, etc. as part of the scheme'),
                        const MyWelcomeUnorderedList(
                            listText:
                                'WBL Outcome/deliverable milestones in niche / emerging technical areas, Certification, Participant Record Maintenance/ Repository, and related aspects.'),
                        const MyWelcomeUnorderedList(
                            listText:
                                'Interact and liaise with all Implementing Organizations (Headquarters) and update the implementation of scheme to MeitY on a regular basis'),
                        const MyWelcomeUnorderedList(
                            listText:
                                'Guidelines and SOP to be released from time to time which directs IO in issual of the Stipend on regular basis to candidates.'),
                        const MyWelcomeUnorderedList(
                            listText:
                                'Necessary reimbursement to Implementing Organizations for Advocacy / Awareness as per guidelines issued'),
                        const MyWelcomeUnorderedList(
                            listText:
                                'Maintain repository of candidates and WBL details provided by centres'),
                        const MyWelcomeUnorderedList(
                            listText:
                                'Monitor the progress of centres and update MeitY on a regular basis'),
                        const MyWelcomeUnorderedList(
                            listText:
                                'Support MeitY in Fund disbursement, monitoring and management to centres and related financial activities.'),
                        const MyWelcomeUnorderedList(
                          listText:
                              'Ensure timely expenditure by implementing organizations and highlight progress of regular basis to MeitY, PRSG etc.',
                        ),
                        const SizedBox(height: 20),
                        screenWidth < 1050
                            ? Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          'Centre for Development of Advanced Computing (C-DAC)',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    'Centre for Development of Advanced Computing (C-DAC) is the premier R&D organization of the Ministry of Electronics and Information Technology (MeitY) for carrying out R&D in IT, Electronics and associated areas. Different areas of C-DAC, had originated at different times, many of which came out as a result of identification of opportunities. C-DAC has today emerged as a premier R&D organization in IT&E (Information Technologies and Electronics) in the country working on strengthening national technological capabilities in the context of global developments in the field and responding to change in the market need in selected foundation areas. In that process, C-DAC represents a unique facet working in close junction with MeitY to realize nation’s policy and pragmatic interventions and initiatives in Information Technology. As an institution for high-end Research and Development (R&D), C-DAC has been at the forefront of the Information Technology (IT) revolution, constantly building capacities in emerging/enabling technologies and innovating and leveraging its expertise, caliber, skill sets to develop and deploy IT products and solutions for different sectors of the economy, as per the mandate of its parent, the Ministry of Electronics and Information Technology, Ministry of Communications and Information Technology, Government of India and other stakeholders including funding agencies, collaborators, users and the market-place.',
                                    style: TextStyle(color: Color(0xff5A5A72)),
                                  ),
                                  // Centered image for narrow screens with limited width
                                  Center(
                                    child: Image.asset(
                                      'assets/images/aboutcdac.png',
                                      width: screenWidth *
                                          0.8, // Limit to 80% of screen width
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  const Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          10.0), // Added padding for text
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Centre for Development of Advanced Computing (C-DAC)',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Centre for Development of Advanced Computing (C-DAC) is the premier R&D organization of the Ministry of Electronics and Information Technology (MeitY) for carrying out R&D in IT, Electronics and associated areas. Different areas of C-DAC, had originated at different times, many of which came out as a result of identification of opportunities. C-DAC has today emerged as a premier R&D organization in IT&E (Information Technologies and Electronics) in the country working on strengthening national technological capabilities in the context of global developments in the field and responding to change in the market need in selected foundation areas. In that process, C-DAC represents a unique facet working in close junction with MeitY to realize nation’s policy and pragmatic interventions and initiatives in Information Technology. As an institution for high-end Research and Development (R&D), C-DAC has been at the forefront of the Information Technology (IT) revolution, constantly building capacities in emerging/enabling technologies and innovating and leveraging its expertise, caliber, skill sets to develop and deploy IT products and solutions for different sectors of the economy, as per the mandate of its parent, the Ministry of Electronics and Information Technology, Ministry of Communications and Information Technology, Government of India and other stakeholders including funding agencies, collaborators, users and the market-place.',
                                            style: TextStyle(
                                                color: Color(0xff5A5A72)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    flex: 2,
                                    child: Image.asset(
                                      'assets/images/aboutcdac.png',
                                      width: screenWidth *
                                          0.4, // Limit to 40% of screen width
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              ),
                        const SizedBox(height: 20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Funded By MeitY',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'The Ministry of Electronics and Information Technology (MeitY), an agency of the government of India, provides policy guidelines to all government and state public sector organizations. Its guidelines are also frequently adopted by private sector organizations in regulated industries, like financial services and telecommunications. MeitY provides accreditation (referred to by MeitY as \'empanelment\') of cloud service providers, which requires that cloud services be certified as compliant against a predefined set of standards and guidelines on security, interoperability, data portability, service level agreement, and contractual terms and conditions. Auditors accredited by MeitY verify compliance by conducting audits of cloud service providers.',
                          style: TextStyle(color: Color(0xff5A5A72)),
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Vision',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Expanded(
                              child: Text(
                                'e-Development of India as the engine for transition into a developed nation and an empowered society.',
                                style: TextStyle(color: Color(0xff5A5A72)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Mission',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'To promote e-Governance for empowering citizens, promoting the inclusive and sustainable growth of the Electronics, IT & ITeS industries, enhancing India’s role in Internet Governance, adopting a multipronged approach that includes development of human resources, promoting R&D and innovation, enhancing efficiency through digital services and ensuring a secure cyber space.',
                          style: TextStyle(color: Color(0xff5A5A72)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const MyWelcomeFooter(),
          ],
        ),
      ),
    );
  }

  // Helper method to create each numbered objective with image and text
  Widget _buildNumberedObjective(String imagePath, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imagePath,
          width: 80,
          height: 70,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            style: const TextStyle(color: Color(0xff5A5A72)),
            description,
            // style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
