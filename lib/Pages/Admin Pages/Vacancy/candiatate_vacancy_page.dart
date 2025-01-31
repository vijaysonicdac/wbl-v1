import 'package:flutter/material.dart';
import 'package:wbl/Pages/Admin%20Pages/Vacancy/Vacancy_Add_icon/add_vacancy.dart';
import 'package:wbl/Pages/Admin%20Pages/admin_login_page.dart';
import 'package:wbl/Reusable%20Widgets/Admin%20Page%20Reusable%20Widgets/login_page_format.dart';

class Vacancyclass extends StatefulWidget {
  const Vacancyclass({
    super.key,
  });
  @override
  State<Vacancyclass> createState() => VacancyclassState();
}

class VacancyclassState extends State<Vacancyclass> {
  String selectedCohort = 'select';
  String selectedLevel = 'select';
  String searchQuery = '';
  final List<String> cohortList = [
    'select',
    'Cohort 1',
    'Cohort 2',
    'Cohort 3'
  ];
  final List<String> levelList = ['select', 'Level 1', 'Level 2', 'Level 3'];
  final List<Map<String, dynamic>> candidates = [
    {
      "VACANCY": '20',
      "LEVEL": "L2",
      "START DATE": '	1 Jan. 2023',
      "END DATE": "	30 Jun. 2023",
      "COHORT": "2",
    },
    {
      "VACANCY": '15',
      "LEVEL": "L2",
      "START DATE": '	1 Jan. 2023',
      "END DATE": "	30 Jun. 2023",
      "COHORT": "1",
    },
    {
      "VACANCY": '10',
      "LEVEL": "L2",
      "START DATE": '	1 Jan. 2023',
      "END DATE": "	30 Jun. 2023",
      "COHORT": "3",
    },
  ];

  List<Map<String, dynamic>> filtercandidate = [];
  String? _selectvacancy;

  @override
  void initState() {
    super.initState();
    filtercandidate = candidates;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 400,
      color: Colors.white,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              children: [
                buildSearchField(),
                mysearchbutton(selectedCohort, cohortList, 'Current Cohort'),
                mysearchbutton(selectedLevel, levelList, 'Level'),
                buildAddButton(),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: screenWidth - LoginPageFormat.sidebarWidth),
                  child: buildDataTable(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearchField() => Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
          width: 200,
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

  Widget buildAddButton() => Align(
        alignment: Alignment.topRight,
        child: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => AdminLoginPage(
                  selectedButtonName: 'Add Vacancy',
                  bodyWidget: _getselectvacancy(),
                ),
              ),
              (Route<dynamic> route) => false,
            );
            setState(() {
              _selectvacancy = 'Add Vacancy';
            });
          },
          icon: const Icon(Icons.add_circle_outline),
          iconSize: 40,
          color: Colors.black,
        ),
      );

  Widget buildDataTable() {
    final columns = [
      "VACANCY",
      "LEVEL",
      "START DATE",
      "END DATE",
      "COHORT",
      "ACTION"
    ];
    return DataTable(
      headingRowColor: const WidgetStatePropertyAll(
        Color.fromARGB(255, 224, 230, 224),
      ),
      columns:
          columns.map((title) => DataColumn(label: mylabel(title))).toList(),
      rows:
          filtercandidate.map((candidate) => buildDataRow(candidate)).toList(),
    );
  }

  DataRow buildDataRow(Map<String, dynamic> candidate) => DataRow(
        cells: [
          buildDataCell(candidate['VACANCY']),
          buildDataCell(candidate['LEVEL']),
          buildDataCell(candidate['START DATE']),
          buildDataCell(candidate['END DATE']),
          buildDataCell(candidate['COHORT']),
          buildActionCell(candidate),
        ],
      );

  searchlist() {
    setState(() {
      if (searchQuery.isEmpty) {
        filtercandidate = candidates;
      } else {
        filtercandidate = candidates
            .where((candidate) =>
                candidate["VACANCY"]
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate["LEVEL"]
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate["START DATE"]
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate["END DATE"]
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate["COHORT"]
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()))
            .toList();
      }
    });
  }

  DataCell buildDataCell(dynamic value) => DataCell(mylabel(value.toString()));

  DataCell buildActionCell(Map<String, dynamic> candidate) => DataCell(
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.delete,
                  color: Color.fromARGB(255, 226, 123, 108)),
              onPressed: () =>
                  _showDeleteConfirmationDialog(context, candidate),
            ),
          ],
        ),
      );

  void _showDeleteConfirmationDialog(
      BuildContext context, Map<String, dynamic> candidate) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Do you want to delete stipend?',
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text(
              "You wo'nt be able to revert this ${candidate["CANDIDATE NAME"]}?"),
          actions: <Widget>[
            TextButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blueAccent)),
              onPressed: () {
                setState(() {
                  candidates.remove(candidate);
                });
                Navigator.of(context).pop();
              },
              child: const Text(
                'Yes, Delete it',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red)),
              onPressed: () {
                Navigator.of(context).pop();
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

  Widget mysearchbutton(
    String selecteditem,
    List<String> items,
    String labelText,
  ) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
            width: 200,
            child: DropdownButtonFormField<String>(
              value: selecteditem,
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
                  } else if (items == levelList) {
                    selectedLevel = newValue!;
                  }
                });
              },
              decoration: InputDecoration(
                labelText: labelText,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget mylabel(label) {
    return Expanded(
      child: Text(label),
    );
  }

  Widget _getselectvacancy() {
    if (_selectvacancy == 'Add Vacancy') {
      return const Addvacancy();
    } else {
      return const Text('');
    }
  }
}
