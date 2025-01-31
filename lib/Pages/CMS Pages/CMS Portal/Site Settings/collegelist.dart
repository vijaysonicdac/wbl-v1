import "package:flutter/material.dart";
import "package:wbl/Reusable%20Widgets/custumdatatable.dart";

class CollegeList extends StatefulWidget {
  const CollegeList({super.key});

  @override
  State<CollegeList> createState() => CollegeListState();
}

class CollegeListState extends State<CollegeList> {
  String searchQuery = '';
  List<Map<String, dynamic>> filteredCandidates = [];
  final List<Map<String, dynamic>> adData = [
    {
      "ID": 1,
      "College_Name": "Chandigarh Group of College,Mohali",
      "State": "Punjab",
      "Student_Count": "1",
    },
    {
      "ID": 2,
      "College_Name": "DAV College,Ludhiana",
      "State": "Punjab",
      "Student_Count": "3",
    },
    {
      "ID": 3,
      "College_Name": "Chandigarh Group of College,Mohali",
      "State": "Punjab",
      "Student_Count": "2",
    },
    {
      "ID": 4,
      "College_Name": "Guru Nanak Dev University,Amritsar",
      "State": "Punjab",
      "Student_Count": "1",
    },
  ];
  @override
  void initState() {
    super.initState();
    filteredCandidates = adData;
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
                          "Site Settings",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                      ),
                      child: const Row(
                        children: [Icon(Icons.add), Text('Add New College')],
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
              SingleChildScrollView(
                child: Padding(
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
            ],
          ),
        ),
      ),
    );
  }

  List<DataColumn> columns() {
    return [
      'ID',
      'College_Name',
      'State',
      'Student_Count',
    ].map((title) => DataColumn(label: mylabel(title))).toList();
  }

  DataRow rowdata(Map<String, dynamic> advertisementData) {
    return DataRow(cells: [
      DataCell(mylabel(advertisementData['ID'].toString())),
      DataCell(mylabel(advertisementData['College_Name'].toString())),
      DataCell(mylabel(advertisementData['State'].toString())),
      DataCell(mylabel(advertisementData['Student_Count'].toString())),
    ]);
  }

  Widget mylabel(String label) {
    return Text(label);
  }

  void searchwidget() {
    setState(() {
      if (searchQuery.isEmpty) {
        filteredCandidates = adData;
      } else {
        filteredCandidates = adData
            .where((advertisementData) =>
                advertisementData['ID']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['College_Name']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['State']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Student_Count']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()))
            .toList();
      }
    });
  }

  void showDeleteConfirmationDialog(
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
