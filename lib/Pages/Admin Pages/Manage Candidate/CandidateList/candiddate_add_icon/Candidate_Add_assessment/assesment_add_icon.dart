import 'package:flutter/material.dart';
import 'package:wbl/Pages/Admin%20Pages/Manage%20Candidate/CandidateList/candiddate_add_icon/Candidate_Add_assessment/Add_assesment_candidate/add_assetment.dart';
import 'package:wbl/Pages/Admin%20Pages/admin_login_page.dart';

class AssesmentAddIcon extends StatefulWidget {
  const AssesmentAddIcon({super.key});

  @override
  State<AssesmentAddIcon> createState() => _AssesmentAddIconState();
}

class _AssesmentAddIconState extends State<AssesmentAddIcon> {
  final List<Map<String, dynamic>> candidates = [
    {
      'NAME': 'Rakesh Kumar',
      "lEVEL": 'L1',
      "ASSESSMENT STATUS": "Pass",
      "PROMOTED": 'No',
      "DATE": "8-sep.2023",
    },
  ];

  String? _getadd;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _getadd = 'AddAssessment';
                });

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminLoginPage(
                      selectedButtonName: _getadd!.isNotEmpty ? _getadd : "",
                      bodyWidget: _getaddo(),
                    ),
                  ),
                  (Route<dynamic> route) => false,
                );
              },
              icon: const Icon(Icons.add_circle_outline_outlined),
              color: Colors.black,
              iconSize: 30,
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 250,
              child: DataTable(
                headingRowColor: const WidgetStatePropertyAll(
                    Color.fromARGB(255, 224, 230, 224)),
                columns: [
                  DataColumn(
                      label: mylabel(
                    "NAME",
                  )),
                  DataColumn(
                      label: mylabel(
                    "LEVEL",
                  )),
                  DataColumn(
                      label: mylabel(
                    "ASSESSMENT STATUS",
                  )),
                  DataColumn(label: mylabel("PROMOTED")),
                  DataColumn(label: mylabel("DATE")),
                  DataColumn(label: mylabel("DOCUMENT")),
                ],
                rows: candidates
                    .map(
                      (candidate) => DataRow(
                        cells: [
                          DataCell(mylabel(candidate['NAME'].toString())),
                          DataCell(mylabel(candidate['LEVEL'].toString())),
                          DataCell(mylabel(
                              candidate['ASSESSMENT STATUS'].toString())),
                          DataCell(mylabel(candidate['PROMOTED'].toString())),
                          DataCell(mylabel(candidate['DATE'].toString())),
                          DataCell(
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.visibility),
                                  onPressed: () {
                                    // View action
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Color.fromARGB(255, 226, 123, 108),
                                  ),
                                  onPressed: () {
                                    _showDeleteConfirmationDialog(
                                        context, candidate);
                                    // Delete action
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showDeleteConfirmationDialog(
      BuildContext context, Map<String, dynamic> candidate) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Do you want to delete the Assessment?'),
          content:
              Text("You wo'nt be able to revert this ${candidate["LEVEL "]}?"),
          actions: <Widget>[
            TextButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red)),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                'No',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blueAccent)),
              onPressed: () {
                setState(() {
                  candidates
                      .remove(candidate); // Remove the candidate from the list
                });
                Navigator.of(context).pop(); // Close the dialog after deleting
              },
              child: const Text(
                'Yes,Delete it',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget mylabel(label) {
    return Expanded(
      child: Text(label),
    );
  }

  Widget _getaddo() {
    if (_getadd == 'AddAssessment') {
      return const AddAssessment();
    } else {
      return const Text('');
    }
  }
}
