import 'package:flutter/material.dart';

import '../../Reusable Functions/reusable_function.dart';
import '../../Reusable Widgets/Welcome Page Reusable Widgets/my_welcome_header.dart';
import '../Admin Pages/admin_login_page.dart';
import '../CMS Pages/cms_drawer.dart';
import '../Candidate Pages/Drawer/candidate_dashboard.dart';
import '../Welcome Page/welcome_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage(
      {super.key, required this.userName, required this.registerPage});
  final String userName;
  final Widget registerPage;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obsecureText = true; // To handle password visibility
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  // Function to toggle password visibility
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void togglePasswordVisibility() {
    setState(() {
      obsecureText = !obsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyWelcomeHeader(),
              const SizedBox(
                height: 80,
              ),
              SizedBox(
                width: 500,
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.userName,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 50,
                                    right: 50,
                                  ),
                                  child: mytextfield(
                                    userNameController,
                                    'Username *',
                                    'Enter Username',
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'please enter your name';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 50,
                                    right: 50,
                                  ),
                                  child: TextFormField(
                                    controller: passwordController,
                                    obscureText:
                                        obsecureText, // Toggle password visibility
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: InputDecoration(
                                      labelText: 'Password *',
                                      hintText: 'Enter Password',
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                      ),
                                      border: const OutlineInputBorder(),
                                      // Password visibility toggle icon
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          obsecureText
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        ),
                                        onPressed: togglePasswordVisibility,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter your password';
                                      }
                                      if (value.length < 8) {
                                        return 'Password must be 8 characters or more';
                                      }
                                      return null;
                                    },
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 50,
                                    right: 50,
                                  ),
                                  child: MaterialButton(
                                    height: 50,
                                    minWidth: double.infinity,
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        // Form is valid, proceed with login
                                        _formKey.currentState!.save();
                                        if (widget.userName ==
                                            'Candidate login') {
                                          if (userNameController.text ==
                                                  'dimple' &&
                                              passwordController.text ==
                                                  'Dimple@123') {
                                            MyFun.navigatToPagewithoutBack(
                                                context, CandidateHomePage());
                                          }
                                        }
                                        if (widget.userName == 'User login') {
                                          if (userNameController.text ==
                                                  'dimple' &&
                                              passwordController.text ==
                                                  'Dimple@123') {
                                            MyFun.navigatToPagewithoutBack(
                                                context, AdminLoginPage());
                                          }
                                        }
                                      }
                                      if (widget.userName == 'CMS Portal') {
                                        if (userNameController.text ==
                                                'dimple' &&
                                            passwordController.text ==
                                                'Dimple@123') {
                                          MyFun.navigatToPagewithoutBack(
                                              context, CmsDrawer());
                                        }
                                      }
                                    },
                                    color: Colors.blue[900],
                                    textColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Text(
                                      'Login',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        MyFun.navigatToPage(
                                            context, widget.registerPage);
                                      },
                                      child: Text(
                                        'Register',
                                        style:
                                            TextStyle(color: Colors.blue[900]),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        MyFun.navigatToPagewithoutBack(
                                            context, const WelcomePage());
                                      },
                                      child: Text(
                                        'Back to home',
                                        style:
                                            TextStyle(color: Colors.blue[900]),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue[900],
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/images/cdacLogo.png"),
              width: 50,
              height: 50,
            ),
            Flexible(
              child: Text(
                "Designed, Deployed and Maintained by Centre for Development of Advanced Computing (C-DAC), Mohali | © 2023 WorkBasedLearning. All rights reserved | Privacy Policy",
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget mytextfield(
    controller,
    String labelText,
    String hintText, {
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.face),
        labelText: labelText,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
        border: const OutlineInputBorder(),
      ),
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
