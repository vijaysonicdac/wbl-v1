// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:wbl/Pages/Admin%20Pages/Manage%20Candidate/AICET%20%20ID/Edit_Icon_AICT/editicon_aict.dart';
import 'package:wbl/Pages/Admin%20Pages/admin_login_page.dart';

class AicteId extends StatefulWidget {
  const AicteId({
    super.key,
  });
  @override
  State<AicteId> createState() => AicteIdState();
}

class AicteIdState extends State<AicteId> {
  String selectedState = 'select';
  String selectedCohort = 'select';

  String searchQuery = '';
  List<Map<String, dynamic>> filteredcandidate = [];

  final List<String> stateList = [
    'select',
    'Assam',
    'Bihar',
    'Chandigarh',
    'Chhattisgarh',
    'Daman & Diu',
    'Delhi',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh'
  ];
  final List<String> cohortList = [
    'select',
    'Cohort 1',
    'Cohort 2',
    'Cohort 3'
  ];

  final List<Map<String, dynamic>> candidates = [
    {
      "AICTE ID": "STU63c13c0e163ec1673608206",
      "CANDIDATE NAME": "	Akriti",
      "EMAIL": '	sabharwalakriti28@gmail.com',
    },
    {
      "AICTE ID": "STU63c13c0e163ec1673608205",
      "CANDIDATE NAME": "	Akriti sabharwal",
      "EMAIL": '	sabharwalakriti28@gmail.com',
    },
    {
      "AICTE ID": "STU63c13c0e163ec1673608208",
      "CANDIDATE NAME": "	Akriti sabharwal",
      "EMAIL": '	sabharwalakriti28@gmail.com',
    },
  ];

  String? _selectaict;

  @override
  void initState() {
    super.initState();
    filteredcandidate = candidates;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSearchSection(
          onAddPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => AdminLoginPage(
                  selectedButtonName: "Add AICET ID",
                  bodyWidget: _getselectaict(),
                ),
              ),
              (Route<dynamic> route) => false,
            );
          },
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: screenWidth - 200,
                  // widget
                  //     .sidebarwidth, // Ensure minimum width of table is the screen width
                  minHeight: screenHeight * 0.6, // Ensure min height
                ),
                child: Card(
                  child: DataTable(
                    headingRowColor: const WidgetStatePropertyAll(
                        Color.fromARGB(255, 224, 230, 224)),
                    columns: [
                      DataColumn(
                          label: mylabel(
                        "AICTE ID",
                      )),
                      DataColumn(
                          label: mylabel(
                        "CANDIDATE NAME",
                      )),
                      DataColumn(label: mylabel("EMAIL")),
                      DataColumn(label: mylabel("ACTION")),
                    ],
                    rows: filteredcandidate
                        .map((Map<String, dynamic> candidate) =>
                            builddatarow(candidate))
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  DataRow builddatarow(Map<String, dynamic> candidate) {
    return DataRow(
      cells: [
        DataCell(mylabel(candidate['AICTE ID'].toString())),
        DataCell(mylabel(candidate['CANDIDATE NAME'].toString())),
        DataCell(mylabel(candidate['EMAIL'].toString())),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.visibility),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Color.fromARGB(255, 226, 123, 108),
                ),
                onPressed: () {
                  _showDeleteConfirmationDialog(context, candidate);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  searchlist() {
    setState(() {
      if (searchQuery.isEmpty) {
        filteredcandidate = candidates;
      } else {
        filteredcandidate = candidates
            .where((candidate) =>
                candidate['AICTE ID']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['CANDIDATE NAME']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['EMAIL']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()))
            .toList();
      }
    });
  }

  Widget buildSearchSection({
    required Function onAddPressed,
  }) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
            width: 150,
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search',
                hintText: 'Search column',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                  searchlist();
                });
              },
            ),
          ),
        ),
        mysearchbutton(selectedState, stateList, 'State'),
        mysearchbutton(selectedCohort, cohortList, 'current cohort'),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {
              setState(() {
                _selectaict = 'add';
              });
              onAddPressed();
            },
            icon: const Icon(Icons.add_circle_outline),
            color: Colors.black,
            iconSize: 40,
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
          title: const Text('Do you want to delete stipend?'),
          content: Text(
              "You wo'nt be able to revert this ${candidate["CANDIDATE NAME"]}?"),
          actions: <Widget>[
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
                'Yes, Delete it',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red)),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                'NO',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget mysearchbutton(
      String selecteditem, List<String> items, String labelText) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: 200,
        child: DropdownButtonFormField<String>(
          value: items[0],
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              if (items == stateList) {
                selectedState = newValue!;
              }
              if (items == cohortList) {
                selectedCohort = newValue!;
              }
            });
          },
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
          ),
        ),
      ),
    );
  }

  Widget mylabel(label) {
    return Expanded(
      child: Text(label),
    );
  }

  Widget _getselectaict() {
    if (_selectaict == 'add') {
      return const Editaicte();
    } else {
      return const Text('');
    }
  }
}
