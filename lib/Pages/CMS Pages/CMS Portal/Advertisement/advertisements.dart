// ignore_for_file: non_constant_identifier_names

import "package:flutter/material.dart";

class Advertisement extends StatefulWidget {
  const Advertisement({super.key});

  @override
  State<Advertisement> createState() => _AdvertisementState();
}

class _AdvertisementState extends State<Advertisement> {
  String searchQuery = '';
  List<Map<String, dynamic>> filteredCandidates = [];
  final List<Map<String, dynamic>> ad_Data = [
    {
      "Adv_ID": 1,
      "Technology":
          "Artificial Intelligence adn Machine Learning, Digital Health , eGoverence,Cyber Security, Embedded Systems",
      "Organization": "C-DAC",
      "Center": "Mohali",
      "State": "Punjab",
      "Period": "jan 2025-june 2025",
      "Vacancy": '48',
      "Apply By": 'November 15,2024',
      "status": "Active",
      "Action": "",
    },
    {
      "Adv_ID": 2,
      "Technology": "Battery or Energy Storage Materials",
      "Organization": "CMET",
      "Center": "Pune",
      "State": "Maharashtra",
      "Period": "jan 2025-june 2025",
      "Vacancy": '48',
      "Apply By": 'November 15,2024',
      "status": "Active",
      "Action": "",
    },
    {
      "Adv_ID": 3,
      "Technology": "EPG or LTCC< Thick Films Materials",
      "Organization": "CMET",
      "Center": "Pune",
      "State": "Maharashtra",
      "Period": "jan 2025-june 2025",
      "Vacancy": '48',
      "Apply By": 'November 15,2024',
      "status": "In Active",
      "Action": "",
    },
    {
      "Adv_ID": 4,
      "Technology": "Artificial Intelligence, and Machine Learning",
      "Organization": "NIELIT",
      "Center": "Imphal",
      "State": "Manipur",
      "Period": "jan 2025-june 2025",
      "Vacancy": '48',
      "Apply By": 'November 15,2024',
      "status": "Active",
      "Action": "",
    },
     {
      "Adv_ID": 5,
      "Technology":
          "Cyber Security",
      "Organization": "C-DAC",
      "Center": "Mohali",
      "State": "Punjab",
      "Period": "jan 2025-june 2025",
      "Vacancy": '48',
      "Apply By": 'November 15,2024',
      "status": "Active",
      "Action": "",
    },
    {
      "Adv_ID": 6,
      "Technology": "Battery or Energy Storage Materials",
      "Organization": "CMET",
      "Center": "Pune",
      "State": "Maharashtra",
      "Period": "jan 2025-june 2025",
      "Vacancy": '48',
      "Apply By": 'November 15,2024',
      "status": "Active",
      "Action": "",
    },
    {
      "Adv_ID": 7,
      "Technology": "Cloud Computing",
      "Organization": "CMET",
      "Center": "Pune",
      "State": "Maharashtra",
      "Period": "jan 2025-june 2025",
      "Vacancy": '48',
      "Apply By": 'November 15,2024',
      "status": "In Active",
      "Action": "",
    },
    {
      "Adv_ID": 8,
      "Technology": "Cloud Computing",
      "Organization": "NIELIT",
      "Center": "Imphal",
      "State": "Manipur",
      "Period": "jan 2025-june 2025",
      "Vacancy": '48',
      "Apply By": 'November 15,2024',
      "status": "Active",
      "Action": "",
    },
  ];
  @override
  void initState() {
    super.initState(); 
    filteredCandidates = ad_Data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Center(
                        child: Text(
                          "Advertisements",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () { },
                        child: const Row(
                          children: [Icon(Icons.add), Text('Add New Adv')],
                        ))
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: SizedBox(
                        width: 1,
                      ),
                    ),
                    const Text('Search:'),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width: 200,
                      child: TextField(
                        onChanged: (value){
                          setState(() {
                            searchQuery = value;
                            searchwidget();
                          });
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'search',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: DataTable(
                      border: TableBorder.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                      columns: const [
                        DataColumn(label: Text('Adv_ID')),
                        DataColumn(label: Text('Technology')),
                        DataColumn(label: Text('Organization')),
                        DataColumn(label: Text('Center')),
                        DataColumn(label: Text('State')),
                        DataColumn(label: Text('Period')),
                        DataColumn(label: Text('Vacancy')),
                        DataColumn(label: Text('Apply By')),
                        DataColumn(label: Text('status')),
                        DataColumn(label: Text('Action')),
                      ],
                      rows: filteredCandidates
                          .map((advertisementData) => DataRow(
                                cells: [
                                  DataCell(Text(
                                      advertisementData['Adv_ID'].toString())),
                                  DataCell(Text(advertisementData['Technology']
                                      .toString())),
                                  DataCell(Text(
                                      advertisementData['Organization']
                                          .toString())),
                                  DataCell(Text(
                                      advertisementData['Center'].toString())),
                                  DataCell(Text(
                                      advertisementData['State'].toString())),
                                  DataCell(Text(
                                      advertisementData['Period'].toString())),
                                  DataCell(Text(advertisementData['Vacancy']
                                      .toString())),
                                  DataCell(Text(advertisementData['Apply By']
                                      .toString())),
                                  DataCell(Text(
                                      advertisementData['status'].toString())),
                                  DataCell(Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.visibility),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          _showDeleteConfirmationDialog(context, advertisementData);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  )),
                                ],
                              ))
                          .toList()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void searchwidget() {
    setState(() {
      if (searchQuery.isEmpty) {
        filteredCandidates = ad_Data;
      } else {
        filteredCandidates = ad_Data
            .where((advertisementData) =>
                advertisementData['Adv_ID']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Technology']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Organization']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Center']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['State']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Period']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Vacancy']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Apply By']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['status']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()))
            .toList();
      }
    });
  }
  void _showDeleteConfirmationDialog(
      BuildContext context, Map<String, dynamic> advertisementData) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Do you want to delete?'),
          content: const Text("You won't be able to revert this action."),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                'No',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.blueAccent),
              ),
              onPressed: () {
                setState(() {
                  filteredCandidates.remove(
                      advertisementData); // Remove the candidate from the list
                });
                Navigator.of(context).pop(); // Close the dialog after deleting
              },
              child: const Text(
                'Yes, Delete it',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
