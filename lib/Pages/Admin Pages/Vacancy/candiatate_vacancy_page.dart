import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wbl/Database%20Functions/Delete%20Api%20functions/delete_api_function.dart';
import 'package:wbl/Database%20Functions/GET%20API%20CALL/get_api_function.dart';
import 'package:wbl/Pages/Admin%20Pages/Vacancy/Vacancy_Add_icon/add_vacancy.dart';
import 'package:wbl/Pages/Admin%20Pages/admin_login_page.dart';

class VacancyClass extends StatefulWidget {
  const VacancyClass({
    super.key,
  });

  @override
  State<VacancyClass> createState() => VacancyClassState();
}

class VacancyClassState extends State<VacancyClass> {
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
  List<Map<String, dynamic>> filteredVacancy = [];
  List<Map<String, dynamic>> vacancyData = [];
  bool isLoading = true;
  String? _selectvacancy;

  @override
  void initState() {
    super.initState();
    fetchVacancyData();
  }

  Future<void> fetchVacancyData() async {
    try {
      List<dynamic> data = await getVacancyData();
      if (kDebugMode) {
        print("Fetched Data: $data");
      }
      setState(() {
        vacancyData = List<Map<String, dynamic>>.from(data);
        filteredVacancy = vacancyData;
        isLoading = false;
      });
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching stipend data: $e");
      }
      setState(() {
        isLoading = false;
      });
    }
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
            isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(minWidth: screenWidth - 200),
                          child: buildDataTable(),
                        ),
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
      "id",
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
          filteredVacancy.map((candidate) => buildDataRow(candidate)).toList(),
    );
  }

  DataRow buildDataRow(Map<String, dynamic> candidate) => DataRow(
        cells: [
          buildDataCell(candidate['numbersOfVacancy']),
          buildDataCell(candidate['level']),
          buildDataCell(candidate['id']),
          buildDataCell(candidate['startDate']),
          buildDataCell(candidate['endDate']),
          buildDataCell(candidate['cohortId']),
          buildActionCell(candidate),
        ],
      );

  searchlist() {
    setState(() {
      if (searchQuery.isEmpty) {
        filteredVacancy = vacancyData;
      } else {
        filteredVacancy = vacancyData
            .where((candidate) =>
                candidate["numbersOfVacancy"]
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate["level"]
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate["id"]
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) || // test
                candidate["startDate"]
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate["endDate"]
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate["cohortId"]
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
      BuildContext context, Map<String, dynamic> vacancy) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Do you want to delete this vacancy?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
              "You won't be able to revert this vacancy (${vacancy["numbersOfVacancy"]})?"),
          actions: <Widget>[
            TextButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blueAccent)),
              onPressed: () async {
                try {
                  await deleteVacancy(context, vacancy['id'].toString());
                  setState(() {
                    vacancyData.remove(vacancy);
                    filteredVacancy = vacancyData;
                  });
                  Navigator.of(context).pop;

                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //     content: Text(
                  //         'Vacancy with ID ${vacancy["id"]} deleted successfully!'),
                  //     backgroundColor: Colors.green,
                  //   ),
                  // );

                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('ID ${vacancy["id"]} is deleted.'),
                      backgroundColor: Colors.blue,
                    ),
                  );
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Failed to delete vacancy.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
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
                return DropdownMenuItem<String>(value: item, child: Text(item));
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
