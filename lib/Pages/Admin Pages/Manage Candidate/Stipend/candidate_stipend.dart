import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wbl/Database%20Functions/GET%20API%20CALL/Delete%20Api%20functions/delete_api_function.dart';
import 'package:wbl/Database%20Functions/GET%20API%20CALL/get_api_function.dart';

class Stipendclass extends StatefulWidget {
  const Stipendclass({super.key});
  @override
  State<Stipendclass> createState() => StipendclassState();
}

class StipendclassState extends State<Stipendclass> {
  String selectedCohort = 'select';
  String selectedState = 'select';
  String selectedLevel = 'select';
  String selectedYear = 'select';
  String searchQuery = '';

  final List<String> cohortList = [
    'select',
    'Cohort 1',
    'Cohort 2',
    'Cohort 3'
  ];
  final List<String> stateList = ['select', 'State 1', 'State 2', 'State 3'];
  final List<String> levelList = ['select', 'Level 1', 'Level 2', 'Level 3'];
  final List<String> yearList = ['select', '2022', '2023', '2024'];

  List<Map<String, dynamic>> candidates = [];
  List<Map<String, dynamic>> filtercandidate = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchStipendData();
  }

  Future<void> fetchStipendData() async {
    setState(() {
      isLoading = true;
    });

    try {
      List<dynamic> responseData = await getApiStipend();
      if (kDebugMode) {
        print('$responseData');
      }
      setState(() {
        candidates = List<Map<String, dynamic>>.from(responseData);
        filtercandidate = candidates;
        isLoading = false;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching stipend data: $e');
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 4,
          runSpacing: 8.0,
          alignment: WrapAlignment.start,
          children: [
            _buildSearchField(),
            mySearchButton(selectedCohort, cohortList, 'Current Cohort'),
            mySearchButton(selectedState, stateList, 'State'),
            mySearchButton(selectedLevel, levelList, 'Level'),
            mySearchButton(selectedYear, yearList, 'Year'),
          ],
        ),
        const SizedBox(height: 10),
        isLoading
            ? Center(child: CircularProgressIndicator())
            : Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: screenWidth - 200),
                    child: Card(
                      child: DataTable(
                        headingRowColor: WidgetStateProperty.all(
                          const Color.fromARGB(255, 224, 230, 224),
                        ),
                        columns: _buildColumns(),
                        rows: filtercandidate.isNotEmpty
                            ? filtercandidate
                                .map((Map<String, dynamic> candidate) =>
                                    _buildRows(candidate))
                                .toList()
                            : [],
                      ),
                    ),
                  ),
                ),
              ),
      ],
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: 150,
        child: TextField(
          decoration: const InputDecoration(
            labelText: 'Search',
            hintText: 'Search column',
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
    );
  }

  List<DataColumn> _buildColumns() {
    return [
      DataColumn(label: _buildLabel("AICTE ID")),
      DataColumn(label: _buildLabel("CANDIDATE NAME")),
      DataColumn(label: _buildLabel("EMAIL")),
      DataColumn(label: _buildLabel("AMOUNT")),
      DataColumn(label: _buildLabel("ABSENT DAYS")),
      DataColumn(label: _buildLabel("START DATE")),
      DataColumn(label: _buildLabel("END DATE")),
      DataColumn(label: _buildLabel("Action")),
    ];
  }

  DataRow _buildRows(Map<String, dynamic> candidate) {
    return DataRow(
      cells: [
        DataCell(Text(candidate['aicteId']?.toString() ?? '')),
        DataCell(Text(candidate['candidateName']?.toString() ?? '')),
        DataCell(Text(candidate['email']?.toString() ?? '')),
        DataCell(Text(candidate['amount']?.toString() ?? '')),
        DataCell(Text(candidate['absentDays']?.toString() ?? '')),
        DataCell(Text(candidate['startDate']?.toString() ?? '')),
        DataCell(Text(candidate['endDate']?.toString() ?? '')),
        DataCell(
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => _showDeleteConfirmationDialog(context, candidate),
          ),
        ),
      ],
    );
  }

  searchlist() {
    if (searchQuery.isEmpty) {
      setState(() {
        filtercandidate = candidates;
      });
    } else {
      setState(() {
        filtercandidate = candidates
            .where((candidate) =>
                candidate['aicteId']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['candidateName']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['email']
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
                candidate['startDate']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['endDate']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()))
            .toList();
      });
    }
  }

  Widget _buildLabel(String label) {
    return Expanded(
      child: Text(label),
    );
  }

  Widget mySearchButton(
      String selectedItem, List<String> items, String labelText) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: 150,
        child: DropdownButtonFormField<String>(
          value: selectedItem,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              if (items == cohortList) {
                selectedCohort = newValue!;
              } else if (items == stateList) {
                selectedState = newValue!;
              } else if (items == levelList) {
                selectedLevel = newValue!;
              } else if (items == yearList) {
                selectedYear = newValue!;
              }
            });
          },
          decoration: InputDecoration(
            labelText: labelText,
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(
      BuildContext context, Map<String, dynamic> candidate) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Do you want to delete stipend?'),
          content: Text(
            "You won't be able to revert this for ${candidate["candidateName"]}?",
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
              ),
              onPressed: () async {
                await deleteStipend(context, candidate['id'].toString());

                setState(() {
                  candidates.remove(candidate);
                  filtercandidate = candidates;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Yes, Delete it',
                  style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
