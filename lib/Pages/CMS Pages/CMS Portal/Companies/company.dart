import 'package:flutter/material.dart';
import 'package:wbl/Reusable%20Widgets/customelevated.dart';
import 'package:wbl/Reusable%20Widgets/myenrollment.dart';
import 'package:wbl/Reusable%20Widgets/searchabledropdown.dart';

class CompanyClass extends StatefulWidget {
  const CompanyClass({super.key});

  @override
  State<CompanyClass> createState() => CompanyClassState();
}

class CompanyClassState extends State<CompanyClass> {
  String? validateData(String? value, String validateString) {
    if (value == null || value.isEmpty) {
      return validateString;
    }
    return null;
  }

  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 8) {
      return 'Password should be at least 8 characters long';
    } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password should have at least one uppercase letter';
    } else if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter.';
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one digit.';
    } else if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
      return 'Password must contain at least one special character.';
    }
    return null;
  }

  String? confirmPassword(String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'This Filed is Required';
    } else if (confirmPassword != newPassController.text) {
      return 'Password does not match';
    }
    return null;
  }

  List<String> employers = ['1-10', '10-50', '50-100', 'More then 100'];
  List<String> state = ['Maharashtra', 'Himachal Pradesh', 'Pubjab', 'Haryana'];

  final employerNameController = TextEditingController();
  final ceoController = TextEditingController();
  final emailController = TextEditingController();
  final hrEmailController = TextEditingController();
  final employerNumController = TextEditingController();
  final yearIncorController = TextEditingController();
  final TextEditingController gstController = TextEditingController();
  final TextEditingController textController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController currentPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmNewController = TextEditingController();
  String aboutText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Company Settings',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('Basic Settings')],
                  ),
                  const Divider(
                    thickness: 0.5,
                  ),
                  rowToColumn(
                    [
                      MyTextFormField(
                          label: 'Employer Name',
                          hintText: 'Employer Name',
                          controller: employerNameController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                              validateData(value, 'Employer Name')),
                      SizedBox(width: 8),
                      MyTextFormField(
                          label: 'CEO',
                          hintText: 'CEO',
                          controller: ceoController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                              validateData(value, 'Employer Name')),
                    ],
                  ),
                  SizedBox(height: 8),
                  rowToColumn([
                    MyTextFormField(
                      label: 'E Mail',
                      hintText: 'E Mail',
                      controller: emailController,
                      validator: validateEmail,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(width: 8),
                    MyTextFormField(
                      label: 'HR Mail',
                      hintText: 'HR Mail',
                      controller: hrEmailController,
                      validator: validateEmail,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ]),
                  SizedBox(height: 8),
                  rowToColumn([
                    MyEnrollmentSearchdropdown(
                        dropdownItems: employers,
                        hintText: 'Numbers of Employers',
                        controller: employerNumController,
                        validator: (value) =>
                            validateData(value, 'Enter Number of employes'),
                        autovalidateMode: AutovalidateMode.onUserInteraction),
                    SizedBox(width: 8),
                    MyTextFormField(
                      label: 'Year of Incorporation',
                      hintText: 'Year of Incorporation',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: yearIncorController,
                      validator: (value) =>
                          validateData(value, 'Enter Year of Incorporation'),
                    )
                  ]),
                  SizedBox(height: 8),
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 716,
                      child: MyTextFormField(
                        label: 'GST NO',
                        hintText: 'GST NO',
                        controller: gstController,
                        validator: (value) =>
                            validateData(value, 'Enter Gst NO'),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: myTextField(
                            'About(400 Characters)',
                            // 'About(400 Characters) ',
                            textController),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: myTextField('Address', addressController),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  rowToColumn([
                    MyEnrollmentSearchdropdown(
                      dropdownItems: state,
                      hintText: 'Select State',
                      controller: stateController,
                      validator: (value) =>
                          validateData(value, 'Please Enter State'),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    )
                  ]),
                  SizedBox(height: 8),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomElevatedButton(
                            text: 'Update Details',
                            color: Colors.green,
                            onPressed: () {}),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Password Changed'),
                        SizedBox(height: 10),
                        Divider(
                          thickness: 1,
                        ),
                        Row(children: [
                          MyTextFormField(
                              label: 'Enter Current Password',
                              hintText: 'Enter Current Password',
                              controller: currentPassController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) =>
                                  validateData(value, 'Enter Password')),
                          SizedBox(width: 8),
                          MyTextFormField(
                              label: 'Enter New Password',
                              hintText: 'Enter New Password',
                              controller: newPassController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: validatePassword),
                          SizedBox(width: 8),
                          MyTextFormField(
                              label: 'Password',
                              hintText: 'Password',
                              controller: confirmNewController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: confirmPassword)
                        ]),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CustomElevatedButton(
                                  text: 'Update',
                                  color: Colors.green,
                                  onPressed: () {})
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget rowToColumn(List<Widget> children) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWideScreen = constraints.maxWidth > 600;
        return isWideScreen
            ? Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children),
              )
            : Column(
                children: children.map((child) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: child,
                  );
                }).toList(),
              );
      },
    );
  }

  Widget myTextField(String labelText, TextEditingController? controller,
      {AutovalidateMode? autovalidationMode}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText,
          // hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.only(left: 15.0, top: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
      keyboardType: TextInputType.multiline,
      maxLines: null,
      minLines: 1,
      onChanged: (value) {
        setState(() {
          aboutText = value;
        });
      },
      autovalidateMode:
          autovalidationMode ?? AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'this field is required';
        }
        return null;
      },
    );
  }
}
