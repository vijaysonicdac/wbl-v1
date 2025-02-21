import "package:flutter/material.dart";
import "package:wbl/Reusable%20Widgets/custumdatatable.dart";

class TestimonialsClass extends StatefulWidget {
  const TestimonialsClass({super.key});

  @override
  State<TestimonialsClass> createState() => TestimonialsClassState();
}

class TestimonialsClassState extends State<TestimonialsClass> {
  String searchQuery = '';
  List<Map<String, dynamic>> filteredCandidates = [];
      ScrollController horizontal = ScrollController();
  ScrollController vertical = ScrollController();

  // ignore: non_constant_identifier_names
  final List<Map<String, dynamic>> ad_Data = [
    {
      "_ID": 1,
      "Seq_Order": 11,
      "Image": "assets/images/th.jpg",
      "Name": "Sabia Asmat",
      "College_City": "leh",
      "Batch": 2022,
      "Organization": "NIELIT",
      "Center": "leh",
      "Action": "",
    },
    {
      "_ID": 2,
      "Seq_Order": 4,
      "Image": "assets/images/th(1).jpg",
      "Name": "Stanzin",
      "College_City": "leh",
      "Batch": 2022,
      "Organization": "NIELIT",
      "Center": "leh",
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
                          "Testimonials",
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
                        children: [
                          Icon(Icons.add),
                          Text('Add New Testimonials')
                        ],
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
                child:buildVerticalScrollbar(vertical, child: buildHorizontalScrollbar(horizontal, child: Padding(
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
                ),)) 
              ),
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
      '_ID',
      'Seq_Order',
      'Image',
      'Name',
      'College_City',
      'Batch',
      'Organization',
      'Center',
      'Action'
    ].map((title) => DataColumn(label: mylabel(title))).toList();
  }

  DataRow rowdata(Map<String, dynamic> advertisementData) {
    return DataRow(cells: [
      DataCell(mylabel(advertisementData['_ID'].toString())),
      DataCell(mylabel(advertisementData['Seq_Order'].toString())),
      DataCell(Padding(
        padding: const EdgeInsets.all(3.0),
        child: ClipOval(
            child: Image.asset(advertisementData['Image'],
                width: 70, height: 70, fit: BoxFit.cover)),
      )),
      DataCell(mylabel(advertisementData['Name'].toString())),
      DataCell(mylabel(advertisementData['College_City'].toString())),
      DataCell(mylabel(advertisementData['Batch'].toString())),
      DataCell(mylabel(advertisementData['Organization'].toString())),
      DataCell(mylabel(advertisementData['Center'].toString())),
      DataCell(Row(
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.visibility)),
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
        filteredCandidates = ad_Data;
      } else {
        filteredCandidates = ad_Data
            .where((advertisementData) =>
                advertisementData['_ID']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Seq_Order']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Name']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['College_City']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Batch']
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
