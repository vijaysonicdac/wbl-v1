import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wbl/Reusable%20Widgets/My%20enrollment%20reusable%20widget/my_enrollment_elevated_button.dart';
import 'package:wbl/Reusable%20Widgets/My%20enrollment%20reusable%20widget/my_enrollment_header.dart';
import 'package:wbl/Reusable%20Widgets/My%20enrollment%20reusable%20widget/my_enrollment_searchdropdown.dart';
import 'package:wbl/Reusable%20Widgets/My%20enrollment%20reusable%20widget/my_enrollment_textfromfield.dart';

import '../../../Reusable Widgets/Welcome Page Reusable Widgets/my_welcome_header.dart';

class WblOpportunitiesApplyForm extends StatefulWidget {
  const WblOpportunitiesApplyForm({super.key});
  @override
  State<WblOpportunitiesApplyForm> createState() =>
      _WblOpportunitiesApplyFormState();
}

final TextEditingController _firstNameController = TextEditingController();
final TextEditingController _lastNameController = TextEditingController();
final TextEditingController _mobileNumberController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _nationalityController = TextEditingController();
final TextEditingController _stateController = TextEditingController();
final TextEditingController _cityController = TextEditingController();
final TextEditingController _aboutYourselfController = TextEditingController();
final TextEditingController _degreeController = TextEditingController();
final TextEditingController _streamController = TextEditingController();
final TextEditingController _dateController = TextEditingController();
final TextEditingController _semesterController = TextEditingController();
final TextEditingController _percenatgeController = TextEditingController();
final TextEditingController _passYearController = TextEditingController();
final TextEditingController _percenatgePursuingController =
    TextEditingController();
final TextEditingController _graduationDateController = TextEditingController();
// final TextEditingController _genderController = TextEditingController();

String? validateData(String? data, String? validateString) {
  final RegExp nameRegx = RegExp(r'^[a-zA-Z]+(?: [a-zA-Z]+)*$');
  String? trimmedData = data?.trim();
  if (trimmedData == null || trimmedData.isEmpty) {
    return validateString;
  } else if (!nameRegx.hasMatch(trimmedData)) {
    return validateString;
  }
  return null;
}

String? validateDropdown(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please select an option';
  }
  return null;
}

String? _validateChoiceCategory() {
  return selectedCategory.isEmpty ? 'Please select a gender' : null;
}

String? _validateChoiceGender() {
  return selectedGender.isEmpty ? 'Please select a gender' : null;
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

String? validateMobileNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your mobile number';
  }

  if (value.length != 10) {
    return 'Mobile number must be exactly 10 digits';
  }

  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
    return 'Please enter a valid mobile number';
  }

  int mobileNumber = int.tryParse(value) ?? 0;

  if (mobileNumber <= 5000000000 || mobileNumber >= 9999999999) {
    return 'Invalid format';
  }

  return null;
}

bool _isSubmitPressedGender = false;
bool _isSubmmittedPressedCategory = false;
List<String> genderOptions = ['Male', 'Female', 'Other'];
String selectedGender = '';
List<String> categoryOptions = ['SC', 'ST', 'EWS', 'Women'];
String selectedCategory = '';
String? selectedState = 'Select';
List<String> state = [
  'Andaman and Nicobar Islands',
  'Andhra Pradesh',
  'Arunachal Pradesh',
  'Assam'
      'Bihar'
      'Chandigarh',
  'Chhattisgarh',
  'Dadra and Nagar Haveli and Daman and Diu',
  'Delhi',
  'Goa',
  'Gujarat',
  'Haryana',
  'Himachal Pradesh',
  'Jammu and Kashmir',
  'Jharkhand',
  'Karnataka',
  'Kerala',
  'Ladakh',
  'Lakshadweep',
  'Madhya Pradesh',
  'Maharashtra',
  'Manipur',
  'Meghalaya',
  'Mizoram',
  'Nagaland',
  'Odisha',
  'Puducherry',
  'Punjab',
  'Rajasthan',
  'Sikkim',
  'Tamil Nadu',
  'Telangana',
  'Tripura',
  'Uttar Pradesh',
  'Uttarakhand',
  'West Bengal',
];
String? selectedDegree;
List<String> degreeOptions = ['B Tech', 'B.E', 'MCA', 'MSc'];
List<String> semesterOptions = ['7th', '8th', 'Final year(MCA/Msc)'];
String selectedsemester = '';
List<String> passYearOptions = [
  '2021',
  '2022',
  '2023',
  '2024',
  '2025',
  '2026',
  '2027'
];
bool buttonClickedPassout = false;
bool buttonClickedPursuing = false;

class _WblOpportunitiesApplyFormState extends State<WblOpportunitiesApplyForm> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
      setState(() {
        _graduationDateController.text =
            DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    // ignore: unused_local_variable
    final screenHeight = screenSize.height;
    return Scaffold(
      appBar: AppBar(
        title: const MyWelcomeHeader(),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                color: const Color(0xffF0F9FA),
                child: const Column(children: [
                  Header(title: 'Application Form'),
                ]),
              ),
              Container(
                color: Colors.blue[60],
                width: screenWidth,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * .07,
                      vertical: screenWidth * .02),
                  child: Card(
                    color: Colors.white, //white card
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * .02,
                          vertical: screenWidth * .04),
                      child: Column(children: [
                        Card(
                          // green card
                          color: const Color.fromARGB(255, 224, 243, 232),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                spaceBwWidgets(),
                                Column(
                                  children: [
                                    myText('C-DAC, Mohali', Colors.black, 18,
                                        FontWeight.bold)
                                  ],
                                ),
                                Column(
                                  children: [
                                    myText(
                                      'Artificial Intelligence (AI) and Machine Learning , Digital Health , eGovernance , Cyber Security , Embedded Systems',
                                      const Color.fromARGB(255, 94, 92, 92),
                                      15,
                                      FontWeight.normal,
                                    ),
                                  ],
                                ),
                                divider(),
                                rowTOColumn(
                                  [
                                    MyTextFormField(
                                      label: 'First Name',
                                      hintText: 'First Name',
                                      controller: _firstNameController,
                                      validator: (value) => validateData(
                                          value, 'Please First  Name'),
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                    ),
                                    spaceBwWidgets(),
                                    MyTextFormField(
                                      label: 'Last Name',
                                      hintText: 'Last Name',
                                      controller: _lastNameController,
                                      validator: (value) => validateData(
                                          value, 'Enter Last Name'),
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                    ),
                                  ],
                                ),
                                spaceBwWidgets(),
                                rowTOColumn([
                                  MyTextFormField(
                                    label: 'Email',
                                    hintText: "Email",
                                    controller: _emailController,
                                    validator: validateEmail,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                  ),
                                  spaceBwWidgets(),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _mobileNumberController,
                                      decoration: InputDecoration(
                                        prefixText: '+91 ',
                                        labelText: 'Mobile No',
                                        hintText: 'Mobile No',
                                        hintStyle: const TextStyle(
                                            fontSize: 18.0, color: Colors.grey),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                      ),
                                      validator: validateMobileNumber,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                    ),
                                  )
                                ]),
                                spaceBwWidgets(),
                                rowTOColumn(
                                  [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          myText(
                                            'Category',
                                            Colors.black,
                                            16,
                                            FontWeight.bold,
                                          ),
                                          const SizedBox(height: 6),
                                          spaceBwWidgets(),
                                          Wrap(
                                            spacing: 10,
                                            children:
                                                categoryOptions.map((category) {
                                              return myChoiceChipButton(
                                                text: category,
                                                selected: selectedCategory ==
                                                    category,
                                                onSelected: (bool selected) {
                                                  setState(() {
                                                    selectedCategory = (selected
                                                        ? category
                                                        : null)!;
                                                    _isSubmmittedPressedCategory =
                                                        false;
                                                  });
                                                },
                                              );
                                            }).toList(),
                                          ),
                                          if (_isSubmmittedPressedCategory &&
                                              _validateChoiceCategory() != null)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Text(
                                                _validateChoiceCategory()!,
                                                style: TextStyle(
                                                    color: Colors.red[900],
                                                    fontSize: 12.5),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          myText('Gender', Colors.black, 16,
                                              FontWeight.bold),
                                          const SizedBox(height: 6),
                                          Wrap(
                                            spacing: 10,
                                            children:
                                                genderOptions.map((option) {
                                              return myChoiceChipButton(
                                                text: option,
                                                selected:
                                                    selectedGender == option,
                                                onSelected: (bool selected) {
                                                  setState(() {
                                                    selectedGender =
                                                        selected ? option : '';
                                                    _isSubmitPressedGender =
                                                        false;
                                                  });
                                                },
                                              );
                                            }).toList(),
                                          ),
                                          if (_isSubmitPressedGender &&
                                              _validateChoiceGender() != null)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Text(
                                                _validateChoiceGender()!,
                                                style: TextStyle(
                                                    color: Colors.red[900],
                                                    fontSize: 12.5),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                spaceBwWidgets(),
                                rowTOColumn([
                                  MyTextFormField(
                                    label: 'Nationality',
                                    hintText: 'Nationality',
                                    controller: _nationalityController,
                                    validator: (value) => validateData(
                                        value, 'Please Enter Nationality'),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                  ),
                                  spaceBwWidgets(),
                                  MyEnrollmentSearchdropdown(
                                      dropdownItems: state,
                                      hintText: 'Select State',
                                      controller: _stateController,
                                      validator: validateDropdown,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction),
                                ]),
                                spaceBwWidgets(),
                                rowTOColumn(
                                  [
                                    MyTextFormField(
                                      label: 'City',
                                      hintText: 'City',
                                      controller: _cityController,
                                      validator: (value) => validateData(
                                          value, 'Enter your City'),
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                    ),
                                    spaceBwWidgets(),
                                    Expanded(
                                      child: TextFormField(
                                        maxLines: 13,
                                        minLines: 1,
                                        controller: _aboutYourselfController,
                                        decoration: InputDecoration(
                                          labelText: 'About Yourself',
                                          hintText: 'About Yourself',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          fillColor: Colors.white,
                                          filled: true,
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please Enter About Yourself';
                                          }
                                          return null;
                                        },
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        spaceBwWidgets(),
                        Card(
                          color: Colors.blue[50],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                myTextBold('Education Qualification'),
                                divider(),
                                spaceBwWidgets(),
                                rowTOColumn(
                                  [
                                    MyEnrollmentSearchdropdown(
                                        dropdownItems: degreeOptions,
                                        hintText: 'Graduation Disciplin',
                                        controller: _degreeController,
                                        validator: validateDropdown,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction),
                                    spaceBwWidgets(),
                                    MyTextFormField(
                                      label: 'Stream',
                                      hintText: 'Strem',
                                      controller: _streamController,
                                      validator: (value) => validateData(
                                        value,
                                        'Please Enter Stream',
                                      ),
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                    ),
                                  ],
                                ),
                                spaceBwWidgets(),
                                Column(
                                  children: [
                                    rowTOColumn(
                                      [
                                        Expanded(
                                          child: Wrap(
                                            children: [
                                              myElevatedButton(
                                                'pursuing',
                                                () {
                                                  setState(() {
                                                    buttonClickedPassout =
                                                        false;
                                                    buttonClickedPursuing =
                                                        true;
                                                  });
                                                },
                                              ),
                                              spaceBwWidgets(),
                                              myElevatedButton('Passout', () {
                                                setState(() {
                                                  buttonClickedPassout = true;
                                                  buttonClickedPursuing = false;
                                                });
                                              }),
                                            ],
                                          ),
                                        ),
                                        spaceBwWidgets(),
                                        if (buttonClickedPassout)
                                          MyEnrollmentSearchdropdown(
                                              dropdownItems: passYearOptions,
                                              hintText: 'PassYear',
                                              controller: _passYearController,
                                              validator: validateDropdown,
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction),
                                        if (buttonClickedPursuing)
                                          MyEnrollmentSearchdropdown(
                                              dropdownItems: semesterOptions,
                                              hintText: 'Semester',
                                              controller: _semesterController,
                                              validator: validateDropdown,
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction),
                                      ],
                                    ),
                                  ],
                                ),
                                spaceBwWidgets(),
                                if (buttonClickedPassout)
                                  rowTOColumn([
                                    MyTextFormField(
                                        label: 'Percentage Scored',
                                        hintText: 'Percentage Scored',
                                        controller:
                                            _percenatgePursuingController,
                                        validator: (value) => validateData(
                                            value,
                                            'Please Enter Percenatge SCored')),
                                    spaceBwWidgets(),
                                    Expanded(
                                      child: TextFormField(
                                          controller: _graduationDateController,
                                          decoration: InputDecoration(
                                            labelText: 'Date of Geaduation',
                                            filled: true,
                                            fillColor: Colors.white,
                                            suffixIcon: IconButton(
                                              icon: const Icon(
                                                  Icons.calendar_today),
                                              onPressed: () =>
                                                  _selectDate(context),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          readOnly: true,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Select the Date of Joining';
                                            }
                                            return null;
                                          }),
                                    ),
                                  ]),
                                if (buttonClickedPursuing)
                                  rowTOColumn([
                                    MyTextFormField(
                                        label: 'Percentage Scored',
                                        hintText: 'Percentage Scored',
                                        controller: _percenatgeController,
                                        validator: (value) => validateData(
                                            value,
                                            'Please Enter Percenatge Scored')),
                                    spaceBwWidgets(),
                                    Expanded(
                                      child: TextFormField(
                                          controller: _dateController,
                                          decoration: InputDecoration(
                                            labelText: 'Date of joining',
                                            filled: true,
                                            fillColor: Colors.white,
                                            suffixIcon: IconButton(
                                              icon: const Icon(
                                                  Icons.calendar_today),
                                              onPressed: () =>
                                                  _selectDate(context),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          readOnly: true,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Select the Date of Joining';
                                            }
                                            return null;
                                          }),
                                    ),
                                  ]),
                              ],
                            ),
                          ),
                        ),
                        spaceBwWidgets(),
                        rowTOColumn([
                          const Text(
                              'Application Id: WBL_1214607636_adv_1_2024')
                        ]),
                        const Divider(
                          color: Colors.black,
                          thickness: .9,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                _firstNameController.clear();
                                _lastNameController.clear();
                                _emailController.clear();
                                _mobileNumberController.clear();
                                // _genderController.clear();
                                _nationalityController.clear();
                                _cityController.clear();
                                _stateController.clear();
                                _aboutYourselfController.clear();
                                _graduationDateController.clear();
                                _streamController.clear();
                                _semesterController.clear();
                                _passYearController.clear();
                                _percenatgeController.clear();
                                _dateController.clear();
                                _percenatgePursuingController.clear();
                                setState(() {
                                  selectedCategory = '';
                                  selectedGender = '';
                                  _isSubmitPressedGender = false;
                                  _isSubmmittedPressedCategory = false;
                                });

                                formKey.currentState!.reset();
                              },
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.green,
                                  backgroundColor: Colors.white,
                                  side: const BorderSide(
                                    color: Colors.green,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10)),
                              child: const Text(
                                'Clear All',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            spaceBwWidgets(),
                            CustomElevatedButton(
                              text: 'Apply',
                              onPressed: () {
                                if (formKey.currentState!.validate() &&
                                    _validateChoiceCategory() == null &&
                                    _validateChoiceGender() == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Form Submitted Successfully')),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Please fix the errors')),
                                  );
                                }
                                setState(() {
                                  // _isSubmitPressedGender = !isGenderValid;
                                  // _isSubmmittedPressedCategory =
                                  //     !isCategoryValid;
                                  _isSubmmittedPressedCategory = true;
                                  _isSubmitPressedGender = true;
                                  // if (_validateChoice() == null) {}
                                });
                              },
                              color: Colors.green,
                            )
                          ],
                        )
                      ]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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

  Widget myChoiceChipButton({
    required String text,
    required bool selected,
    required Function(bool) onSelected,
  }) {
    return ChoiceChip(
      label: Text(
        text,
        style: TextStyle(
          color: selected ? Colors.black : Colors.black,
          // fontWeight: FontWeight.bold,
        ),
      ),
      shape: StadiumBorder(
          side: BorderSide(color: Colors.blue.shade900, width: 0.8)),
      selectedColor: Colors.green[50],
      backgroundColor: Colors.green[50],
      selected: selected,
      pressElevation: 0,
      onSelected: onSelected,
    );
  }

  Widget myText(
      // ignore: non_constant_identifier_names
      String text,
      Color color,
      double fontsize,
      FontWeight fontWeight) {
    return Text(
      text,
      style:
          TextStyle(fontSize: fontsize, color: color, fontWeight: fontWeight),
    );
  }

  Widget myTextBold(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Widget myElevatedButton(String text, Function()? onpressed) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.transparent,
            backgroundColor: Colors.blue[50],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: BorderSide(color: Colors.blue.shade900, width: 0.8))),
        onPressed: onpressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
    );
  }
}
