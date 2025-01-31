import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wbl/Reusable%20Functions/reusable_function.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_divider.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_footer.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_header.dart';
import 'package:wbl/Reusable%20Widgets/Welcome%20Page%20Reusable%20Widgets/my_welcome_searchable_dropdown.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController organizationController = TextEditingController();
  final TextEditingController queryController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  String? selectedOrganization;
  String? selectedQuery;
  final List<String> organizations = [
    'C-DAC',
    'CERT-IN',
    'CMET',
    'ERNET',
    'NIELIT',
    'SAMEER',
    'STQC'
  ];
  List<String> query = [
    "Query",
    "Feedback",
  ];
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "The name field is required";
    }
    return null;
  }

  String? validateOrganization(String? value) {
    if (value == null || value.isEmpty) {
      return "The org field is required";
    }
    return null;
  }

  String? validateQuery(String? value) {
    if (value == null || value.isEmpty) {
      return "The query field is required";
    }
    return null;
  }

  String? validateSubject(String? value) {
    if (value == null || value.isEmpty) {
      return "The subject field is required";
    }
    return null;
  }

  String? validateMessage(String? value) {
    if (value == null || value.isEmpty) {
      return "The message field is required";
    }
    return null;
  }

  String? validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return "The mobile number is required";
    }
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return "Enter a valid 10-digit mobile number";
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "The email field is required";
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return "Enter a valid email address";
    }
    return null;
  }

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
                        Image.asset(
                          'assets/images/wblLogo.png',
                          height: 120,
                        ),
                        (screenWidth > 750)
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Project Management Unit (WBL)',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Color(0xff214492)),
                                        ),
                                        const MyWelcomeDivider(),
                                        const Row(
                                          children: [
                                            Icon(Icons.location_on,
                                                color: Colors.green),
                                            SizedBox(width: 8),
                                            Flexible(
                                              child: Text(
                                                'Centre for Development of Advanced Computing (C-DAC)',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        const Text(
                                          'A-34, Phase-VIII, Industrial Area Mohali -160071, Punjab',
                                          style: TextStyle(
                                              color: Color(0xff5A5A72)),
                                        ),
                                        const Text(
                                          'Phone: +91-172-2237052-55, 6619000',
                                          style: TextStyle(
                                              color: Color(0xff5A5A72)),
                                        ),
                                        const Text(
                                          'Fax: +91-172-2237050-51',
                                          style: TextStyle(
                                              color: Color(0xff5A5A72)),
                                        ),
                                        const Text(
                                          'Email: wblp@cdac.in',
                                          style: TextStyle(
                                            color: Color(0xff5A5A72),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Find us on social media: ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  MyFun.navigatToPage(context,
                                                      const ContactPage());
                                                },
                                                icon: const Icon(
                                                  FontAwesomeIcons.twitter,
                                                  color: Color(0xff2697CF),
                                                )),
                                            IconButton(
                                                onPressed: () {
                                                  MyFun.navigatToPage(context,
                                                      const ContactPage());
                                                },
                                                icon: const Icon(
                                                  FontAwesomeIcons.linkedin,
                                                  color: Color(0xff2697CF),
                                                ))
                                          ],
                                        ),
                                        // MapSection
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: screenWidth * .01,
                                              bottom: screenWidth * .01,
                                              right: screenWidth * .01),
                                          child: Image.asset(
                                            'assets/images/cdac_map.png',
                                            height: 400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Form(
                                    key: _formkey,
                                    child: Expanded(
                                      flex: 1,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Fill the form below to reach us',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Card(
                                            color: const Color(0xffE0F3E8),
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                screenWidth * .02,
                                              ),
                                              child: Column(
                                                children: [
                                                  MyTextFormField(
                                                    controller: nameController,
                                                    labelText: 'Name',
                                                    validator: validateName,
                                                  ),
                                                  const SizedBox(height: 10),
                                                  MyTextFormField(
                                                    controller: emailController,
                                                    labelText: 'Email',
                                                    validator: validateEmail,
                                                  ),
                                                  const SizedBox(height: 10),
                                                  MyTextFormField(
                                                    controller:
                                                        mobileController,
                                                    labelText: 'Mobile',
                                                    validator: validateMobile,
                                                  ),
                                                  const SizedBox(height: 10),
                                                  SizedBox(
                                                    height: 50,
                                                    child: MyWelcomeSearchableDropdown(
                                                        dropdownItems:
                                                            organizations,
                                                        hintText:
                                                            "Select Organization",
                                                        controller:
                                                            organizationController,
                                                        validator:
                                                            validateOrganization,
                                                        autovalidateMode:
                                                            AutovalidateMode
                                                                .onUserInteraction),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  SizedBox(
                                                    height: 50,
                                                    child: MyWelcomeSearchableDropdown(
                                                        dropdownItems: query,
                                                        hintText:
                                                            "Select Query",
                                                        controller:
                                                            queryController,
                                                        validator:
                                                            validateQuery,
                                                        autovalidateMode:
                                                            AutovalidateMode
                                                                .onUserInteraction),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  MyTextFormField(
                                                    controller:
                                                        subjectController,
                                                    labelText: 'Subject',
                                                    validator: validateSubject,
                                                  ),
                                                  const SizedBox(height: 10),
                                                  MyTextFormField(
                                                    controller:
                                                        messageController,
                                                    labelText: 'Message',
                                                    validator: validateMessage,
                                                  ),
                                                  const SizedBox(height: 10),
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          const Color(
                                                              0xff049304),
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 16.0),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      if (_formkey.currentState!
                                                          .validate()) {
                                                        _formkey.currentState!
                                                            .save();
                                                      }
                                                    },
                                                    child: const Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.search,
                                                          color: Colors.white,
                                                        ),
                                                        SizedBox(width: 8.0),
                                                        Text(
                                                          "Search",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Project Management Unit (WBL)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Color(0xff214492)),
                                  ),
                                  const MyWelcomeDivider(),
                                  const Row(
                                    children: [
                                      Icon(Icons.location_on,
                                          color: Colors.green),
                                      SizedBox(width: 8),
                                      Flexible(
                                        child: Text(
                                          'Centre for Development of Advanced Computing (C-DAC)',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'A-34, Phase-VIII, Industrial Area Mohali -160071, Punjab',
                                    style: TextStyle(color: Color(0xff5A5A72)),
                                  ),
                                  const Text(
                                    'Phone: +91-172-2237052-55, 6619000',
                                    style: TextStyle(color: Color(0xff5A5A72)),
                                  ),
                                  const Text(
                                    'Fax: +91-172-2237050-51',
                                    style: TextStyle(color: Color(0xff5A5A72)),
                                  ),
                                  const Text(
                                    'Email: wblp@cdac.in',
                                    style: TextStyle(
                                      color: Color(0xff5A5A72),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Find us on social media: ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            MyFun.navigatToPage(
                                                context, const ContactPage());
                                          },
                                          icon: const Icon(
                                            FontAwesomeIcons.twitter,
                                            color: Color(0xff2697CF),
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            MyFun.navigatToPage(
                                                context, const ContactPage());
                                          },
                                          icon: const Icon(
                                            FontAwesomeIcons.linkedin,
                                            color: Color(0xff2697CF),
                                          ))
                                    ],
                                  ),
                                  // MapSection
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: screenWidth * .01,
                                        bottom: screenWidth * .01,
                                        right: screenWidth * .01),
                                    child: Image.asset(
                                      'assets/images/cdac_map.png',
                                      height: 400,
                                    ),
                                  ),
                                  Form(
                                    key: _formkey,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Fill the form below to reach us',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Card(
                                          color: const Color(0xffE0F3E8),
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                              screenWidth * .02,
                                            ),
                                            child: Column(
                                              children: [
                                                MyTextFormField(
                                                  controller: nameController,
                                                  labelText: 'Name',
                                                  validator: validateName,
                                                ),
                                                const SizedBox(height: 10),
                                                MyTextFormField(
                                                  controller: emailController,
                                                  labelText: 'Email',
                                                  validator: validateEmail,
                                                ),
                                                const SizedBox(height: 10),
                                                MyTextFormField(
                                                  controller: mobileController,
                                                  labelText: 'Mobile',
                                                  validator: validateMobile,
                                                ),
                                                const SizedBox(height: 10),
                                                SizedBox(
                                                  height: 50,
                                                  child: MyWelcomeSearchableDropdown(
                                                      dropdownItems:
                                                          organizations,
                                                      hintText:
                                                          "Select Organization",
                                                      controller:
                                                          organizationController,
                                                      validator:
                                                          validateOrganization,
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .onUserInteraction),
                                                ),
                                                const SizedBox(height: 10),
                                                SizedBox(
                                                  height: 50,
                                                  child: MyWelcomeSearchableDropdown(
                                                      dropdownItems: query,
                                                      hintText: "Select Query",
                                                      controller:
                                                          queryController,
                                                      validator: validateQuery,
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .onUserInteraction),
                                                ),
                                                const SizedBox(height: 10),
                                                MyTextFormField(
                                                  controller: subjectController,
                                                  labelText: 'Subject',
                                                  validator: validateSubject,
                                                ),
                                                const SizedBox(height: 10),
                                                MyTextFormField(
                                                  controller: messageController,
                                                  labelText: 'Message',
                                                  validator: validateMessage,
                                                ),
                                                const SizedBox(height: 10),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color(0xff049304),
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 16.0),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    if (_formkey.currentState!
                                                        .validate()) {
                                                      _formkey.currentState!
                                                          .save();
                                                    }
                                                  },
                                                  child: const Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.search,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(width: 8.0),
                                                      Text(
                                                        "Search",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                      ],
                    ),
                  ),
                  const MyWelcomeFooter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int maxLines;

  const MyTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        fillColor: Colors.white,
        filled: true,
      ),
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
    );
  }
}
