import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddAssessment extends StatefulWidget {
  const AddAssessment({super.key});

  @override
  State<AddAssessment> createState() => AddAssessmentState();
}

List<String> options = ['fail', 'pass'];
List<String> promotedoption = ['not promoted', 'promoted'];

class AddAssessmentState extends State<AddAssessment> {
  String selectedvalue = '';
  // ignore: non_constant_identifier_names
  String promoted_value = '';
  String? selectedFileName;
  String? errorMessage;

  TextEditingController documentController = TextEditingController();
  static const int maxFileSize = 200 * 1024;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'bmp', 'pdf'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;

      if (file.size > maxFileSize) {
        setState(() {
          errorMessage =
              'File size is larger than 200KB, please upload less then 200KB,';
          selectedFileName = null;
          documentController.clear();
        });
      } else {
        setState(() {
          errorMessage = null;
          selectedFileName = file.name;
          documentController.text = selectedFileName!;
        });
      }
    } else {}
  }

  @override
  void dispose() {
    documentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Card(
              color: const Color.fromARGB(255, 198, 222, 241),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Add assessment",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 0.3,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: documentController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Document',
                        hintText: 'Select document',
                        border: const OutlineInputBorder(),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  const Color.fromARGB(255, 91, 168, 231),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                            onPressed: _pickFile,
                            child: const Text('Upload'),
                          ),
                        ),
                      ),
                      readOnly: true,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    if (errorMessage != null)
                      Text(
                        errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    const SizedBox(height: 16),
                    const Text('Format: - JPG, JPEG, PNG, BMP, PDF'),
                    const SizedBox(height: 8),
                    const Text('Size less than: 200KB'),
                    const SizedBox(height: 16),
                    const Text(
                      "Assessment Status",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 300,
                      child: Row(
                        children: [
                          Flexible(
                            child: ListTile(
                              title: const Text('Fail'),
                              leading: Radio(
                                value: options[0],
                                groupValue: selectedvalue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedvalue = value.toString();
                                  });
                                },
                              ),
                            ),
                          ),
                          Flexible(
                            child: ListTile(
                              title: const Text('Pass'),
                              leading: Radio(
                                value: options[1],
                                groupValue: selectedvalue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedvalue = value.toString();
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (selectedvalue == 'pass') ...[
                      const SizedBox(height: 8),
                      const Text(
                        'Promotion Status',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 350,
                        child: Row(
                          children: [
                            Flexible(
                              child: ListTile(
                                title: const Text('Not Promoted'),
                                leading: Radio(
                                  value: promotedoption[0],
                                  groupValue: promoted_value,
                                  onChanged: (value) {
                                    setState(() {
                                      promoted_value = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ),
                            Flexible(
                              child: ListTile(
                                title: const Text('Promoted'),
                                leading: Radio(
                                  value: promotedoption[1],
                                  groupValue: promoted_value,
                                  onChanged: (value) {
                                    setState(() {
                                      promoted_value = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  shape: const RoundedRectangleBorder(),
                  side: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {},
                child: const Text('Submit'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
