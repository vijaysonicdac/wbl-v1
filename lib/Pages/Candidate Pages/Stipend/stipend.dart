import 'package:flutter/material.dart';
import 'package:wbl/Database%20Functions/GET%20API%20CALL/get_api_function.dart';

class StipendPage extends StatefulWidget {
  const StipendPage({super.key});

  @override
  State<StipendPage> createState() => _StipendPageState();
}

TextEditingController searchController = TextEditingController();

class _StipendPageState extends State<StipendPage> {
  String searchQuery = '';

  List<Map<String, dynamic>> candidates = [];
  List<Map<String, dynamic>> filterCandidate = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getCandidateStipend();
  }

  Future<void> getCandidateStipend() async {
    try {
      Map<String, dynamic> data = await getStipendId();

      setState(() {
        candidates = [data];
        filterCandidate = candidates;
        isLoading = false;
      });
    } catch (e) {
      print("Error Fetching Stipend Data: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text('Stipend Page')),
      body: SingleChildScrollView(
        child: Card(
          color: Colors.white,
          child: Column(
            children: [
              // Search Bar
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

              // Loading Indicator
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : const SizedBox(),

              // Data Table
              const SizedBox(height: 20),
              isLoading
                  ? const SizedBox()
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: screenSize,
                        child: DataTable(
                          headingRowColor: WidgetStateProperty.all(
                              Color.fromARGB(255, 216, 244, 218)),
                          columns: const [
                            DataColumn(
                              label: Text(
                                'AICTE ID',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'AMOUNT',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'ABSENT DAYS',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'ACTION',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                          rows: filterCandidate
                              .map(
                                (candidate) => DataRow(cells: [
                                  DataCell(Text(
                                      candidate['aicteId']?.toString() ??
                                          "NA")),
                                  DataCell(Text(
                                      candidate['amount']?.toString() ?? "NA")),
                                  DataCell(Text(
                                      candidate['absentDays']?.toString() ??
                                          "NA")),
                                  DataCell(
                                    Row(
                                      children: [
                                        Icon(Icons.delete, color: Colors.red),
                                      ],
                                    ),
                                  ),
                                ]),
                              )
                              .toList(),
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
        filterCandidate = candidates;
      } else {
        filterCandidate = candidates
            .where((candidate) =>
                candidate['aicteId']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['amount']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['absentDays']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['action']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()))
            .toList();
      }
    });
  }
}
