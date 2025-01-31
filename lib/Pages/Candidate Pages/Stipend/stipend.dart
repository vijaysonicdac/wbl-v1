import 'package:flutter/material.dart';

class StipendPage extends StatefulWidget {
  const StipendPage({super.key});

  @override
  State<StipendPage> createState() => _StipendPageState();
}

TextEditingController searchController = TextEditingController();

class _StipendPageState extends State<StipendPage> {
  String searchQuery = '';
  List<Map<String, dynamic>> filteredCandidate = [];
  final List<Map<String, dynamic>> candidateData = [
    {
      'AICTE ID': 'STU25412SSSS',
      'AMOUNT': '10000',
      'ABSENT DAYS': "10",
      'ACTION': 'AA',
    },
    {
      'AICTE ID': 'STU25412S',
      'AMOUNT': '9000',
      'ABSENT DAYS': "11  ",
      'ACTION': 'AA',
    },
    {
      'AICTE ID': 'STU2569dd',
      'AMOUNT': '5000',
      'ABSENT DAYS': "8",
      'ACTION': '3',
    },
  ];
  @override
  void initState() {
    super.initState();
    filteredCandidate = candidateData;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Card(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          hintText: 'Search Column',
                          labelText: 'Search',
                        ),
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value;
                            _filteredCandidateSearch();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: screenSize,
                  child: Expanded(
                    child: DataTable(
                        headingRowColor: const WidgetStatePropertyAll(
                            Color.fromARGB(255, 216, 244, 218)),
                        columns: const [
                          DataColumn(
                              label: Text(
                            'AICTE ID',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text('AMOUNT',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text(
                            'ABSENT DAYS',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )),
                          DataColumn(
                              label: Text('ACTION',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                        ],
                        rows: filteredCandidate
                            .map((candidate) => DataRow(cells: [
                                  DataCell(
                                      Text(candidate['AICTE ID'].toString())),
                                  DataCell(
                                      Text(candidate['AMOUNT'].toString())),
                                  DataCell(Text(
                                      candidate['ABSENT DAYS'].toString())),
                                  DataCell(
                                      Text(candidate['ACTION'].toString())),
                                ]))
                            .toList()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _filteredCandidateSearch() {
    setState(() {
      if (searchQuery.isEmpty) {
        filteredCandidate = candidateData;
      } else {
        filteredCandidate = candidateData
            .where((candidate) =>
                candidate['AICTE ID']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['AMOUNT']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['ABSENT DAYS']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['ACTION']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()))
            .toList();
      }
    });
  }
}
