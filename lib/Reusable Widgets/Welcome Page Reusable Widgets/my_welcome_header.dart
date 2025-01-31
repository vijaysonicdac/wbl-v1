import 'package:flutter/material.dart';
import 'package:wbl/Pages/CMS%20Pages/cms_drawer.dart';
import 'package:wbl/Pages/Login%20Page/Enrollment%20Form/Admin%20Enrollment%20Form/participating_institution_registration.dart';
import 'package:wbl/Pages/Login%20Page/login_page.dart';
import 'package:wbl/Pages/Welcome%20Page/About%20Page/about_page.dart';
import 'package:wbl/Pages/Welcome%20Page/Contact%20Page/contact_page.dart';
import 'package:wbl/Pages/Welcome%20Page/Frequently%20Asked%20Questions%20Page/faqs.dart';
import 'package:wbl/Pages/Welcome%20Page/Organizations/cdac_organization.dart';
import 'package:wbl/Pages/Welcome%20Page/Organizations/certin_organization.dart';
import 'package:wbl/Pages/Welcome%20Page/Organizations/cmet_organization.dart';
import 'package:wbl/Pages/Welcome%20Page/Organizations/ernet_organization.dart';
import 'package:wbl/Pages/Welcome%20Page/Organizations/nielit_organization.dart';
import 'package:wbl/Pages/Welcome%20Page/Organizations/sameer_organization.dart';
import 'package:wbl/Pages/Welcome%20Page/Organizations/stqc_organization.dart';
import 'package:wbl/Pages/Welcome%20Page/Recruiters%20Page/recruiters_page.dart';
import 'package:wbl/Pages/Welcome%20Page/Resume%20Bank%20Page/resume_bank.dart';
import 'package:wbl/Pages/Welcome%20Page/Testimonials/testimonials.dart';
import 'package:wbl/Pages/Welcome%20Page/WBL%20Opportunities/wbl_opportunities_page.dart';
import 'package:wbl/Pages/Welcome%20Page/welcome_page.dart';
import 'package:wbl/Reusable%20Functions/reusable_function.dart';

import '../../Pages/Login Page/Enrollment Form/Candidate Enrollment Form/candidate_enrollment_form.dart';
import '../../Pages/Employeer Pages/Employer Registration Form/employer_registration_form.dart';

class MyWelcomeHeader extends StatefulWidget {
  const MyWelcomeHeader({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyWelcomeHeaderState createState() => _MyWelcomeHeaderState();
}

class _MyWelcomeHeaderState extends State<MyWelcomeHeader> {
  bool isMenuOpen = false; // To track if the drawer menu is open

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.09,
                vertical: 20,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Image(
                      image: AssetImage('assets/images/miety.png'),
                      height: 50,
                    ),
                  ),
                  Expanded(
                    child: Image(
                      image: AssetImage('assets/images/G20Logo.png'),
                      height: 50,
                    ),
                  ),
                  Expanded(
                    child: Image(
                      image: AssetImage('assets/images/wblLogo.png'),
                      height: 50,
                    ),
                  ),
                  Expanded(
                    child: Image(
                      image: AssetImage('assets/images/cdacLogo.png'),
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xff214492),
              width: screenWidth,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.09,
                    // vertical: 3.0,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: constraints.maxWidth > 1150
                          ? menulist(context)
                          : [
                              IconButton(
                                icon: const Icon(Icons.menu),
                                color: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    isMenuOpen = !isMenuOpen;
                                  });
                                },
                              )
                            ])),
            ),
            if (constraints.maxWidth < 1150)
              AnimatedContainer(
                duration: const Duration(milliseconds: 300), // Smooth animation
                height: isMenuOpen ? null : 0, // Menu opens/closes
                color: const Color(0xff214492), // Same blue background for menu
                child: SizedBox(
                  width: screenWidth,
                  child: Column(
                    children: menulist(context),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

Widget mytextbutton(String text, VoidCallback onPressed) {
  return TextButton(
    onPressed: onPressed,
    child: Text(text, style: const TextStyle(color: Colors.white)),
  );
}

List<Widget> menulist(context) {
  return [
    mytextbutton('Home', () {
      MyFun.navigatToPage(context, const WelcomePage());
    }),
    mytextbutton('About', () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const AboutPage()));
    }),
    DropdownButton<String>(
      dropdownColor: Colors.white,
      underline: const SizedBox(),
      iconEnabledColor: Colors.white,
      items: const [
        DropdownMenuItem(
          value: 'Cdac',
          child: Text('C-DAC', style: TextStyle(color: Colors.black)),
        ),
        DropdownMenuItem(
          value: 'Certin',
          child: Text('CERT-IN', style: TextStyle(color: Colors.black)),
        ),
        DropdownMenuItem(
          value: 'Cmet',
          child: Text('CMET', style: TextStyle(color: Colors.black)),
        ),
        DropdownMenuItem(
          value: 'Ernet',
          child: Text('ERNET', style: TextStyle(color: Colors.black)),
        ),
        DropdownMenuItem(
          value: 'Nielit',
          child: Text('NIELIT', style: TextStyle(color: Colors.black)),
        ),
        DropdownMenuItem(
          value: 'Sameer',
          child: Text('SAMEER', style: TextStyle(color: Colors.black)),
        ),
        DropdownMenuItem(
          value: 'Stqc',
          child: Text('STQC', style: TextStyle(color: Colors.black)),
        )
      ],
      onChanged: (value) {
        if (value == 'Cdac') {
          MyFun.navigatToPage(context, CdacOrganization());
        } else if (value == 'Certin') {
          MyFun.navigatToPage(context, CertinOrganization());
        } else if (value == 'Cmet') {
          MyFun.navigatToPage(context, CmetOrganization()); // Adjust for CMET
        } else if (value == 'Ernet') {
          MyFun.navigatToPage(context, ErnetOrganization()); // Adjust for ERNET
        } else if (value == 'Nielit') {
          MyFun.navigatToPage(
              context, NielitOrganization()); // Adjust for NIELIT
        } else if (value == 'Sameer') {
          MyFun.navigatToPage(
              context, SameerOrganization()); // Adjust for SAMEER
        } else if (value == 'Stqc') {
          MyFun.navigatToPage(context, StqcOrganization()); // Adjust for STQC
        }
      },
      hint: const Text(
        'Organizations',
        style: TextStyle(color: Colors.white),
      ),
    ),
    mytextbutton('WBL Opportunities', () {
      MyFun.navigatToPage(context, const WblOpportunitiesPage());
    }),
    mytextbutton('Testimonials', () {
      MyFun.navigatToPage(context, const Testimonials());
    }),
    mytextbutton('Recruiters', () {
      MyFun.navigatToPage(context, RecruitersPage());
    }),
    mytextbutton('Resume Bank', () {
      MyFun.navigatToPage(context, const ResumeBank());
    }),
    mytextbutton('FAQs', () {
      MyFun.navigatToPage(context, Faqs());
    }),
    mytextbutton('Contact', () {
      MyFun.navigatToPage(context, const ContactPage());
    }),
    DropdownButton<String>(
      dropdownColor: Colors.white,
      underline: const SizedBox(),
      iconEnabledColor: Colors.white,
      items: const [
        DropdownMenuItem(
          value: 'Candidate',
          child: Text('Candidate', style: TextStyle(color: Colors.black)),
        ),
        DropdownMenuItem(
          value: 'Admin',
          child: Text('Admin', style: TextStyle(color: Colors.black)),
        ),
        DropdownMenuItem(
          value: 'Employer',
          child: Text('Employer', style: TextStyle(color: Colors.black)),
        ),
        DropdownMenuItem(
          value: 'Cmsportal',
          child: Text('CMS Portal', style: TextStyle(color: Colors.black)),
        )
      ],
      onChanged: (value) {
        if (value == 'Candidate') {
          MyFun.navigatToPagewithoutBack(
              context,
              const LoginPage(
                userName: 'Candidate login',
                registerPage: CandidateEnrollmentForm(),
              ));
        }
        if (value == 'Admin') {
          MyFun.navigatToPagewithoutBack(
              context,
              const LoginPage(
                  userName: 'User login',
                  registerPage: AdminParticipatingRegs(
                    isHeaderRequied: true,
                  )));
        }
        if (value == 'Employer') {
          MyFun.navigatToPagewithoutBack(
              context,
              const LoginPage(
                  userName: 'Employer Login',
                  registerPage: EmployerRegistration()));
        }

        if (value == 'Cmsportal') {
          MyFun.navigatToPagewithoutBack(context,
              LoginPage(userName: 'CMS Portal', registerPage: CmsDrawer()));
        }
      },
      hint: const Text(
        'Login',
        style: TextStyle(color: Colors.white),
      ),
    ),
  ];
}
