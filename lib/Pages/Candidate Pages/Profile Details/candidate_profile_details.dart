import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:wbl/Pages/Login%20Page/Enrollment%20Form/Candidate%20Enrollment%20Form/candidate_enrollment_form.dart';
import 'package:wbl/Reusable%20Functions/reusable_function.dart';
import 'package:wbl/Reusable%20Widgets/My%20enrollment%20reusable%20widget/my_enrollment_elevated_button.dart';
import 'package:wbl/Reusable%20Widgets/My%20enrollment%20reusable%20widget/my_enrollment_textfromfield.dart';

class CandidateProfileDetails extends StatefulWidget {
  const CandidateProfileDetails({super.key});
  @override
  State<CandidateProfileDetails> createState() =>
      _CandidateProfileDetailsState();
}

class _CandidateProfileDetailsState extends State<CandidateProfileDetails> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController accountNoController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController branchAddressController = TextEditingController();
  Map<String, String> submittedData = {};
  String? validateAccountNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter account number';
    }
    if (!RegExp(r'^[0-9]{9,18}$').hasMatch(value)) {
      return 'Enter a valid account number (9-18 digits)';
    }
    return null;
  }

  String? validateIFSC(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter IFSC code';
    }
    if (!RegExp(r'^[A-Z]{4}0[A-Z0-9]{7}$').hasMatch(value)) {
      return 'Enter a valid IFSC code (e.g., ABCD01234567)';
    }
    return null;
  }

  String? validateNonEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  File? selectedImages;
  @override
  Widget build(BuildContext context) {
    bool isNarrowScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      body: Card(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Internship Details',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      GestureDetector(
                        onTap: () {
                          MyFun.navigatToPage(
                              context, const CandidateEnrollmentForm());
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.blue[900], shape: BoxShape.circle),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                myDivider(),
                const SizedBox(height: 20),
                Column(
                  children: [imagePreview()],
                ),
                const SizedBox(height: 50),
                isNarrowScreen
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: candidateDetail(),
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: candidateDetail().sublist(0, 5),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: candidateDetail().sublist(5, 10),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: candidateDetail().sublist(10, 15),
                            ),
                          ),
                        ],
                      ),
                const Divider(),
                rowTOColumn([
                  submittedData.isEmpty
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.green[800],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0))),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text(
                                      'Add Bank Details',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    content: SizedBox(
                                      width: 800,
                                      height: 300,
                                      child: Form(
                                        key: _formKey,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                MyTextFormField(
                                                    label: 'Account No',
                                                    hintText: 'Account No',
                                                    controller:
                                                        accountNoController,
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    validator:
                                                        validateAccountNumber),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                MyTextFormField(
                                                    label: 'IFSC Code',
                                                    hintText: 'IFSC Code',
                                                    controller:
                                                        ifscCodeController,
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    validator: validateIFSC),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                MyTextFormField(
                                                    label: 'Bank Name',
                                                    hintText: 'Bank Name',
                                                    controller:
                                                        bankNameController,
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    validator:
                                                        validateNonEmpty),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                MyTextFormField(
                                                    label: 'Branch Address',
                                                    hintText: 'Branch Address',
                                                    controller:
                                                        branchAddressController,
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    validator: validateNonEmpty)
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Wrap(
                                              alignment: WrapAlignment.start,
                                              children: [
                                                Text(
                                                  'Please fill bank details carefully, you will not be able to update it afterwards.',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey[500]),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                CustomElevatedButton(
                                                    color: Colors.red,
                                                    text: 'Cancel',
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    }),
                                                const SizedBox(width: 10),
                                                CustomElevatedButton(
                                                  color: Colors.green,
                                                  text: 'Submit',
                                                  onPressed: () {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      // If the form is valid, save the state and update submittedData
                                                      setState(() {
                                                        submittedData = {
                                                          'Account No':
                                                              accountNoController
                                                                  .text,
                                                          'IFSC Code':
                                                              ifscCodeController
                                                                  .text,
                                                          'Bank Name':
                                                              bankNameController
                                                                  .text,
                                                          'Branch Address':
                                                              branchAddressController
                                                                  .text,
                                                        };
                                                      });
                                                      Navigator.of(context)
                                                          .pop();
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                          content: Text(
                                                              'Please fill out all required fields'),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: const Row(
                            children: [
                              Text('Add Bank Details'),
                              SizedBox(width: 8),
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      : _buildSubmittedDetails(),
                ]),
                if (submittedData.isEmpty)
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double imageSize = constraints.maxWidth < 500
                          ? constraints.maxWidth * 0.8
                          : 400;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: const AssetImage('assets/images/bank.jpeg'),
                            height: imageSize,
                            width: imageSize,
                          ),
                          const Text(
                            'No bank Details',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      );
                    },
                  ),
              ],
            ),
          ),
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
                    selectedImages!.path,
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

  Widget myDivider() {
    return const Divider(
      color: Colors.black,
      thickness: 0.2,
    );
  }

  Widget rowTOColumn(List<Widget> children) {
    if (MediaQuery.sizeOf(context).width <= 600) {
      return Wrap(children: children);
    } else {
      return Row(children: children);
    }
  }

  List<Widget> candidateDetail() {
    return [
      candidateDetails("AICTE ID:", "#"),
      candidateDetails("Organization:", ""),
      candidateDetails("Father’s name:", "Mr."),
      candidateDetails("Email:", ""),
      candidateDetails("Address:", ", , -"),
      candidateDetails("University:", ""),
      candidateDetails("Student ID:", "#"),
      candidateDetails("Centre:", ""),
      candidateDetails("D.O.B:", ""),
      candidateDetails("Category:", Icons.picture_as_pdf),
      candidateDetails("Graduation discipline:", Icons.picture_as_pdf),
      candidateDetails("State:", ""),
      candidateDetails("Technology:", ""),
      candidateDetails("D.O.J:", ""),
      candidateDetails("Mobile number:", ""),
      candidateDetails("Gender:", ""),
      candidateDetails("College:", ""),
      candidateDetails("Semester:", ""),
    ];
  }

  Widget candidateDetails(String label, dynamic value) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        value is IconData
            ? Icon(value, color: Colors.red)
            : Text(
                value.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
      ],
    );
  }

  Widget _buildSubmittedDetails() {
    return Column(
      children: [
        const Text(
          'Bank Details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 200,
          width: 1100,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: submittedData.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        '${entry.key}:',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        entry.value,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
