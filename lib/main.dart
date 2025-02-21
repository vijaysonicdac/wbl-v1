import 'package:flutter/material.dart';
import 'package:wbl/Pages/Admin%20Pages/admin_login_page.dart';
import 'package:wbl/Pages/CMS%20Pages/cms_drawer.dart';
import 'package:wbl/Pages/Welcome%20Page/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'WBLP',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          primaryColor: Colors.indigo[900],
        ),
        // home: AdminLoginPage(),
        home: WelcomePage(),
        // home: AdminLoginPage()
        // home: Vacancyclass(),
        // home: StipendPage(),
        // home: Stipendclass(),
        // home: Stipendclass()
        // home: Vacancyclass(),
        // home: VacancyClass(),
        // home: CmsDrawer(),
        );
  }
}
