import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:wbl/Pages/Welcome%20Page/WBL%20opportunities/wbl_opportunities_apply_form.dart';
import 'package:wbl/Reusable%20Widgets/My%20enrollment%20reusable%20widget/my_enroll_row_to_column.dart';
import 'package:wbl/Reusable%20Widgets/My%20enrollment%20reusable%20widget/my_enrollment_elevated_button.dart';
import 'package:wbl/Reusable%20Widgets/My%20enrollment%20reusable%20widget/my_enrollment_header.dart';
import 'package:wbl/Reusable%20Widgets/My%20enrollment%20reusable%20widget/my_enrollment_searchdropdown.dart';
import 'package:wbl/Reusable%20Widgets/My%20enrollment%20reusable%20widget/my_enrollment_textfromfield.dart';
import 'dart:io';
import 'package:wbl/Reusable%20Widgets/My%20enrollment%20reusable%20widget/my_enrollment_radio_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

import '../../../../Reusable Widgets/Welcome Page Reusable Widgets/my_welcome_header.dart';

class CandidateEnrollmentForm extends StatefulWidget {
  const CandidateEnrollmentForm({super.key});
  @override
  State<CandidateEnrollmentForm> createState() =>
      _CandidateEnrollmentFormState();
}

class _CandidateEnrollmentFormState extends State<CandidateEnrollmentForm> {
  bool buttonClickedPassout = false;
  bool buttonClickedPursuing = false;
  String? selectedYear;
  String? selectedState = 'Select';
  String selectedGraduaction = 'Select';
  String? selectCenter = 'Select';
  List<String> centers = [];
  String? selectedPursuing;
  String _selecteGender = '';
  String _selecteCategory = '';
  String? errorMsgPreviewClick;
  File? selectedFile;
  File? selectedCaste;
  Platform? selectedFilesCaste;
  String? _errorMsgPreviewClickRadio;
  String? _errorMsgPreviewClickRadioGender;
  String? errorMsgPreviewClickPickImage;
  File? selectedImages;
  String? selectedFileName;
  PlatformFile? selectedFileUpload;
  String? errorMsgPreviewClickUpload;
  String? errorMsgPreviewClickDegree;
  String? selectOptionPassYear;
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
  List<String> pursuing = [
    'Select Pursuing Year',
    'Seven',
    'Eight',
    'Final_Year',
  ];
  List<String> passout = [
    'Select Passout Year',
    '2020',
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
  ];
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _categoryDocController = TextEditingController();
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _fathersNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _addressController = TextEditingController();
  final _districtController = TextEditingController();
  final _postalController = TextEditingController();
  final _collegeController = TextEditingController();
  final _universityController = TextEditingController();
  final _cityController = TextEditingController();
  final _organizationController = TextEditingController();
  final _centerController = TextEditingController();
  final _technologyController = TextEditingController();
  final _graduationController = TextEditingController();
  final _stateController = TextEditingController();
  final _stateAddressController = TextEditingController();
  final _uploadDegreeController = TextEditingController();
  final TextEditingController _fileController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker(); //initialize image picker
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      //not null
      final int fileSize = await image.length(); //size of an image in bytes
      final String fileExtension = image.name.split('.').last.toLowerCase();
      if (fileSize > 200 * 1024) {
        setState(() {
          errorMsgPreviewClickPickImage = "File size must be less than 200 KB.";
          selectedImages = null;
        });
      } else if (!['jpg', 'jpeg', 'png', 'bmp'].contains(fileExtension)) {
        setState(() {
          errorMsgPreviewClickPickImage =
              "Invalid file format. Supported formats: JPG, JPEG, PNG, BMP.";
          selectedImages = null; // Reset selectedImage if invalid
        });
      } else {
        setState(() {
          selectedImages = File(image.path); // Store the picked image
          //If both file size and format are valid, the picked image is stored in the selectedImages variable, and any error message is cleared.
          errorMsgPreviewClickPickImage =
              null; // Clear any previous error message
        });
      }
    } else {
      // Handle the case when the user cancels the picker function sets an error message
      setState(() {
        errorMsgPreviewClickPickImage = 'No image selected';
        selectedImages = null; // Reset selectedImage
      });
    }
  }

  void _onPreviewButtonPressed() {
    // Check if a radio button is selected
    if (_selecteCategory.isEmpty) {
      setState(() {
        _errorMsgPreviewClickRadio =
            'Please select the Category'; // Set error message
      });
    } else {
      // Proceed with the preview action
      setState(() {
        _errorMsgPreviewClickRadio = null; // Clear error message
      });
      // Add your preview logic here
    }
  }

  void _onPreviewButtonPressedGender() {
    if (_selecteGender.isEmpty) {
      setState(() {
        _errorMsgPreviewClickRadioGender = 'Please select the gender';
      });
    } else {
      setState(() {
        _errorMsgPreviewClickRadioGender = null;
      });
    }
  }

  void previewClickImage() {
    setState(() {
      if (selectedImages == null) {
        errorMsgPreviewClickPickImage = 'Please upload an Image';
      } else {
        _imageController.text = 'Image is selected';
        errorMsgPreviewClickPickImage = null;
      }
    });
  }

  final TextEditingController _documentController = TextEditingController();
  static const int maxFileSize = 200 * 1024;
  Future<void> _pickFileDegree() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'bmp', 'pdf'],
      withData: true,
    );

    if (result != null) {
      PlatformFile file = result.files.first;

      if (file.size > maxFileSize) {
        setState(() {
          errorMsgPreviewClickUpload =
              'File size is larger than 200KB, please upload less then 200KB,';
          selectedFileName = null;
          selectedFileUpload = null;
          _documentController.clear();
        });
      } else {
        setState(() {
          selectedFileName = file.name;
          selectedFileUpload = file;
          _documentController.text = selectedFileName!;
          errorMsgPreviewClickUpload = null;
        });
      }
    } else {
      setState(() {
        errorMsgPreviewClickUpload = 'No file selected.';
      });
    }
  }

  String? selectedFileNameCast;
  PlatformFile? selectedFileCast;
  String? errorMsgPreviewClickCaste;
  final TextEditingController _casteController = TextEditingController();
  static const int maxFileSizeCaste = 200 * 1024;
  Future<void> _pickFileCaste() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'bmp', 'pdf'],
      withData: true,
    );

    if (result != null) {
      PlatformFile file = result.files.first;

      if (file.size > maxFileSizeCaste) {
        setState(() {
          errorMsgPreviewClickCaste =
              'File size is larger than 200KB, please upload a file smaller than 200KB.';
          selectedFileNameCast = null;
          selectedFileCast = null;
          _casteController.clear();
        });
      } else {
        setState(() {
          selectedFileNameCast = file.name;
          selectedFileCast = file;
          _casteController.text = selectedFileNameCast!;
          errorMsgPreviewClickCaste = null;
        });
      }
    } else {
      setState(() {
        errorMsgPreviewClickCaste = 'No file selected.';
      });
    }
  }

  void previewClickCaste() {
    setState(() {
      if (selectedFileCast == null) {
        errorMsgPreviewClickCaste = 'Please upload a file.';
      } else {
        _casteController.text = selectedFileCast!.name;
        errorMsgPreviewClickCaste = null;
      }
    });
  }

  void previewClickDegree() {
    setState(() {
      if (selectedFileUpload == null) {
        errorMsgPreviewClickUpload = 'Please upload a file.';
      } else {
        _documentController.text = selectedFileUpload!.name;
        errorMsgPreviewClickUpload = null;
      }
    });
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'please enter a valid email';
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

  String? validateID(String? value) {
    final RegExp idPattern = RegExp(r'^STU[a-zA-Z0-9{23}$]');
    if (value == null || value.isEmpty) {
      return 'Please enter a valid AICTE ID';
    }
    if (!idPattern.hasMatch(value)) {
      return 'AICTE ID should start with "STU" followed by 23 alphanumeric characters.';
    }
    if (value.length != 26) {
      return 'Please enter a Valid AICTE ID';
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

    return null; // If all validations pass
  }

  String? validatePostalCode(String? postalCode) {
    final RegExp postalCodeRegex = RegExp(r'^\d{6}$');
    if (postalCode == null || postalCode.isEmpty) {
      return 'Please enter postal code';
    } else if (!postalCodeRegex.hasMatch(postalCode)) {
      return 'Enter a valid postal code (exactly 6 digits)';
    }
    return null; // No errors, return null
  }

  String? validateDropdown(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select an option';
    }
    return null; // Valid selection
  }

  String? validateDropdownSelect(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select an option';
    }
    return null;
  }

  List<String> dropdownTechnology = [
    '3D Printing',
    '3D Printing & Additive Manufacturing',
    'Accessibility Based Applications',
    'Accessibility or Usability or Human-Computer Interaction',
    'Additive Manufacturing',
    'Additive Manufacturing, Sensors',
    'AI & ML using Python',
    'Android Application Development',
    'Android Programming',
    'Additive Manufacturing',
    'App Development',
    'Application Aware Firewall',
    'AR & VR',
    'Artificial Intelligence',
    'Artificial Intelligence (AI) and Machine Learning',
    'Artificial Intelligence (AI) and Machine Learning',
    'Augmented Reality & Virtual Reality (AR/VR)',
    'Augmented Reality & Virtual Reality (AR/VR)',
    'Big Data Analytics	',
    'Big Data',
    'BlockChain',
    'Blockchain (Ethereum)',
    'Blockchain (Hyperledger)',
    'Blockchain Technology',
    'Brain Computing',
    'Brain Computing',
    'C++',
  ];

  List<String> state = [
    'Andhra Pradesh',
    'himachal',
    'Assam',
    'Bihar',
    'Chandigarh',
  ];
  List<String> graduationDiscipline = [
    'BTech',
    'MCA',
    'BE',
    'MSc',
  ];
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
      formKey.currentState?.validate();
    }
  }

  Future<void> _selectDOB(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dobController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
      formKey.currentState?.validate();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    // final screenHeight = screenSize.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MyWelcomeHeader(),
            const Header(title: 'WBL Enrollment Form'),
            Form(
              key: formKey,
              child: Card(
                color: const Color(0xfff0f9fa),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Center(
                            child: Stack(
                              children: [
                                imagePreview(),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    child: IconButton(
                                      onPressed: () {
                                        pickImage();
                                      },
                                      icon: const Icon(Icons.edit_outlined),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (errorMsgPreviewClickPickImage != null)
                                Text(
                                  errorMsgPreviewClickPickImage!,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Photo',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Format: JPG, JPEG, PNG, BMP\nSize less than: 200KB',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    spaceBwWidgets(),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * .08),
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth * .02),
                          child: Card(
                            child: Container(
                              padding: EdgeInsets.all(screenWidth * .02),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 224, 243,
                                    232), // Light green background
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      headingText('Internship Details'),
                                    ],
                                  ),
                                  divider(),
                                  MyRowToColumn(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MyTextFormField(
                                          label: 'AICTE ID',
                                          hintText: 'AICTE ID',
                                          controller: _idController,
                                          validator: validateID,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MyEnrollmentSearchdropdown(
                                          dropdownItems: organization,
                                          hintText: 'Select',
                                          controller: _organizationController,
                                          validator: validateDropdown,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                        ),
                                      ),
                                    ],
                                  ),
                                  spaceBwWidgets(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: MyRowToColumn(
                                      children: [
                                        centerDropdown(),
                                        // spaceBwWidgets(),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: MyEnrollmentSearchdropdown(
                                            dropdownItems: dropdownTechnology,
                                            hintText: 'Select Technology',
                                            controller: _technologyController,
                                            validator: validateDropdown,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // spaceBwWidgets(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: MyRowToColumn(
                                      children: [
                                        if (MediaQuery.sizeOf(context).width >=
                                            600)
                                          const Expanded(child: SizedBox()),
                                        if (MediaQuery.sizeOf(context).width >=
                                            600)
                                          // spaceBwWidgets(),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: myDate(_dateController,
                                                'Date of joining', _selectDate),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    //next card
                    spaceBwWidgets(),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * .08),
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth * .02),
                          child: Card(
                            child: Container(
                              padding: EdgeInsets.all(screenWidth * .02),
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  headingText('Basics Information'),
                                  divider(),
                                  spaceBwWidgets(),
                                  MyRowToColumn(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MyTextFormField(
                                          label: 'First  Name',
                                          hintText: 'First Name',
                                          controller: _nameController,
                                          validator: (value) => validateData(
                                              value, 'Enter  Name'),
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                        ),
                                      ),
                                      // spaceBwWidgets(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MyTextFormField(
                                          label: 'Last Name',
                                          hintText: 'Last Name',
                                          controller: _lastNameController,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Enter Last Name';
                                            }
                                            return null;
                                          },
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                        ),
                                      ),
                                    ],
                                  ),
                                  spaceBwWidgets(),
                                  MyRowToColumn(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MyTextFormField(
                                          label: 'Fathers Name',
                                          hintText: 'Fathers Name',
                                          controller: _fathersNameController,
                                          validator: (value) => validateData(
                                              value, 'Enter Fathers Name'),
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                        ),
                                      ),
                                      // spaceBwWidgets(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: myDate(_dobController, 'D.O.B.',
                                            _selectDOB),
                                      ),
                                    ],
                                  ),
                                  spaceBwWidgets(),
                                  MyRowToColumn(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MyTextFormField(
                                          label: 'Mobile Name',
                                          hintText: 'Mobile Name',
                                          controller: _mobileController,
                                          validator: validateMobileNumber,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                        ),
                                      ),
                                      // spaceBwWidgets(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MyTextFormField(
                                          label: 'E Mail',
                                          hintText: 'E Mail',
                                          controller: _emailController,
                                          validator: validateEmail,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                        ),
                                      ),
                                    ],
                                  ),
                                  spaceBwWidgets(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Category',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      spaceBwWidgets(),
                                      MyRowToColumn(
                                        children: [
                                          Expanded(
                                            child: Wrap(
                                              spacing: 10,
                                              runSpacing: 10,
                                              children: [
                                                MyRadioButton(
                                                  value: 'SC',
                                                  groupValue: _selecteCategory,
                                                  label: 'SC',
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      _selecteCategory =
                                                          newValue!;
                                                      _errorMsgPreviewClickRadio =
                                                          null;
                                                    });
                                                  },
                                                ),
                                                // spaceBwWidgets(),
                                                MyRadioButton(
                                                  value: 'ST',
                                                  groupValue: _selecteCategory,
                                                  label: 'ST',
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      _selecteCategory =
                                                          newValue!;
                                                      _errorMsgPreviewClickRadio =
                                                          null;
                                                    });
                                                  },
                                                ),
                                                // spaceBwWidgets(),
                                                MyRadioButton(
                                                  value: 'EWS',
                                                  groupValue: _selecteCategory,
                                                  label: 'EWS',
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      _selecteCategory =
                                                          newValue!;
                                                      _errorMsgPreviewClickRadio =
                                                          null;
                                                    });
                                                  },
                                                ),
                                                // spaceBwWidgets(),
                                                MyRadioButton(
                                                  value: 'Women',
                                                  groupValue: _selecteCategory,
                                                  label: 'Women',
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      _selecteCategory =
                                                          newValue!;
                                                      _errorMsgPreviewClickRadio =
                                                          null;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (_selecteCategory != 'Women')
                                            Expanded(
                                              child: uploadDoc(
                                                controller: _casteController,
                                                label: 'Category Document',
                                                hintText: 'Category Document',
                                                buttonText: 'Upload',
                                                onPressed: _pickFileCaste,
                                                selectedFileUpload:
                                                    selectedFileCast,
                                                errorMsg:
                                                    errorMsgPreviewClickCaste,
                                              ),
                                            ),
                                        ],
                                      ),
                                      if (_errorMsgPreviewClickRadio != null)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Text(
                                            _errorMsgPreviewClickRadio!,
                                            style: TextStyle(
                                                color: Colors.red[900],
                                                fontSize: 12),
                                          ),
                                        ),
                                      const SizedBox(height: 16),
                                    ],
                                  ),
                                  const Text(
                                    "Gender",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  spaceBwWidgets(),
                                  Wrap(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          MyRadioButton(
                                              value: 'Male',
                                              groupValue: _selecteGender,
                                              label: 'Male',
                                              onChanged: (String? newVlaue) {
                                                setState(() {
                                                  _selecteGender = newVlaue!;
                                                  _errorMsgPreviewClickRadioGender =
                                                      null;
                                                });
                                              }),
                                          spaceBwWidgets(),
                                          MyRadioButton(
                                              value: 'Female ',
                                              groupValue: _selecteGender,
                                              label: 'Female',
                                              onChanged: (String? newVlaue) {
                                                setState(() {
                                                  _selecteGender = newVlaue!;
                                                  _errorMsgPreviewClickRadioGender =
                                                      null;
                                                });
                                              }),
                                          spaceBwWidgets(),
                                          MyRadioButton(
                                              value: 'Others',
                                              groupValue: _selecteGender,
                                              label: 'Others',
                                              onChanged: (String? newVlaue) {
                                                setState(() {
                                                  _selecteGender = newVlaue!;
                                                  _errorMsgPreviewClickRadioGender =
                                                      null;
                                                });
                                              }),
                                        ],
                                      ),
                                    ],
                                  ),
                                  if (_errorMsgPreviewClickRadioGender != null)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Text(
                                        _errorMsgPreviewClickRadioGender!,
                                        style: TextStyle(
                                            color: Colors.red[900],
                                            fontSize: 12),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    spaceBwWidgets(),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * .08),
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth * .02),
                          child: Card(
                            child: Container(
                              padding: EdgeInsets.all(screenWidth * .02),
                              decoration: BoxDecoration(
                                color: Colors.green[50],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  headingText('Address'),
                                  divider(),
                                  spaceBwWidgets(),
                                  MyRowToColumn(
                                    children: [
                                      // SizedBox(width: 16),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MyTextFormField(
                                          label: 'Address ',
                                          hintText: 'Address',
                                          controller: _addressController,
                                          validator: (value) => validateData(
                                              value, 'Enter Address'),
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                        ),
                                      ),
                                      // spaceBwWidgets(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MyEnrollmentSearchdropdown(
                                          dropdownItems: state,
                                          hintText: 'State',
                                          controller: _stateAddressController,
                                          validator: validateDropdown,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                        ),
                                      ),
                                    ],
                                  ),
                                  spaceBwWidgets(),
                                  MyRowToColumn(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MyTextFormField(
                                          label: 'District',
                                          hintText: 'District',
                                          controller: _districtController,
                                          validator: (value) => validateData(
                                              value, 'Enter District'),
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                        ),
                                      ),
                                      // spaceBwWidgets(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MyTextFormField(
                                          label: 'Postal code',
                                          hintText: 'Postal code',
                                          controller: _postalController,
                                          validator: validatePostalCode,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    spaceBwWidgets(),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * .08),
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth * .02),
                          child: Card(
                            color: Colors.blueAccent,
                            child: Container(
                              padding: EdgeInsets.all(screenWidth * .02),
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(
                                    children: [
                                      headingText('Education Details'),
                                    ],
                                  ),
                                  divider(),
                                  spaceBwWidgets(),
                                  MyRowToColumn(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MyTextFormField(
                                          label: 'College',
                                          hintText: 'College',
                                          controller: _collegeController,
                                          validator: (value) => validateData(
                                              value, ' Please Enter College'),
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                        ),
                                      ),
                                      // spaceBwWidgets(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MyTextFormField(
                                          label: 'University',
                                          hintText: 'University',
                                          controller: _universityController,
                                          validator: (value) => validateData(
                                              value, 'Please Enter University'),
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                        ),
                                      ),
                                    ],
                                  ),
                                  spaceBwWidgets(),
                                  MyRowToColumn(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MyTextFormField(
                                          label: 'City',
                                          hintText: 'City',
                                          controller: _cityController,
                                          validator: (value) => validateData(
                                              value, 'Please Enter City'),
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                        ),
                                      ),
                                      // spaceBwWidgets(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MyEnrollmentSearchdropdown(
                                            dropdownItems: state,
                                            hintText: 'State',
                                            controller: _stateController,
                                            validator: validateDropdown,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction),
                                      ),
                                    ],
                                  ),
                                  spaceBwWidgets(),
                                  MyRowToColumn(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MyEnrollmentSearchdropdown(
                                          dropdownItems: graduationDiscipline,
                                          hintText: 'Graduation Discipline',
                                          controller: _graduationController,
                                          validator: validateDropdown,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                        ),
                                      ),
                                      // spaceBwWidgets(),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: uploadDoc(
                                            controller: _documentController,
                                            label:
                                                'Upload Degree / 5th Sem Marksheet',
                                            hintText:
                                                'Upload Degree / 5th Sem Marksheet',
                                            buttonText: 'Upload',
                                            onPressed: _pickFileDegree,
                                            selectedFileUpload:
                                                selectedFileUpload,
                                            errorMsg:
                                                errorMsgPreviewClickUpload,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  spaceBwWidgets(),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Wrap(
                                          alignment: WrapAlignment.end,
                                          children: [
                                            textSpanBold(
                                                'Passed Out Candidate:'),
                                            textSpan(' Upload Degree'),
                                            textSpanBold(
                                                ' | Pursuing Candidate: '),
                                            textSpan(
                                                ' Upload 5th Sem Marksheet')
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Wrap(
                                          alignment: WrapAlignment.end,
                                          children: [
                                            textSpan(
                                                'Format: - JPG,JPEG,PNG,BMP,PDF\n Size less than: 200KB')
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      CustomElevatedButton(
                                        text: 'Pursuing',
                                        onPressed: () {
                                          setState(() {
                                            buttonClickedPassout = false;
                                            buttonClickedPursuing = true;
                                            selectOptionPassYear = null;
                                          });
                                        },
                                        color: buttonClickedPursuing
                                            ? const Color.fromARGB(
                                                255, 19, 48, 213)
                                            : const Color.fromARGB(
                                                255, 244, 246, 247),
                                        textColor: buttonClickedPursuing
                                            ? Colors.white
                                            : const Color.fromARGB(
                                                255, 10, 9, 9),
                                        borderRadius: 15.0,
                                      ),
                                      const SizedBox(width: 16),
                                      CustomElevatedButton(
                                        text: 'Passout',
                                        onPressed: () {
                                          setState(() {
                                            buttonClickedPassout = true;
                                            buttonClickedPursuing = false;
                                            selectOptionPassYear = null;
                                          });
                                        },
                                        color: buttonClickedPassout
                                            ? const Color.fromARGB(
                                                255, 19, 48, 213)
                                            : const Color.fromARGB(
                                                255, 244, 246, 247),
                                        textColor: buttonClickedPassout
                                            ? Colors.white
                                            : const Color.fromARGB(
                                                255, 10, 9, 9),
                                        borderRadius: 15.0,
                                      ),
                                    ],
                                  ),
                                  if (selectOptionPassYear != null)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        selectOptionPassYear!,
                                        style: TextStyle(
                                            color: Colors.red[800],
                                            fontSize: 12),
                                      ),
                                    ),
                                  const SizedBox(height: 16),
                                  if (buttonClickedPursuing)
                                    myDropdownSelect(pursuing, width: 400,
                                        validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please select';
                                      }
                                      return null;
                                    }),
                                  if (buttonClickedPassout)
                                    myDropdownSelect(passout, width: 400,
                                        validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please select ';
                                      }
                                      return null;
                                    }),
                                  spaceBwWidgets(),
                                  if (buttonClickedPursuing)
                                    Text(
                                      'Select Final_Year if you are in last year of MSc/MCA',
                                      style: TextStyle(
                                          color: Colors.red[900], fontSize: 12),
                                    ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CustomElevatedButton(
                                        text: 'Clear All',
                                        onPressed: () {
                                          _emailController.clear();
                                          _cityController.clear();
                                          _dateController.clear;
                                          _dobController.clear();
                                          _categoryDocController.clear();
                                          _idController.clear();
                                          _nameController.clear();
                                          _lastNameController.clear();
                                          _fathersNameController.clear();
                                          _dobController.clear();
                                          _emailController.clear();
                                          _mobileController.clear();
                                          _addressController.clear();
                                          _districtController.clear();
                                          _postalController.clear();
                                          _collegeController.clear();
                                          _universityController.clear();
                                          _cityController.clear();
                                          _fileController.clear();
                                          _idController.clear();
                                          _imageController.clear();
                                          _documentController.clear();
                                          setState(() {
                                            selectedFileCast = null;
                                            errorMsgPreviewClickCaste;
                                            selectedFileUpload = null;
                                            errorMsgPreviewClickUpload = null;
                                            selectCenter = null;
                                            _centerController.clear();
                                            selectedImages = null;
                                            errorMsgPreviewClickPickImage =
                                                null;
                                            selectedFile = null;
                                            errorMsgPreviewClick = null;
                                          });

                                          formKey.currentState!.reset();
                                        },
                                        borderRadius: 10.0,
                                        textColor: Colors.white,
                                        color: Colors.blue,
                                      ),
                                      const SizedBox(width: 16),
                                      CustomElevatedButton(
                                        text: 'Preview',
                                        onPressed: () {
                                          previewClickImage();
                                          _onPreviewButtonPressed();
                                          _onPreviewButtonPressedGender();
                                          previewClickCaste();
                                          previewClickDegree();
                                          setState(() {
                                            if (!buttonClickedPursuing &&
                                                !buttonClickedPassout) {
                                              selectOptionPassYear =
                                                  'Please select either Pursuing or Passout.';
                                            } else {
                                              selectOptionPassYear = null;
                                            }
                                          });

                                          if (formKey.currentState!
                                              .validate()) {
                                            formKey.currentState!.save();
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Header(
                                                      title:
                                                          'WBL Enrollment Form'),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          color: Colors.white,
                                                          width: 800,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              horizontal:
                                                                  screenWidth *
                                                                      .03,
                                                              vertical:
                                                                  screenHeight *
                                                                      .01,
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                SizedBox(
                                                                    height:
                                                                        screenHeight *
                                                                            .01),
                                                                imagePreview(),
                                                                const Text(
                                                                    'Photo',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                Text(
                                                                  ' AICTE ID: ${_idController.text}',
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                spaceBwWidgets(),
                                                                myCard(
                                                                    'Internship Details',
                                                                    [
                                                                      description(
                                                                        'Technology',
                                                                        _technologyController
                                                                            .text,
                                                                      ),
                                                                      description(
                                                                        'Organization',
                                                                        _organizationController
                                                                            .text,
                                                                      ),
                                                                      description(
                                                                        'Center',
                                                                        _centerController
                                                                            .text,
                                                                      ),
                                                                      description(
                                                                        'Date of Joining',
                                                                        _dateController
                                                                            .text,
                                                                      ),
                                                                    ]),
                                                                myCard(
                                                                    'Basic Information',
                                                                    [
                                                                      description(
                                                                        ' First Name',
                                                                        _nameController
                                                                            .text,
                                                                      ),
                                                                      description(
                                                                        'Last Name',
                                                                        _lastNameController
                                                                            .text,
                                                                      ),
                                                                      description(
                                                                        'Fathers Name',
                                                                        _fathersNameController
                                                                            .text,
                                                                      ),
                                                                      description(
                                                                        'D.O.B',
                                                                        _dobController
                                                                            .text,
                                                                      ),
                                                                      description(
                                                                          'Category',
                                                                          _selecteCategory),
                                                                      description(
                                                                        'Category Documnet',
                                                                        _casteController
                                                                            .text,
                                                                      ),
                                                                      description(
                                                                          'Gender',
                                                                          selectedGender),
                                                                    ]),
                                                                myCard(
                                                                    'Address', [
                                                                  description(
                                                                    ' Address ',
                                                                    _addressController
                                                                        .text,
                                                                  ),
                                                                  description(
                                                                    'State',
                                                                    _stateController
                                                                        .text,
                                                                  ),
                                                                  description(
                                                                    'District',
                                                                    _districtController
                                                                        .text,
                                                                  ),
                                                                  description(
                                                                    'Postal Code',
                                                                    _postalController
                                                                        .text,
                                                                  ),
                                                                ]),
                                                                myCard(
                                                                    'Education Details',
                                                                    [
                                                                      description(
                                                                        ' College Name ',
                                                                        _collegeController
                                                                            .text,
                                                                      ),
                                                                      description(
                                                                        'University',
                                                                        _universityController
                                                                            .text,
                                                                      ),
                                                                      description(
                                                                        'City',
                                                                        _cityController
                                                                            .text,
                                                                      ),
                                                                      description(
                                                                        'State',
                                                                        _stateAddressController
                                                                            .text,
                                                                      ),
                                                                      description(
                                                                        'Graduation Discipline',
                                                                        _graduationController
                                                                            .text,
                                                                      ),
                                                                      description(
                                                                        'Degree',
                                                                        _uploadDegreeController
                                                                            .text,
                                                                      ),
                                                                      description(
                                                                          'Pursuing',
                                                                          selectedPursuing ??
                                                                              'N/A'),
                                                                      description(
                                                                          'Passout',
                                                                          selectedYear ??
                                                                              'N/A'),
                                                                    ]),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: [
                                                    CustomElevatedButton(
                                                      text: 'Edit',
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      color: Colors.green,
                                                    ),
                                                    CustomElevatedButton(
                                                      text: 'Submit',
                                                      onPressed: () {
                                                        // MyFun.navigatToPage(
                                                        //     context,
                                                        //     CandidateProfileDetails());
                                                      },
                                                      color: Colors.green,
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          } else {}
                                        },
                                        color: Colors.blue,
                                        textColor: Colors.white,
                                        borderRadius: 10.0,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myDropdownSelect(
    List<String> items, {
    double width = 130,
    required String? Function(String?) validator,
  }) {
    return SizedBox(
      width: width,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.grey, width: 1.5), // Added border
        ),
        child: DropdownButtonFormField(
          value: items[0],
          isExpanded: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                  color: Colors.transparent), // Transparent to avoid overlap
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
          ),
          items: items.map((String item) {
            return DropdownMenuItem<String>(value: item, child: Text(item));
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              if (items == pursuing) {
                selectedPursuing = newValue;
              }
              if (items == passout) {
                selectedYear = newValue;
              }
            });
          },
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _organizationController.addListener(() {
      if (organization.contains(_organizationController.text)) {
        setState(() {
          centers = centersByOrganization[_organizationController.text]
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
    _organizationController.dispose();
    _centerController.dispose();
    _documentController.dispose();
    _imageController.dispose();

    _uploadDegreeController.dispose();
    super.dispose();
  }

  Widget centerDropdown() {
    String? centerValidation(String? value) {
      if (_organizationController.text.isEmpty ||
          !organization.contains(_organizationController.text)) {
        return 'Please select organization first.';
      }
      if (value == null ||
          value.isEmpty ||
          !_centerController.text.contains(value)) {
        return 'Please select any option from list';
      }
      return null;
    }

    if (organization.contains(_organizationController.text)) {
      centers =
          centersByOrganization[_organizationController.text] as List<String>;
    }

    return MyEnrollmentSearchdropdown(
      dropdownItems: centers,
      hintText: 'Select Center',
      controller: _centerController,
      validator: centerValidation,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  // Widget MyRowToColumn(List<Widget> children) {
  //   if (MediaQuery.sizeOf(context).width <= 600) {
  //     return Wrap(children: children);
  //   } else {
  //     return Row(children: children);
  //   }
  // }

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

  Widget myElevatedButton(String text) {
    return ElevatedButton(
      onPressed: () {
        // Button action
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green, // Button background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(color: Colors.green),
          // Rounded corners
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Colors.green, // Text color
        ),
      ),
    );
  }

  Widget textSpan(String text) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 12.0,
        ),
      ),
    );
  }

  Widget textSpanBold(String text) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 12.0,
        ),
      ),
    );
  }

  Widget imagePreview() {
    return DottedBorder(
      borderType: BorderType.Circle,
      color: Colors.grey,
      dashPattern: const [2, 3],
      strokeWidth: 2,
      child: CircleAvatar(
        radius: 80,
        child: Container(
          width: 170,
          height: 170,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: ClipOval(
            child: selectedImages != null
                ? Image.network(
                    selectedImages!.path, //image is not null
                    // width: 50,
                    // height: 170,
                    fit: BoxFit.cover,
                  )
                : const Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.grey,
                  ),
          ),
        ),
      ),
    );
  }

  Widget uploadDoc({
    required TextEditingController controller,
    required String label,
    required String hintText,
    required String buttonText,
    required Function() onPressed,
    required PlatformFile? selectedFileUpload,
    String? errorMsg,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          readOnly:
              true, // Make it readonly as it’s meant for display, not input
          decoration: InputDecoration(
            labelText: label,
            hintText: hintText,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            fillColor: Colors.white,
            filled: true,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomElevatedButton(
                text: buttonText,
                color: Colors.blue,
                onPressed: onPressed,
              ),
            ),
          ),
        ),

        // Error message display
        if (errorMsg != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              errorMsg,
              style: TextStyle(fontSize: 13, color: Colors.red[900]),
            ),
          ),

        // File preview (image or PDF)
        if (selectedFileUpload != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Builder(
              builder: (context) {
                final extension =
                    selectedFileUpload.name.split('.').last.toLowerCase();

                if (['jpg', 'jpeg', 'png', 'bmp'].contains(extension)) {
                  // Image file preview
                  return Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.memory(
                      selectedFileUpload.bytes!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  );
                } else if (extension == 'pdf') {
                  // PDF file preview
                  return GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.picture_as_pdf,
                      size: 50,
                      color: Colors.red,
                    ),
                  );
                } else {
                  // If the file type is unsupported
                  return const Text('Unsupported file type');
                }
              },
            ),
          ),
      ],
    );
  }

  Widget myCard(String title, List<Widget> children) {
    return Card(
      color: const Color.fromARGB(255, 224, 243, 232),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Divider(),
            Wrap(
              spacing: 16.0, // Space between items horizontally
              runSpacing: 8.0, // Space between rows
              children: children,
            ),
          ],
        ),
      ),
    );
  }

  Widget description(String text, String textDes) {
    return Expanded(
      child: Container(
        width: 180,
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "$text: ",
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            Expanded(
              child: Text(
                textDes,
                style: const TextStyle(fontSize: 15),
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myDate(TextEditingController controller, String label,
      Function(BuildContext) onPressed) {
    return Expanded(
      child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            filled: true,
            fillColor: Colors.white,
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: () => onPressed(context),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          readOnly: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Select the Date of Joining';
            }
            return null;
          }),
    );
  }
}
