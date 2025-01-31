import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wbl/Reusable%20Widgets/My%20enrollment%20reusable%20widget/my_enroll_searchable_dropdown.dart';
import 'package:wbl/Reusable%20Widgets/My%20enrollment%20reusable%20widget/my_enrollment_textfromfield.dart';
import '../../../Reusable Widgets/My enrollment reusable widget/my_enrollment_elevated_button.dart';

class AddResumePage extends StatefulWidget {
  const AddResumePage({super.key});
  @override
  State<AddResumePage> createState() => _AddResumePageState();
}

class _AddResumePageState extends State<AddResumePage> {
  String? validateData(String? value, String validateString) {
    if (value == null || value.isEmpty) {
      return validateString;
    }
    return null;
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController technologyController = TextEditingController();
  final TextEditingController skillController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController _documentController = TextEditingController();
  List<String> technology = [
    '  3D Printing',
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
    'C++'
  ];
  static const int maxFileSize = 200 * 1024;
  String? errorMsgPreviewClickUpload;
  String? selectedFileName;
  PlatformFile? selectedFileUpload;
  Future<void> _pickResume() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 700,
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Add Resume',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  mySizebox(),
                  rowTOColumn([
                    MyTextFormField(
                        label: 'Candidate Name',
                        hintText: 'Candidate Name',
                        controller: nameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => validateData(
                              value,
                              ' Please Enter Candidate Name',
                            )),
                    mySizebox(),
                    MySearchableDropdownenroll(
                        dropdownItems: technology,
                        hintText: ' Please Select Technology',
                        controller: technologyController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select Technology';
                          }
                          return null;
                        })
                  ]),
                  mySizebox(),
                  rowTOColumn([
                    MyTextFormField(
                        label:
                            '5 key skillset (comma seperated. Eg:HTML,CSS,JS)',
                        hintText:
                            '5 key skillset (comma seperated. Eg:HTML,CSS,JS)',
                        controller: skillController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => validateData(
                              value,
                              'Please  enter skills',
                            )),
                    mySizebox(),
                    MyTextFormField(
                        label: 'Location',
                        hintText: 'Location',
                        controller: locationController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => validateData(
                              value,
                              'Please  enter Location',
                            )),
                  ]),
                  mySizebox(),
                  rowTOColumn([
                    Expanded(
                        child: uploadDoc(
                            controller: _documentController,
                            label: 'Resume',
                            hintText: 'Resume',
                            buttonText: 'Upload',
                            onPressed: _pickResume,
                            selectedFileUpload: selectedFileUpload,
                            errorMsg: errorMsgPreviewClickUpload)),
                    mySizebox(),
                    Expanded(
                      child: TextFormField(
                        maxLines: 15,
                        minLines: 1,
                        // maxLength: 180,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(180)
                        ],
                        decoration: InputDecoration(
                          labelText: 'About (180 charcters only)',
                          hintText: 'About (180 charcters only),',
                          hintStyle: const TextStyle(
                              fontSize: 15.0, color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                      ),
                    )
                  ]),
                  mySizebox(),
                  const Row(children: [
                    Text(
                      'Format: - JPG,JPEG,PNG,BMP,PDF\n Size less than: 200KB',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    )
                  ]),
                  mySizebox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomElevatedButton(
                          text: 'Submit',
                          color: const Color.fromARGB(255, 60, 162, 63),
                          onPressed: () {})
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget mySizebox() {
    return const SizedBox(height: 20, width: 20);
  }

  Widget rowTOColumn(List<Widget> children) {
    if (MediaQuery.sizeOf(context).width <= 600) {
      return Wrap(children: children);
    } else {
      return Row(children: children);
    }
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
          readOnly: true,
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
        if (errorMsg != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              errorMsg,
              style: TextStyle(fontSize: 13, color: Colors.red[900]),
            ),
          ),
        if (selectedFileUpload != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Builder(
              builder: (context) {
                final extension =
                    selectedFileUpload.name.split('.').last.toLowerCase();

                if (['jpg', 'jpeg', 'png', 'bmp'].contains(extension)) {
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
                  return GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.picture_as_pdf,
                      size: 50,
                      color: Colors.red,
                    ),
                  );
                } else {
                  return const Text('Unsupported file type');
                }
              },
            ),
          ),
      ],
    );
  }
}
