import "package:flutter/material.dart";
import "package:wbl/Reusable%20Widgets/custumdatatable.dart";

class FaqClass extends StatefulWidget {
  const FaqClass({super.key});

  @override
  State<FaqClass> createState() => FaqClassState();
}

class FaqClassState extends State<FaqClass> {
  String searchQuery = '';
  List<Map<String, dynamic>> filteredCandidates = [];
  final List<Map<String, dynamic>> adData = [
    {
      "FAQ_ID": 1,
      "Question": "What is Work Based Learning(WBL) Programme?",
      "Answer":
          "WBL programme is a unique initiative by govt of India that aims to provide employability skills to those eligible",
      "Action": '',
    },
    {
      "FAQ_ID": 2,
      "Question": "What is Work Based Learning(WBL) Programme?",
      "Answer":
          "WBL programme is a unique initiative by govt of India that aims to provide employability skills to those eligible",
      "Action": '',
    },
    {
      "FAQ_ID": 3,
      "Question": "What is Work Based Learning(WBL) Programme?",
      "Answer":
          "WBL programme is a unique initiative by govt of India that aims to provide employability skills to those eligible",
      "Action": '',
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
                          "Technology Domain",
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
                        children: [Icon(Icons.add), Text('Add New Technology')],
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
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Custumdatatable(
                          columns: columns(),
                          rows: filteredCandidates
                              .map((advertisementData) =>
                                  rowdata(advertisementData))
                              .toList())),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<DataColumn> columns() {
    return ["FAQ_ID", "Question", "Answer", "Action"]
        .map((title) => DataColumn(label: mylabel(title)))
        .toList();
  }

  DataRow rowdata(Map<String, dynamic> advertisementData) {
    return DataRow(cells: [
      DataCell(Text(advertisementData['FAQ_ID'].toString())),
      DataCell(Text(
        advertisementData['Question'].toString(),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      )),
      DataCell(Text(
        advertisementData['Answer'].toString(),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      )),
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
                advertisementData['FAQ_ID']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Question']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Answer']
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
