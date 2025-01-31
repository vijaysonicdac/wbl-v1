import 'package:flutter/material.dart';
import 'package:wbl/Reusable%20Widgets/My%20enrollment%20reusable%20widget/my_enroll_row_to_column.dart';
import 'package:wbl/Reusable%20Widgets/My%20enrollment%20reusable%20widget/my_enrollment_elevated_button.dart';
import 'package:wbl/Reusable%20Widgets/My%20enrollment%20reusable%20widget/my_enrollment_searchdropdown.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:wbl/Reusable%20Widgets/My%20enrollment%20reusable%20widget/my_enrollment_layoutbuilder.dart';
import 'package:wbl/Reusable%20Widgets/My%20enrollment%20reusable%20widget/my_enrollment_password.dart';
import 'package:wbl/Reusable%20Widgets/My%20enrollment%20reusable%20widget/my_enrollment_textField.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

import '../../../../Reusable Widgets/Welcome Page Reusable Widgets/my_welcome_header.dart';

class AdminParticipatingRegs extends StatefulWidget {
  const AdminParticipatingRegs({super.key, required this.isHeaderRequied});
  final bool isHeaderRequied;
  @override
  State<AdminParticipatingRegs> createState() => _AdminParticipatingRegsState();
}

class _AdminParticipatingRegsState extends State<AdminParticipatingRegs> {
  String? errorMessage = '';
  String? selectedFileName;
  File? selectedImages;
  String? errorMessages;
  File? pickedImage;
  final Map<String, List<String>> centersByOrganization = {
    'C-DAC': [
      'Delhi',
      'Chennai',
      'Hyderabad',
      'Kolkata',
      'Mohali',
      'Noida',
      'Patna',
      'Pune',
      'Silchar',
      'Thiruvananthapuram',
      'Bengaluru',
      'Mumbai'
    ],
    'CERT-IN': ['Delhi'],
    'CMET': ['Pune'],
    'ERNET': ['Bengaluru', 'Chennai', 'Delhi'],
    'NIELIT': [
      'Muzaffarpur',
      'Buxar',
      'Agartala',
      'Aizawl',
      'Ajmer',
      'Aurangabad',
      'Bhubaneswar',
      'Calicut',
      'Chennai',
      'Chuchuyimlang',
      'Churachandpur',
      'Daman',
      'Dibrugarh',
      'Dimapur',
      'Gangtok',
      'Gorakhpur',
      'Guwahati',
      'Haridwar',
      'Imphal',
      'Itanagar',
      'Jammu',
      'Jorhat',
      'Kargil',
      'Kohima',
      'Kokrajhar',
      'Kolkata',
      'Kurukshetra',
      'Leh',
      'Lucknow',
      'Lunglei',
      'Majuli',
      'Mandi',
      'Pali',
      'Pasighat',
      'Patna',
      'Ranchi',
      'Ropar',
      'Senapati',
      'Shillong',
      'Shimla',
      'Silchar',
      'Srinagar',
      'Tezu',
      'Tezpur',
      'Tura'
    ],
    'SAMEER': ['Chennai', 'Guwahati', 'Kolkata', 'Mumbai', 'Vizag'],
    'STQC': [
      'Bengaluru',
      'Chennai',
      'Delhi',
      'Guwahati',
      'Hyderabad',
      'Jaipur',
      'Kolkata',
      'Mohali',
      'Mumbai',
      'Pune',
      'Thiruvananthapuram'
    ],
  };
  List<String> organization = [
    'C-DAC',
    'CERT-IN',
    'CMET',
    'ERNET',
    'NIELET',
    'SAMEER'
  ];
  String? selectOrganization;
  String? selectCenter;
  List<String> centers = [];
  void onItemsSelected(String? selectedItems) {
    setState(() {
      selectOrganization = selectedItems;
    });
  }

  String? selectedImage;
  PlatformFile? selectedImageUpload;
  String? errorMessageImage;

  final controllerOrganization = TextEditingController();
  final TextEditingController controllerCenter = TextEditingController();

  final int maxFileSize = 200 * 1024;
  String? selectedImageSign;
  PlatformFile? selectedSignUpload;
  String? errorMessageSign;
  final TextEditingController _imageSignController = TextEditingController();
  static const int maxFileSizeSign = 200 * 1024;
  Future<void> _pickFileSign() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'bmp'],
      withData: true,
    );

    if (result != null) {
      PlatformFile file = result.files.first;

      if (file.size > maxFileSizeSign) {
        setState(() {
          errorMessageSign =
              'File size is larger than 200KB, please upload a file smaller than 200KB.';
          selectedImageSign = null;
          selectedSignUpload = null;
          _imageSignController.clear();
        });
      } else {
        setState(() {
          selectedImageSign = file.name;
          selectedSignUpload = file;
          _imageSignController.text = selectedImageSign!;
          errorMessageSign = null;
        });
      }
    } else {
      setState(() {
        errorMessageSign = 'No file selected.';
      });
    }
  }

  String? selectedDirectorSign;
  PlatformFile? selectedDirectorUpload;
  String? errorMessageDirectSg;
  final TextEditingController directorSignController = TextEditingController();
  Future<void> _pickDirectorSign() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'bmp'],
      withData: true,
    );

    if (result != null) {
      PlatformFile file = result.files.first;

      if (file.size > maxFileSizeSign) {
        setState(() {
          errorMessageDirectSg =
              'File size is larger than 200KB, please upload a file smaller than 200KB.';
          selectedDirectorSign = null;
          selectedDirectorUpload = null;
          designationController.clear();
        });
      } else {
        setState(() {
          selectedDirectorSign = file.name;
          selectedDirectorUpload = file;
          directorSignController.text = selectedDirectorSign!;
          errorMessageDirectSg = null;
        });
      }
    } else {
      setState(() {
        errorMessageDirectSg = 'No file selected.';
      });
    }
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final int fileSize = await image.length();

      final String fileExtension = image.name.split('.').last.toLowerCase();

      if (fileSize > 200 * 1024) {
        setState(() {
          errorMessages = "File size must be less than 200 KB.";
          selectedImages = null;
        });
      } else if (!['jpg', 'jpeg', 'png', 'bmp'].contains(fileExtension)) {
        setState(() {
          errorMessages =
              "Invalid file format. Supported formats: JPG, JPEG, PNG, BMP.";
          selectedImages = null;
        });
      } else {
        setState(() {
          selectedImages = File(image.path);
          errorMessages = null;
        });
      }
    } else {
      setState(() {
        errorMessages = 'No image selected';
        selectedImages = null;
      });
    }
  }

  void submit() {
    setState(() {
      errorMessages = null;
      errorMessageSign = null;
      if (selectedImages == null) {
        errorMessages = "Please select an image.";
      }
      if (selectedImageSign == null) {
        errorMessageSign = "Please Select your Signature";
      }
      if (selectedDirectorSign == null) {
        errorMessageDirectSg = "Please Select Director Signature";
      }
      if (selectedImages != null &&
          selectedImageSign != null &&
          selectedDirectorSign != null) {}
    });
  }

  void submitDirSign() {}

  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController mydropdownController = TextEditingController();

  String? validateData(String? data, String validationString) {
    final RegExp nameRegx = RegExp(r'^[a-zA-Z]+$');
    if (data == null || data.isEmpty) {
      return validationString;
    } else if (!nameRegx.hasMatch(data)) {
      return validationString;
    }
    return null;
  }

  String? validateDropdown(String? data) {
    if (data == null || data.isEmpty) {
      return 'Please select an option';
    }
    return null;
  }

  String? mobileValidate(String? mobileNumber) {
    final RegExp mobileRegs = RegExp(r'^\+?[0-9]{10,10}$');
    {
      if (mobileNumber == null || mobileNumber.isEmpty) {
        return 'This Field is required';
      } else if (!mobileRegs.hasMatch(mobileNumber)) {
        return 'Please enter valid mobile number';
      }
      return null;
    }
  }

  String? emailVAlidation(String? email) {
    final RegExp emailRegs = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (email == null || email.isEmpty) {
      return 'This field is required';
    } else if (!emailRegs.hasMatch(email)) {
      return 'Please enter valid email';
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

  String? confirmPasswordValidation(String? confirmpassword) {
    if (confirmpassword == null || confirmpassword.isEmpty) {
      return 'This field is required';
    } else if (confirmpassword != passwordController.text) {
      return 'Password do not match';
    }
    return null;
  }

  String? validateDAta(String? data, String validationString) {
    final RegExp nameRegx = RegExp(r'^[a-zA-Z]+$');
    if (data == null || data.isEmpty) {
      return validationString;
    } else if (!nameRegx.hasMatch(data)) {
      return validationString;
    }
    return null;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (widget.isHeaderRequied) const MyWelcomeHeader(),
              Container(
                color: const Color.fromARGB(255, 224, 243, 232),
                height: 171,
                width: screenWidth,
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(50.0),
                    child: Column(
                      children: [
                        Text(
                          'Participating Institute',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        Text('Registration',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Column(
                    children: [
                      Card(
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(screenWidth * .02),
                            child: Column(
                              children: [
                                Card(
                                  color:
                                      const Color.fromARGB(255, 224, 243, 232),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(9.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Institute Details',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Divider(
                                          height: 40,
                                          thickness: 0.2,
                                          color: Colors.black,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: rowTOColumn(
                                            [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        screenWidth * .07),
                                                child: Center(
                                                  child: Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            DottedBorder(
                                                              borderType:
                                                                  BorderType
                                                                      .Circle,
                                                              color:
                                                                  Colors.grey,
                                                              dashPattern: const [
                                                                2,
                                                                3
                                                              ],
                                                              strokeWidth: 2,
                                                              child:
                                                                  CircleAvatar(
                                                                radius: 85,
                                                                child:
                                                                    Container(
                                                                  width: 170,
                                                                  height: 170,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  child:
                                                                      ClipOval(
                                                                    child: selectedImages !=
                                                                            null
                                                                        ? Image
                                                                            .network(
                                                                            selectedImages!.path,
                                                                            width:
                                                                                170,
                                                                            height:
                                                                                170,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          )
                                                                        : const Icon(
                                                                            Icons.person,
                                                                            size:
                                                                                80,
                                                                            color:
                                                                                Colors.grey,
                                                                          ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Positioned(
                                                              top: 10,
                                                              right: 10,
                                                              child: Container(
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child:
                                                                    IconButton(
                                                                  iconSize: 18,
                                                                  onPressed:
                                                                      () {
                                                                    pickImage();
                                                                  },
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .edit_outlined),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        if (errorMessages !=
                                                            null)
                                                          Text(
                                                            errorMessages!,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .red[900],
                                                                fontSize: 12),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        const Text(
                                                          'Photo',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        const Text(
                                                          'Format: JPG, JPEG, PNG, BMP\nSize less than: 200KB',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 12),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              spaceBwWidgets(),
                                              Expanded(
                                                child: Wrap(
                                                  children: [
                                                    MyEnrollmentSearchdropdown(
                                                      dropdownItems:
                                                          organization,
                                                      hintText:
                                                          'Select Organization',
                                                      controller:
                                                          controllerOrganization,
                                                      validator:
                                                          validateDropdown,
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .onUserInteraction,
                                                    ),
                                                    spaceBwWidgets(),
                                                    centerDropdown(),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 25),
                                //green
                                Card(
                                  color: Colors.blue[50],
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          'Select Organization',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      const Divider(
                                          height: 12,
                                          thickness: 0.2,
                                          color: Colors.black),
                                      const SizedBox(height: 16),
                                      MyRowToColumn(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: MyTextfield(
                                              label: 'First Name',
                                              hintText: 'First Name',
                                              controller: nameController,
                                              validator: (value) =>
                                                  validateData(value,
                                                      'The Field is required')),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: MyTextfield(
                                            label: 'Last Name',
                                            hintText: 'Last Name',
                                            controller: lastController,
                                            validator: (value) => validateData(
                                                value,
                                                'This Field is required'),
                                          ),
                                        )
                                      ]),
                                      // SizedBox(height: ),
                                      MyRowToColumn(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: MyTextfield(
                                              label: 'Desgnation',
                                              hintText: 'Designation',
                                              controller: designationController,
                                              validator: (value) =>
                                                  validateData(value,
                                                      'The Field is required')),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: MyTextfield(
                                            label: 'Mobile Number',
                                            hintText: 'Mobile Number',
                                            controller: mobileController,
                                            validator: mobileValidate,
                                          ),
                                        )
                                      ]),
                                      MyLayout(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: MyTextfield(
                                              label: 'Username',
                                              hintText: 'Username',
                                              controller: usernameController,
                                              validator: (value) =>
                                                  validateData(value,
                                                      'The Field is required')),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: MyTextfield(
                                            label: 'Email',
                                            hintText: 'Email',
                                            controller: emailController,
                                            validator: emailVAlidation,
                                          ),
                                        )
                                      ]),
                                      MyLayout(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: MyEnrollmentPassword(
                                              controller: passwordController,
                                              hintText: 'Password',
                                              labelText: 'Password',
                                              validator: validatePassword),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: MyEnrollmentPassword(
                                              controller:
                                                  confirmPasswordController,
                                              hintText: 'Confirm Password',
                                              labelText: 'Confirm Password',
                                              validator:
                                                  confirmPasswordValidation),
                                        ),
                                      ])
                                    ],
                                  ),
                                ),

                                uploadSign('Your signature', _pickFileSign,
                                    selectedSignUpload, errorMessageSign),
                                uploadSign(
                                    'Director Signature',
                                    _pickDirectorSign,
                                    selectedDirectorUpload,
                                    errorMessageDirectSg),

                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomElevatedButton(
                                      text: 'Clear All',
                                      textColor: Colors.white,
                                      color: Colors.green,
                                      onPressed: () {
                                        nameController.clear();
                                        lastController.clear();
                                        designationController.clear();
                                        mobileController.clear();
                                        usernameController.clear();
                                        emailController.clear();
                                        passwordController.clear();
                                        confirmPasswordController.clear();

                                        setState(() {
                                          selectedDirectorUpload = null;
                                          errorMessageDirectSg;
                                          selectedImages = null;
                                          errorMessages;
                                          selectOrganization = null;
                                          controllerOrganization.clear;
                                          controllerCenter.clear;

                                          selectedSignUpload = null;
                                          errorMessageSign;
                                        });
                                      },
                                    ),
                                    const SizedBox(width: 10),
                                    CustomElevatedButton(
                                        text: 'Submit',
                                        textColor: Colors.green,
                                        color: Colors.white,
                                        onPressed: () {
                                          submit();
                                          if (_formKey.currentState!
                                              .validate()) {
                                            _formKey.currentState!.save();
                                          }
                                        }),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // first container
            ], //first children
          ),
        ), //column
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controllerOrganization.addListener(() {
      if (organization.contains(controllerOrganization.text)) {
        setState(() {
          centers = centersByOrganization[controllerOrganization.text]
              as List<String>;
        });
      } else {
        setState(() {
          centers = [];
        });
      }
    });
  }

  @override
  void dispose() {
    controllerOrganization.dispose();
    controllerCenter.dispose();
    super.dispose();
  }

  Widget centerDropdown() {
    String? centerValidation(String? value) {
      if (controllerOrganization.text.isEmpty ||
          !organization.contains(controllerOrganization.text)) {
        return 'Please select organization first.';
      }
      if (value == null ||
          value.isEmpty ||
          !controllerCenter.text.contains(value)) {
        return 'Please select any option from list';
      }
      return null;
    }

    // List<String> center = [];
    if (organization.contains(controllerOrganization.text)) {
      centers =
          centersByOrganization[controllerOrganization.text] as List<String>;
    }
    return MyEnrollmentSearchdropdown(
      dropdownItems: centers,
      hintText: 'Select Center',
      controller: controllerCenter,
      validator: centerValidation,
      autovalidateMode: AutovalidateMode.onUserInteraction,
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

  Widget uploadSign(
    String text,
    Function()? onTap,
    PlatformFile? selectedFileUpload,
    String? errorMsg,
  ) {
    return Card(
      color: const Color.fromARGB(255, 224, 243, 232),
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                )),
            const Divider(
              color: Colors.black,
              thickness: 0.2,
            ),
            const SizedBox(height: 16),
            Stack(
              children: [
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  color: Colors.black54,
                  strokeWidth: 2,
                  dashPattern: const [3, 1],
                  child: Container(
                    height: 120,
                    width: 310,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: selectedFileUpload != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.memory(
                              selectedFileUpload.bytes!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.contain,
                            ),
                          )
                        : const Center(
                            child: Text(
                              'No image selected',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: onTap, // Pass the onTap function here
                    child: Icon(
                      Icons.edit,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                if (errorMsg != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 130, left: 10),
                    child: Text(
                      errorMsg,
                      style: TextStyle(color: Colors.red[900]),
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Format: JPG, JPEG, PNG, BMP\nSize less than: 200KB',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
