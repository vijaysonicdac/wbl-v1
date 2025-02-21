import "package:flutter/material.dart";
import "package:wbl/Reusable%20Widgets/custumdatatable.dart";

// ignore: camel_case_types
class Resume_Class extends StatefulWidget {
  const Resume_Class({super.key});

  @override
  State<Resume_Class> createState() => Resume_ClassState();
}

// ignore: camel_case_types
class Resume_ClassState extends State<Resume_Class> {
  String searchQuery = '';
  List<Map<String, dynamic>> filteredCandidates = [];

      ScrollController horizontal = ScrollController();
  ScrollController vertical = ScrollController();

  // ignore: non_constant_identifier_names
  final List<Map<String, dynamic>> ad_Data = [
    {
      "#ID": 1,
      "Candidate_Name": "Pankaj Kumar",
      "Tech_Domain": "Web Development",
      "Location": 'Gurgaon',
      "Skillset": "Angular,React,Java,HTML,CSS",
      "Uploaded_On": "17 sep,2024",
      "Action": "",
    },
    {
      "#ID": 2,
      "Candidate_Name": "Sumit",
      "Tech_Domain": "Software Technologies",
      "Location": 'Mohali',
      "Skillset": "Angular,React,Java,HTML,CSS",
      "Uploaded_On": "17 sep,2024",
      "Action": "",
    },
    {
      "#ID": 3,
      "Candidate_Name": "Sikander kumar",
      "Tech_Domain": "Software Application Development using Java",
      "Location": 'Mohali',
      "Skillset": "Angular,React,Java,HTML,CSS",
      "Uploaded_On": "17 sep,2024",
      "Action": "",
    },
  ];
  @override
  void initState() {
    super.initState();
    filteredCandidates = ad_Data;
  }

  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          "All Resumes",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
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
                        onChanged: (value) {
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
              Expanded(
                child: buildVerticalScrollbar(vertical, child: buildHorizontalScrollbar(horizontal, child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Custumdatatable(
                      columns: columns(),
                      rows: filteredCandidates
                          .map(
                              (advertisementData) => rowdata(advertisementData))
                          .toList(),
                    ),
                  ),
                ),
                )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

   Widget buildVerticalScrollbar(ScrollController controller,
      {required Widget child}) {
    return Scrollbar(
      thickness: 10,
      thumbVisibility: true,
      controller: controller,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        controller: controller,
        child: child,
      ),
    );
  }

  Widget buildHorizontalScrollbar(ScrollController controller,
      {required Widget child}) {
    return Scrollbar(
      thickness: 10,
      thumbVisibility: true,
      controller: controller,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        child: child,
      ),
    );
  }


  List<DataColumn> columns() {
    return [
      '#ID',
      'Candidate_Name',
      'Tech_Domain',
      'Location',
      'Skillset',
      'Uploaded_On',
      'Action'
    ].map((title) => DataColumn(label: mylabel(title))).toList();
  }

  DataRow rowdata(Map<String, dynamic> advertisementData) {
    return DataRow(cells: [
      DataCell(mylabel(advertisementData['#ID'].toString())),
      DataCell(mylabel(advertisementData['Candidate_Name'].toString())),
      DataCell(mylabel(advertisementData['Tech_Domain'].toString())),
      DataCell(mylabel(advertisementData['Location'].toString())),
      DataCell(mylabel(advertisementData['Skillset'].toString())),
      DataCell(mylabel(advertisementData['Uploaded_On'].toString())),
      DataCell(Row(
        children: [
          // IconButton(onPressed: (){}, icon:Icon(Icons.visibility)),
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(
          //     Icons.edit,
          //     color: Colors.blue,
          //   ),
          // ),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    )),
                icon: const Icon(Icons.download),
                label: const Text('Download'),
              ),
            ],
          ),
          const SizedBox(
            width: 3,
          ),

          ElevatedButton.icon(
              onPressed: () {
                _showDeleteConfirmationDialog(context, advertisementData);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  )),
              icon: const Icon(Icons.delete),
              label: const Text('Delete')),
        ],
      ))
    ]);
  }

  Widget mylabel(String label) {
    return Text(label);
  }

  void searchwidget() {
    setState(() {
      if (searchQuery.isEmpty) {
        filteredCandidates = ad_Data;
      } else {
        filteredCandidates = ad_Data
            .where((advertisementData) =>
                advertisementData['#ID']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Candidate_Name']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Tech_Domain']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Location']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Skillset']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Uploaded_On']
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
