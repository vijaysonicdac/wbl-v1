// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';

class Assesmentpage extends StatefulWidget {
  const Assesmentpage({super.key});

  @override
  State<Assesmentpage> createState() => AssesmentpageState();
}

class AssesmentpageState extends State<Assesmentpage> {
  String selectedState = 'select';
  String selectedCohort = 'select';
  String searchQuery = '';
  List<Map<String, dynamic>> filteredcandidate = [];

  final List<String> stateList = [
    'select',
    'Andhra Pradesh',
    'Arunachal Pradesh',
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
      "lEVEL": 'L2',
      "ASSESSMENT STATUS": "Pass",
      "PROMOTED": 'No',
      "DATE": "8-sep.2023",
    },
    {
      "lEVEL": 'L1',
      "ASSESSMENT STATUS": "Pass",
      "PROMOTED": 'No',
      "DATE": "8-sep.2023",
    },
    {
      "lEVEL": 'L3',
      "ASSESSMENT STATUS": "Pass",
      "PROMOTED": 'No',
      "DATE": "8-sep.2023",
    },
  ];
  @override
  void initState() {
    super.initState();
    filteredcandidate = candidates;
  }

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8.0, // Space between dropdowns
          runSpacing: 8.0, // Space between rows of dropdowns
          alignment: WrapAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                width: 200,
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

            // Dropdown for Current Cohort
            mysearchbutton(
              selectedState,
              stateList,
              "State ",
            ),
            mysearchbutton(
              selectedCohort,
              cohortList,
              "Cohort",
            ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double availableWidth = constraints.maxWidth;
              final double availableHeight = constraints.maxHeight;
              return Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: availableWidth, // Make it responsive
                      ),
                      child: Card(
                        child: DataTable(
                          headingRowColor: const WidgetStatePropertyAll(
                            Color.fromARGB(255, 224, 230, 224),
                          ),
                          columns: [
                            DataColumn(label: mylabel("LEVEL")),
                            DataColumn(label: mylabel("ASSESSMENT STATUS")),
                            DataColumn(label: mylabel("PROMOTED")),
                            DataColumn(label: mylabel("DATE")),
                            DataColumn(label: mylabel("DOCUMENT")),
                          ],
                          rows: filteredcandidate.map((candidate) {
                            return DataRow(
                              cells: [
                                DataCell(
                                    mylabel(candidate['lEVEL'].toString())),
                                DataCell(mylabel(
                                    candidate['ASSESSMENT STATUS'].toString())),
                                DataCell(
                                    mylabel(candidate['PROMOTED'].toString())),
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
                                          color: Color.fromARGB(
                                              255, 226, 123, 108),
                                        ),
                                        onPressed: () {
                                          _showDeleteConfirmationDialog(
                                              context, candidate);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
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
                candidate['lEVEL']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['ASSESSMENT STATUS']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['PROMOTED']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['DATE']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()))
            .toList();
      }
    });
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
    String selecteditem,
    List<String> items,
    String labelText,
  ) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: 200,
        child: DropdownButtonFormField<String>(
          value: selecteditem,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {});
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
}
