import 'package:flutter/material.dart';
import 'package:wbl/Reusable%20Widgets/Admin%20Page%20Reusable%20Widgets/login_page_format.dart';

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

  final List<Map<String, dynamic>> candidates = [
    {
      "AICTE ID": 'STU6390800df1e491670414349',
      "CANDIDATE NAME": "aniket",
      "EMAIL": 'aniket.bobby007@gmail.com',
      "AMOUNT": "1",
      "ABSENT DAYS": "12",
      "START DATE": "1 Aug. 2023",
      "END DATE": "16 Aug. 2023"
    },
    {
      "AICTE ID": 'STU6390800df1e491670414349',
      "CANDIDATE NAME": "aniket",
      "EMAIL": 'aniket.bobby007@gmail.com',
      "AMOUNT": "25",
      "ABSENT DAYS": "15",
      "START DATE": "1 Aug. 2023",
      "END DATE": "16 Aug. 2023"
    },
  ];
  List<Map<String, dynamic>> filtercandidate = [];
  @override
  void initState() {
    super.initState();
    filtercandidate = candidates;
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
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: screenWidth - LoginPageFormat.sidebarWidth),
              child: Card(
                child: DataTable(
                  headingRowColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 224, 230, 224),
                  ),
                  columns: _buildColumns(),
                  rows: filtercandidate
                      .map((Map<String, dynamic> candidate) =>
                          _buildRows(candidate))
                      .toList(),
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
        DataCell(_buildLabel(candidate['AICTE ID'].toString())),
        DataCell(_buildLabel(candidate['CANDIDATE NAME'].toString())),
        DataCell(_buildLabel(candidate['EMAIL'].toString())),
        DataCell(_buildLabel(candidate['AMOUNT'].toString())),
        DataCell(_buildLabel(candidate['ABSENT DAYS'].toString())),
        DataCell(_buildLabel(candidate['START DATE'].toString())),
        DataCell(_buildLabel(candidate['END DATE'].toString())),
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
      filtercandidate = candidates;
    } else {
      filtercandidate = candidates
          .where((candidate) =>
              candidate['AICTE ID']
                  .toString()
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase()) ||
              candidate['CnANDIDATE NAME']
                  .toString()
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase()) ||
              candidate['EMAIL']
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
              candidate['START DATE']
                  .toString()
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase()) ||
              candidate['END DATE']
                  .toString()
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase()))
          .toList();
    }
  }

  Widget _buildLabel(String label) {
    return Expanded(
      child: Text(
        label,
      ),
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
            "You won't be able to revert this for ${candidate["CANDIDATE NAME"]}?",
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
              ),
              onPressed: () {
                setState(() {
                  candidates.remove(candidate);
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
