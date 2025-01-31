import 'package:flutter/material.dart';
import 'package:wbl/Pages/Admin%20Pages/Manage%20Candidate/CandidateList/candiddate_add_icon/Candidate_View_Leave/Add_View_Leave/add_leave.dart';
import 'package:wbl/Pages/Admin%20Pages/admin_login_page.dart';

class Viewleave extends StatefulWidget {
  const Viewleave({super.key});

  @override
  State<Viewleave> createState() => _ViewleaveState();
}

class _ViewleaveState extends State<Viewleave> {
  String searchQuery = '';

  final List<Map<String, dynamic>> candidateData = [
    {
      'Leave Type': 'Medical leave',
      'Leave': "FullDay",
      'StartDate': '5 jul 2023',
      'EndDate': '21 jan 2024',
    },
    {
      'Leave Type': 'Casual leave',
      'Leave': "FullDay",
      'StartDate': '5 jul 2023',
      'EndDate': '21 jan 2024',
    },
    {
      'Leave Type': 'Casual leave',
      'Leave': "FullDay",
      'StartDate': '5 jul 2023',
      'EndDate': '21 jan 2024',
    },
    {
      'Leave Type': 'Medical leave',
      'Leave': "FullDay",
      'StartDate': '5 jul 2023',
      'EndDate': '21 jan 2024',
    },
  ];
  List<Map<String, dynamic>> filtercandidate = [];

  String? _getadd;

  @override
  void initState() {
    super.initState();
    filtercandidate = candidateData;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      hintText: 'Search Column',
                      fillColor: Colors.white,
                      filled: true,
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
              const Expanded(
                  child: SizedBox(
                width: 1,
              )),
              IconButton(
                onPressed: () {
                  setState(() {
                    _getadd = 'add';
                  });
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminLoginPage(
                        selectedButtonName: "Add Leave",
                        bodyWidget: _getadddata(),
                      ),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
                icon: const Icon(
                  Icons.add_circle_outline,
                  color: Colors.black,
                  size: 40,
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: DataTable(
                      headingRowColor: const WidgetStatePropertyAll(
                          Color.fromARGB(255, 224, 230, 224)),
                      columns: const [
                        DataColumn(label: Text("Leave Type")),
                        DataColumn(label: Text('Leave')),
                        DataColumn(label: Text('StartDate')),
                        DataColumn(label: Text('EndDate')),
                        DataColumn(label: Text('Action')),
                      ],
                      rows: filtercandidate
                          .map(
                            (candidate) => DataRow(
                              cells: [
                                DataCell(
                                    Text(candidate['Leave Type'].toString())),
                                DataCell(Text(candidate['Leave'].toString())),
                                DataCell(
                                    Text(candidate['StartDate'].toString())),
                                DataCell(Text(candidate['EndDate'].toString())),
                                DataCell(
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Color.fromARGB(
                                              255, 238, 125, 117),
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
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void searchlist() {
    setState(() {
      if (searchQuery.isEmpty) {
        filtercandidate = candidateData;
      } else {
        filtercandidate = candidateData
            .where((candidate) =>
                candidate['Leave Type']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['Leave']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['StartDate']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['EndDate']
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
              Text("You wo'nt be able to revert this ${candidate["Leave"]}?"),
          actions: <Widget>[
            TextButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blueAccent)),
              onPressed: () {
                setState(() {
                  candidateData
                      .remove(candidate); // Remove the candidate from the list
                });
                Navigator.of(context).pop(); // Close the dialog after deleting
              },
              child: const Text(
                'Yes,Delete it',
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
                'No',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _getadddata() {
    if (_getadd == 'add') {
      return const AddLeave();
    } else {
      return const Text('');
    }
  }
}
