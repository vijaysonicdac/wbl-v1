import 'package:flutter/material.dart';
import 'package:wbl/Pages/Welcome%20Page/WBL%20Opportunities/wbl_opportunities_page.dart';
import 'package:wbl/Reusable%20Functions/reusable_function.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_footer.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_header.dart';

class ResumeBankForCompany extends StatelessWidget {
  const ResumeBankForCompany({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MyWelcomeHeader(),
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
                              'Resume Bank',
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
                ],
              ),
            ),
            Container(
              color: const Color(0xffF0F9FA),
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.075,
                vertical: screenWidth * 0.025,
              ),
              child: screenWidth >= 850
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: cardForResumeBankCompanyEmployee(
                            context,
                            'assets/images/company_vector.png',
                            'Need skilled tech talent for your project? Our WBLP Resume Bank houses qualified candidates trained across 7 centers. Download resumes for free and hire the perfect fit for your needs. Grow your business with skilled Indian talent.',
                            'Login/Register Company',
                            () {
                              MyFun.navigatToPage(
                                  context, const WblOpportunitiesPage());
                            },
                          ),
                        ),
                        const SizedBox(width: 40), // For horizontal spacing
                        Expanded(
                          child: cardForResumeBankCompanyEmployee(
                            context,
                            'assets/images/employee_vector.png',
                            'Landing your first job can be tough. Don’t waste time searching! Fill out our form with your newly acquired skills and resume. We’ll connect you with companies seeking qualified candidates, making your job hunt a breeze. Let’s get you hired!',
                            'Submit Resume',
                            () {
                              MyFun.navigatToPage(
                                  context, const WblOpportunitiesPage());
                            },
                          ),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        cardForResumeBankCompanyEmployee(
                          context,
                          'assets/images/company_vector.png',
                          'Need skilled tech talent for your project? Our WBLP Resume Bank houses qualified candidates trained across 7 centers. Download resumes for free and hire the perfect fit for your needs. Grow your business with skilled Indian talent.',
                          'Login/Register Company',
                          () {
                            MyFun.navigatToPage(
                                context, const WblOpportunitiesPage());
                          },
                        ),
                        const SizedBox(height: 40), // Vertical spacing
                        cardForResumeBankCompanyEmployee(
                          context,
                          'assets/images/employee_vector.png',
                          'Landing your first job can be tough. Don’t waste time searching! Fill out our form with your newly acquired skills and resume. We’ll connect you with companies seeking qualified candidates, making your job hunt a breeze. Let’s get you hired!',
                          'Submit Resume',
                          () {
                            MyFun.navigatToPage(
                                context, const WblOpportunitiesPage());
                          },
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

  Widget cardForResumeBankCompanyEmployee(
    BuildContext context,
    String imagePath,
    String description,
    String buttonText,
    VoidCallback onPressed,
  ) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(imagePath, height: 250),
            const SizedBox(height: 10),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff049304),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
