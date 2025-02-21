import "package:flutter/material.dart";
import "package:wbl/Reusable%20Widgets/custumdatatable.dart";

class ImplementingClass extends StatefulWidget {
  const ImplementingClass({super.key});

  @override
  State<ImplementingClass> createState() => ImplementingClassState();
}

class ImplementingClassState extends State<ImplementingClass> {
  String searchQuery = '';
  List<Map<String, dynamic>> filteredCandidates = [];

     ScrollController horizontal = ScrollController();
  ScrollController vertical = ScrollController();

  final List<Map<String, dynamic>> adData = [
    {
      "IO_ID": 1,
      "Full_Name": "Munish Ratti",
      "Email": "munishratti@cdac.in",
      "Organization": "C-DAC",
      "Center": "Mohali",
      "Mobile": "9852471235",
      "Status": "Not Active",
      "Action": "",
    },
    {
      "IO_ID": 2,
      "Full_Name": "Dr.Marshal",
      "Email": "iocertin@wblp.in",
      "Organization": "CERT_IN",
      "Center": "Delhi",
      "Mobile": "9992452164",
      "Status": "Not Active",
      "Action": "",
    },
    {
      "IO_ID": 3,
      "Full_Name": "Hari Krishna",
      "Email": "ioernet@wblp.in",
      "Organization": "ERNET",
      "Center": "Delhi",
      "Mobile": "9852471235",
      "Status": "Not Active",
      "Action": "",
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
                          "Implementing Officers",
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
                        children: [Icon(Icons.add), Text('Register New IO')],
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
                child: buildVerticalScrollbar(vertical, child: buildHorizontalScrollbar(horizontal, child:  Padding(
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
                ),)
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
      'IO_ID',
      'Full_Name',
      'Email',
      'Organization',
      'Center',
      'Mobile',
      "Status",
      "Action"
    ].map((title) => DataColumn(label: mylabel(title))).toList();
  }

  DataRow rowdata(Map<String, dynamic> advertisementData) {
    return DataRow(cells: [
      DataCell(mylabel(advertisementData['IO_ID'].toString())),
      DataCell(mylabel(advertisementData['Full_Name'].toString())),
      DataCell(mylabel(advertisementData['Email'].toString())),
      DataCell(mylabel(advertisementData['Organization'].toString())),
      DataCell(mylabel(advertisementData['Center'].toString())),
      DataCell(mylabel(advertisementData['Mobile'].toString())),
      DataCell(
        mylabel(advertisementData['Status'].toString()),
      ),
      DataCell(Row(
        children: [
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
      ))
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
                advertisementData['IO_ID']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Full_Name']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Email']
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
                advertisementData['Mobile']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Status']
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
