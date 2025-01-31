import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wbl/Pages/Login%20Page/login_page.dart';
import 'package:wbl/Reusable%20Functions/reusable_function.dart';
import 'package:wbl/Reusable%20Widgets/My%20enrollment%20reusable%20widget/my_enroll_row_to_column.dart';
import 'package:wbl/Reusable%20Widgets/My%20enrollment%20reusable%20widget/my_enrollment_elevated_button.dart';
import 'package:wbl/Reusable%20Widgets/My%20enrollment%20reusable%20widget/my_enrollment_header.dart';
import 'package:wbl/Reusable%20Widgets/My%20enrollment%20reusable%20widget/my_enrollment_password.dart';
import 'package:wbl/Reusable%20Widgets/My%20enrollment%20reusable%20widget/my_enrollment_radio_button.dart';
import 'package:wbl/Reusable%20Widgets/My%20enrollment%20reusable%20widget/my_enrollment_searchdropdown.dart';

import '../../../../Reusable Widgets/Welcome Page Reusable Widgets/my_welcome_header.dart';

class EmployerRegistration extends StatefulWidget {
  const EmployerRegistration({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EmployerRegistrationState createState() => _EmployerRegistrationState();
}

class _EmployerRegistrationState extends State<EmployerRegistration> {
  String showYear = 'Select Year & Month';
  DateTime _selectedYearMonth = DateTime.now();

  selectedYear(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Year'),
          content: SizedBox(
            width: 300,
            height: 300,
            child: YearPicker(
              firstDate: DateTime(DateTime.now().year - 10, 1),
              lastDate: DateTime(2090),
              selectedDate: _selectedYearMonth,
              onChanged: (DateTime dateTime) {
                setState(() {
                  _selectedYearMonth = dateTime;
                  _selectedYearMonth = DateTime(dateTime.year);
                  // showYear = "${dateTime.year}";
                });
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

  // Initialize the TextEditingController
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emoloyerDetailsController =
      TextEditingController();
  final TextEditingController _ceoController = TextEditingController();
  final TextEditingController _officeController = TextEditingController();
  final TextEditingController _hrController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _gstController = TextEditingController();
  final TextEditingController textController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _employerController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  String? selectedption;
  String _selecteOption = '';
  String? selectState;
  String aboutText = '';
  List<String> employers = ['1-10', '10-50', '50-100', 'More then 100'];
  List<String> state = ['himachal Pradesh', 'Asam', 'bihar', 'punjab'];

  Future<void> _selectYearAndMonth(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            // primaryColor: Colors.teal, // Calendar header color
            // accentColor: Colors.teal, // Selection color
            colorScheme: const ColorScheme.light(
                primary: Colors.teal), // Today's highlight
            buttonTheme: const ButtonThemeData(
                textTheme: ButtonTextTheme.primary), // Button theme
          ),
          child: child!,
        );
      },
    );
    setState(() {
      // Formatting as "YYYY, MM"
      _dateController.text = DateFormat('yyyy, MMM').format(pickedDate!);
    });
  }

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter an email';
    }

    // Updated regex to validate email more comprehensively
    RegExp emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

    if (!emailRegex.hasMatch(email)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  String? validateData(String? data, String validationString) {
    final RegExp nameRegex = RegExp(r'^[a-zA-Z\s]+$');
    if (data == null || data.isEmpty) {
      return validationString;
    } else if (!nameRegex.hasMatch(data)) {
      return validationString;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'The password field is required.';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long.';
    } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter.';
    } else if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter.';
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one digit.';
    } else if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
      return 'Password must contain at least one special character.';
    }
    return null;
  }

  String? validateGST(String? value) {
    if (value == null || value.isEmpty) {
      return 'GST number is required';
    }
    String pattern =
        r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$';
    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid GST number';
    }
    return null;
  }

  String? _errorMsgRegisterClickRadio;

  void _onPreviewButtonPressed() {
    if (_selecteOption.isEmpty) {
      setState(() {
        _errorMsgRegisterClickRadio = 'Please select the Option';
      });
    } else {
      setState(() {
        _errorMsgRegisterClickRadio = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MyWelcomeHeader(),
            const Header(title: 'Employer Registration'),
            const SizedBox(
              height: 20,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .03,
                      vertical: MediaQuery.of(context).size.height * .04),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Card(
                          color: const Color.fromARGB(255, 224, 243, 232),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              side: BorderSide(color: Colors.black45)),
                          //255.24.243.232
                          child: Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(9.0),
                                  child: Text(
                                    'Basic Details',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                divider(),
                                // const SizedBox(height: 10),
                                MyRowToColumn(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(9.0),
                                      child: myTextBox(
                                          ' Name',
                                          ' Name',
                                          _nameController,
                                          (value) => validateData(value,
                                              'The  name field is required.'),
                                          AutovalidateMode.onUserInteraction),
                                    ),
                                    // const SizedBox(width: 2),
                                    Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: TextFormField(
                                          controller: _mobileController,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          decoration: InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              labelText: 'Contact Number',
                                              hintText: 'Contact Number',
                                              hintStyle: const TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.grey,
                                              ),
                                              prefixText: '+91',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              )),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter a contact number';
                                            }
                                            if (!RegExp(r'^[0-9]{10}$')
                                                .hasMatch(value)) {
                                              return 'Please enter a valid 10-digit phone number';
                                            }
                                            return null;
                                          },
                                        )),
                                  ],
                                ),
                                // spaceBwWidgets(),

                                MyRowToColumn(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(9.0),
                                      child: myTextBox(
                                          ' Email',
                                          ' Email',
                                          _emailController,
                                          validateEmail,
                                          AutovalidateMode.onUserInteraction),
                                    ),
                                    // const SizedBox(width: 2),
                                    Padding(
                                      padding: const EdgeInsets.all(9.0),
                                      child: MyEnrollmentPassword(
                                        controller: _passwordController,
                                        hintText: 'Password',
                                        labelText: 'Password',
                                        validator: validatePassword,
                                        autovalidationMode:
                                            AutovalidateMode.onUserInteraction,
                                      ),
                                    ),
                                  ],
                                ),
                                divider(),
                                Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            'Employer Details',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          Expanded(
                                            child: Wrap(
                                              alignment: WrapAlignment.end,
                                              children: [
                                                MyRadioButton(
                                                    value: 'Company',
                                                    groupValue: _selecteOption,
                                                    label: 'Company',
                                                    onChanged:
                                                        (String? newValue) {
                                                      setState(() {
                                                        _selecteOption =
                                                            newValue!;
                                                        _errorMsgRegisterClickRadio =
                                                            null;
                                                      });
                                                    }),
                                                MyRadioButton(
                                                    value: 'Consultant',
                                                    groupValue: _selecteOption,
                                                    label: 'Consulatant',
                                                    onChanged:
                                                        (String? newValue) {
                                                      setState(() {
                                                        _selecteOption =
                                                            newValue!;
                                                        _errorMsgRegisterClickRadio =
                                                            null;
                                                      });
                                                    }),
                                                if (_errorMsgRegisterClickRadio !=
                                                    null)
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 20),
                                                    child: Text(
                                                      _errorMsgRegisterClickRadio!,
                                                      style: const TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 12),
                                                    ),
                                                  )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      // spaceBwWidgets(),
                                      MyRowToColumn(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(9.0),
                                            child: myTextBox(
                                                'Employer Name',
                                                'Employer Name',
                                                _emoloyerDetailsController,
                                                (value) => validateData(value,
                                                    'The company name field is required.'),
                                                AutovalidateMode
                                                    .onUserInteraction),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(9.0),
                                            child: myTextBox(
                                              'CEO',
                                              "CEO",
                                              _ceoController,
                                              (value) => validateData(value,
                                                  'The CEO field is required'),
                                              AutovalidateMode
                                                  .onUserInteraction,
                                            ),
                                          ),
                                        ],
                                      ),
                                      // spaceBwWidgets(),
                                      MyRowToColumn(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(9.0),
                                            child: myTextBox(
                                                'Official Email',
                                                'Official Email',
                                                _officeController,
                                                validateEmail,
                                                AutovalidateMode
                                                    .onUserInteraction),
                                          ),
                                          // const SizedBox(width: 2),
                                          Padding(
                                            padding: const EdgeInsets.all(9.0),
                                            child: myTextBox(
                                              'HR Email',
                                              "HR Email",
                                              _hrController,
                                              validateEmail,
                                              AutovalidateMode
                                                  .onUserInteraction,
                                            ),
                                          ),
                                        ],
                                      ),
                                      // spaceBwWidgets(),
                                      MyRowToColumn(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(9.0),
                                            child: MyEnrollmentSearchdropdown(
                                              dropdownItems: employers,
                                              hintText: 'Numbers of Employers',
                                              controller: _employerController,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please select a value';
                                                }
                                                AutovalidateMode
                                                    .onUserInteraction;
                                                return null;
                                              },
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(9.0),
                                              child: TextFormField(
                                                controller: _dateController,
                                                readOnly: true,
                                                onTap: () =>
                                                    _selectYearAndMonth(
                                                        context),
                                                decoration: InputDecoration(
                                                  labelText:
                                                      'Year of Incorporation * ',
                                                  hintText:
                                                      'Year of Incorporation *',
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  suffixIcon: _dateController
                                                          .text.isNotEmpty
                                                      ? IconButton(
                                                          icon: const Icon(
                                                              Icons.clear),
                                                          onPressed: () {
                                                            setState(() {
                                                              _dateController
                                                                  .clear(); // Clears the text
                                                            });
                                                          },
                                                        )
                                                      : const Icon(
                                                          Icons.calendar_today),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please enter the year of incorporation';
                                                  }
                                                  return null;
                                                },
                                              )),
                                        ],
                                      ),
                                      // spaceBwWidgets(),
                                      Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Flexible(
                                          child: SizedBox(
                                            width: screenWidth >= 600
                                                ? screenWidth * .195
                                                : screenWidth,
                                            child: Row(
                                              children: [
                                                Flexible(
                                                    child: myTextBox(
                                                        'GST NO',
                                                        'GST No',
                                                        _gstController,
                                                        validateGST,
                                                        AutovalidateMode
                                                            .onUserInteraction)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: myTextField(
                                                  'About(400 Characters)',
                                                  // 'About(400 Characters) ',
                                                  textController),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // spaceBwWidgets(),
                                      Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: myTextField(
                                                    'Address',
                                                    // 'Address',
                                                    _addressController)),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Flexible(
                                          child: SizedBox(
                                            width: screenWidth >= 600
                                                ? screenWidth * .195
                                                : screenWidth,
                                            child: Row(
                                              children: [
                                                MyEnrollmentSearchdropdown(
                                                  dropdownItems: state,
                                                  hintText: 'Select State',
                                                  controller: _stateController,
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please select state';
                                                    }
                                                    return null;
                                                  },
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 50),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          CustomElevatedButton(
                                              text: 'Register',
                                              color: Colors.green,
                                              onPressed: () {
                                                _onPreviewButtonPressed();
                                                if (_formKey.currentState!
                                                    .validate()) {}
                                              }),
                                        ],
                                      )
                                    ],
                                  ),
                                ),

                                // )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Divider(
                          color: Colors.green,
                          thickness: 0.5,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already registered & verified?',
                                style: TextStyle(
                                    // fontSize: screenWidth * 0.01,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(width: 5),
                              Flexible(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: Size(screenWidth * 0.01,
                                            screenHeight * .06),
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.green,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            side: const BorderSide(
                                                color: Colors.green,
                                                width: 1))),
                                    onPressed: () {
                                      MyFun.navigatToPage(
                                          context,
                                          const LoginPage(
                                              userName: 'Employer Login',
                                              registerPage:
                                                  EmployerRegistration()));
                                    },
                                    child: const Text('Login')),
                              )
                            ])
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myTextBox(
    String label,
    String hintText,
    TextEditingController controller,
    String? Function(String?) validator,
    AutovalidateMode? autovalidateMode,
  ) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 16.0,
          color: Colors.grey,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      validator: validator,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
    );
  }

  Widget myDropDown(
      String? selectedItems,
      String hintText,
      List<String> items,
      // String? Function(String?) validator,
      AutovalidateMode? autovalidateMode,
      String labelText) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      // validator: validator,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      items: items.map((String item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          selectedItems = newValue!;
        });
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
      minLines: 5,
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

  Widget myElevatedButton({
    required String text,
    required VoidCallback onPressed, // Make this a required parameter
    Color backgroundColor = Colors.white, // Default background color
    Color foregroundColor = Colors.green, // Default text color
    Color borderColor = Colors.green, // Default border color
    Size? minimumSize, // Optional parameter for button size
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize:
            minimumSize ?? const Size(100, 50), // Default size if not provided
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: borderColor, width: 1),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget myRadioButton(
    String value,
    String groupValue,
    String label,
    Function(String?) onchanged,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String>(
          value: value,
          groupValue: groupValue,
          activeColor: Colors.black,
          onChanged: (String? newValue) {
            setState(() {
              selectedption = newValue;
            });
          },
        ),
        Text(label),
      ],
    );
  }

  Widget rowTOColumn(List<Widget> children) {
    if (MediaQuery.sizeOf(context).width <= 600) {
      return Wrap(children: children);
    } else {
      return Row(children: children);
    }
  }

  Widget spaceBwWidgets() {
    return const SizedBox(height: 15, width: 20);
  }

  Widget divider() {
    return const Divider(
      height: 40,
      thickness: 0.2,
      color: Colors.black,
    );
  }

  Widget headingText(String data) {
    return Text(
      data,
      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
    );
  }
}
