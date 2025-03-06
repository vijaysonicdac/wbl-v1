import "package:flutter/material.dart";

class CandidateApplication extends StatefulWidget {
  const CandidateApplication({super.key});

  @override
  State<CandidateApplication> createState() => CandidateApplicationState();
}

class CandidateApplicationState extends State<CandidateApplication> {
  String searchQuery = '';

  List<Map<String, dynamic>> filteredCandidates = [];

  final List<Map<String, dynamic>> adData = [
    {
      "Sr_No": '1',
      "WBLP_ID": 'WBL_52654982314',
      "Organization": "C-DAC",
      "Technology": "Battery or Energy Storage Materials",
      "Candidate_Name": "Pawneet Singh",
      "Email": "pawneetsingh26@gmail.com",
      "mobile": "7888593541",
      "Category": 'EWS',
      "Gender": 'Male',
      "Nationality": "Indian",
      "State,City": "Chandigarh , mohali",
      "Graduation_Discipline": "BE, Electronic and communication"
    },
    {
      "Sr_No": '2',
      "WBLP_ID": 'WBL_257896421',
      "Organization": "C-DAC",
      "Technology": "Artificial Intelligence and Machine Learning",
      "Candidate_Name": "Jahanvi Roy",
      "Email": "jahanviroy26@gmail.com",
      "mobile": "80547932511",
      "Category": 'women',
      "Gender": 'female',
      "Nationality": "Indian",
      "State,City": "Chandigarh , mohali",
      "Graduation_Discipline": "BE, Electronic and communication"
    },
    {
      "Sr_No": '3',
      "WBLP_ID": 'WBL_12754982314',
      "Organization": "C-DAC",
      "Technology": "Machine Learning",
      "Candidate_Name": "Deepika",
      "Email": "deepika89@gmail.com",
      "mobile": "9658423541",
      "Category": 'EWS',
      "Gender": 'Female',
      "Nationality": "Indian",
      "State,City": "Chandigarh , mohali",
      "Graduation_Discipline": "MCA,Bca"
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
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          "Candidate Applications",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
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
                  child: DataTable(
                      border: TableBorder.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                      columns: const [
                        DataColumn(label: Text('Sr_No')),
                        DataColumn(label: Text('WBLP_ID')),
                        DataColumn(label: Text('Organization')),
                        DataColumn(label: Text('Technology')),
                        DataColumn(label: Text('Candidate_Name')),
                        DataColumn(label: Text('Email')),
                        DataColumn(label: Text('mobile')),
                        DataColumn(label: Text('Category')),
                        DataColumn(label: Text('Gender')),
                        DataColumn(label: Text('Nationality')),
                        DataColumn(label: Text('State,City')),
                        DataColumn(label: Text('Graduation_Discipline')),
                      ],
                      rows: filteredCandidates
                          .map((advertisementData) => DataRow(
                                cells: [
                                  DataCell(Text(
                                      advertisementData['Sr_No'].toString())),
                                  DataCell(Text(
                                      advertisementData['WBLP_ID'].toString())),
                                  DataCell(Text(
                                      advertisementData['Organization']
                                          .toString())),
                                  DataCell(Text(advertisementData['Technology']
                                      .toString())),
                                  DataCell(Text(
                                      advertisementData['Candidate_Name']
                                          .toString())),
                                  DataCell(Text(
                                      advertisementData['Email'].toString())),
                                  DataCell(Text(
                                      advertisementData['mobile'].toString())),
                                  DataCell(Text(advertisementData['Category']
                                      .toString())),
                                  DataCell(Text(
                                      advertisementData['Gender'].toString())),
                                  DataCell(Text(advertisementData['Nationality']
                                      .toString())),
                                  DataCell(Text(advertisementData['State,City']
                                      .toString())),
                                  DataCell(Text(
                                      advertisementData['Graduation_Discipline']
                                          .toString())),
                                ],
                              ))
                          .toList()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void searchwidget() {
    setState(() {
      if (searchQuery.isEmpty) {
        filteredCandidates = adData;
      } else {
        filteredCandidates = adData
            .where((advertisementData) =>
                advertisementData['Sr_No']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['WBLP_ID']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Organization']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Technology']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Candidate_Name']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Email']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['mobile']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Category']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Gender']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Nationality']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['State,City']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                advertisementData['Graduation_Discipline']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()))
            .toList();
      }
    });
  }
}
