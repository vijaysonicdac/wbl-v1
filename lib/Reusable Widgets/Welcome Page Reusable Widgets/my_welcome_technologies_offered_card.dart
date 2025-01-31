import 'package:flutter/material.dart';
import 'package:wbl/Pages/Welcome%20Page/WBL%20Opportunities/wbl_opportunities_page.dart';
import 'package:wbl/Reusable%20Functions/reusable_function.dart';

class MyWelcomeTechnologiesOfferedCard extends StatelessWidget {
  final String text;
  final String imagePath;

  const MyWelcomeTechnologiesOfferedCard({
    super.key,
    required this.text,
    required this.imagePath,
  });

  @override
  // Card for displaying technologies
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 100,
      child: InkWell(
        onTap: (){
          MyFun.navigatToPage(context, const WblOpportunitiesPage());
        },
        child: Card(
            // elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 0.2,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xFFF0F9FA),
                    ),
                    child: Image.asset(
                      imagePath,
                      width: 40,
                      height: 40,
                      fit: BoxFit.contain,
                    ),
                  ),
                  title: Text(text,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black)),
                ),
              ),
            )),
      ),
    );
  }
}
