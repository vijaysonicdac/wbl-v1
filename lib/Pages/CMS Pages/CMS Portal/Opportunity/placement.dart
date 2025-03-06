import "package:flutter/material.dart";
import "package:wbl/Reusable%20Widgets/custumdatatable.dart";

class PlacementClass extends StatefulWidget {
  const PlacementClass({super.key});

  @override
  State<PlacementClass> createState() => PlacementClassState();
}

class PlacementClassState extends State<PlacementClass> {
  String searchQuery = '';
  List<Map<String, dynamic>> filteredCandidates = [];
  final List<Map<String, dynamic>> adData = [
    {
      "R_ID": 1,
      "Image": "assets/images/th.jpg",
      "Name": "Chirag Ubnare",
      "Center": "Mohali",
      "Domain": "Artificial Intelligence(AI) and Machine Learning",
      "Company": "Software Engineer at TCS Mumbai",
      "Action": "",
    },
    {
      "R_ID": '2',
      "Image": "assets/images/th(1).jpg",
      "Name": "Chirag Ubnare",
      "Center": "CDAC Mohali",
      "Domain": "Artificial Intelligence(AI) and Machine Learning",
      "Company": "Software Engineer at TCS Mumbai",
      "Action": "",
    },
    {
      "R_ID": '3',
      "Image": "assets/images/th.jpg",
      "Name": "Rupinder Kaur",
      "Center": "CDAC Mohali",
      "Domain": "Cyber Security",
      "Company": "Project Engineer at C_DAC mohali",
      "Action": "",
    },
    {
      "R_ID": '4',
      "Image": "assets/images/th(1).jpg",
      "Name": "Neha Yadav",
      "Center": "CDAC Mohali",
      "Domain": "Digital Health",
      "Company": "Project Engineer at C_DAC mohali",
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
                          "Recruited Candidates",
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
                        children: [Icon(Icons.add), Text('Add')],
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
                      // DataRow(
                      // cells: [
                      //   DataCell(Text(
                      //       Advertisement_data['R_ID'].toString())),
                      //   DataCell(Text(
                      //       Advertisement_data['Image'].toString())),
                      //   DataCell(Column(
                      //     children: [
                      //       Text(Advertisement_data['Name']
                      //           .toString(),
                      //           overflow: TextOverflow.ellipsis,
                      //           maxLines: 1,),
                      //       const Text(
                      //         "Batch 2023",
                      //         style: TextStyle(color: Colors.blue),
                      //       ),
                      //     ],
                      //   )),
                      //   DataCell(

                      //       Text(Advertisement_data['Center']
                      //           .toString()),

                      //   ),
                      //   DataCell(Text(
                      //       Advertisement_data['Domain'].toString(),
                      //       overflow: TextOverflow.ellipsis,
                      //       maxLines: 2,
                      //       )),
                      //   DataCell(Text(Advertisement_data['Company']
                      //       .toString())),
                      //   DataCell(Row(
                      //     children: [

                      //       IconButton(
                      //         onPressed: () {},
                      //         icon: const Icon(
                      //           Icons.edit,
                      //           color: Colors.blue,
                      //         ),
                      //       ),
                      //       IconButton(
                      //         onPressed: () {},
                      //         icon: const Icon(
                      //           Icons.delete,
                      //           color: Colors.red,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      //   ),
                      // ],
                      //     ))
                      // .toList()
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
    return ['R_ID', 'Image', 'Name', 'Center', 'Domain', 'Company', 'Action']
        .map((title) => DataColumn(label: mylabel(title)))
        .toList();
  }

  DataRow rowdata(Map<String, dynamic> advertisementData) {
    return DataRow(cells: [
      DataCell(mylabel(advertisementData['R_ID'].toString())),
      DataCell(Padding(
        padding: const EdgeInsets.all(3.0),
        child: ClipOval(
            child: Image.asset(advertisementData['Image'],
                width: 70, height: 70, fit: BoxFit.cover)),
      )),
      DataCell(mylabel(advertisementData['Name'].toString())),
      DataCell(mylabel(advertisementData['Center'].toString())),
      DataCell(mylabel(advertisementData['Domain'].toString())),
      DataCell(mylabel(advertisementData['Company'].toString())),
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
                advertisementData['R_ID']
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
                advertisementData['Domain']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Company']
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
