import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:wbl/Reusable%20Widgets/custumdatatable.dart';

class ReportUpdateClass extends StatefulWidget {
  const ReportUpdateClass({super.key});

  @override
  State<ReportUpdateClass> createState() => _ReportUpdateClassState();
}

class _ReportUpdateClassState extends State<ReportUpdateClass> {
  List<Map<String, dynamic>> candidate = [
    {
      "S_No": 1,
      "IO": "C-DAC",
      "PI": "Mohali",
      "Enrolled": "113",
      "Completed_L1": 28,
      "Completed_L2": 0,
      "Ongoing_L1": 66,
      "Ongoing_L2": 9,
      "Posted": "24"
    },
    {
      "S_No": 2,
      "IO": "C-DAC",
      "PI": "Mohali",
      "Enrolled": "113",
      "Completed_L1": 28,
      "Completed_L2": 0,
      "Ongoing_L1": 66,
      "Ongoing_L2": 9,
      "Posted": "24"
    },
    {
      "S_No": 3,
      "IO": "C-DAC",
      "PI": "Mohali",
      "Enrolled": "113",
      "Completed_L1": 28,
      "Completed_L2": 0,
      "Ongoing_L1": 66,
      "Ongoing_L2": 9,
      "Posted": "24"
    },
    {
      "S_No": 4,
      "IO": "C-DAC",
      "PI": "Mohali",
      "Enrolled": "113",
      "Completed_L1": 28,
      "Completed_L2": 0,
      "Ongoing_L1": 66,
      "Ongoing_L2": 9,
      "Posted": "24"
    },
  ];

  String? selectedFileName;
  String? errorMessage;
  String? selectedFileNameSecond;
  String? errorMessageSecond;
  TextEditingController cSV1 = TextEditingController();
  TextEditingController cS2 = TextEditingController();
  static const int maxFileSize = 200 * 1024;
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jped', 'png', 'bmp', 'pdf'],
      withData: true,
    );
    if (result != null) {
      PlatformFile file = result.files.first;

      if (file.size > maxFileSize) {
        setState(() {
          errorMessage =
              'File size is larger than 200KB, please upload less then 200KB,';
          selectedFileName = null;
          cSV1.clear();
        });
      } else {
        setState(() {
          errorMessage = null;
          selectedFileName = file.name;
          cSV1.text = selectedFileName!;
        });
      }
    }
  }

  Future<void> pickFileSecond() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jped', 'png', 'bmp', 'pdf'],
      withData: true,
    );
    if (result != null) {
      PlatformFile file = result.files.first;

      if (file.size > maxFileSize) {
        setState(() {
          errorMessageSecond =
              'File size is larger than 200KB, please upload less then 200KB,';
          selectedFileNameSecond = null;
          cS2.clear();
        });
      } else {
        setState(() {
          errorMessageSecond = null;
          selectedFileNameSecond = file.name;
          cS2.text = selectedFileNameSecond!;
        });
      }
    }
  }

  @override
  // void dispose() {
  //   CSV1.dispose();
  //   super.dispose();
  // }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                  ),
                  child: Text('Click To Truncate Previous Data'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              rowToColumn(
                [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Upload Report CSV File"),
                        SizedBox(
                          height: 5,
                        ),
                        mytextfield(cSV1, pickFile),
                        if (errorMessage != null)
                          Text(
                            errorMessage!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        SizedBox(
                          height: 5,
                        ),
                        myElevatedButton(),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 200,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Upload Report CSV File"),
                        SizedBox(
                          height: 5,
                        ),
                        mytextfield(cS2, pickFileSecond),
                        if (errorMessageSecond != null)
                          Text(
                            errorMessageSecond!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        SizedBox(
                          height: 5,
                        ),
                        myElevatedButton(),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Custumdatatable(
                          columns: columns(),
                          rows: candidate
                              .map((candidateData) => rowdata(candidateData))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DataColumn> columns() {
    return [
      'S_No',
      'IO',
      "PI",
      'Enrolled',
      'Completed_L1',
      'Completed_L2',
      'Ongoing_L1',
      'Ongoing_L2',
      "Posted"
    ].map((title) => DataColumn(label: mylabel(title))).toList();
  }

  DataRow rowdata(Map<String, dynamic> candidateData) {
    return DataRow(
      cells: [
        DataCell(mylabel(candidateData['S_No'].toString())),
        DataCell(mylabel(candidateData['IO'].toString())),
        DataCell(mylabel(candidateData['PI'].toString())),
        DataCell(mylabel(candidateData['Enrolled'].toString())),
        DataCell(mylabel(candidateData['Completed_L1'].toString())),
        DataCell(mylabel(candidateData['Completed_L2'].toString())),
        DataCell(mylabel(candidateData['Ongoing_L1'].toString())),
        DataCell(mylabel(candidateData['Ongoing_L2'].toString())),
        DataCell(mylabel(candidateData['Posted'].toString())),
      ],
    );
  }

  Widget mylabel(String label) {
    return Text(label);
  }

  Widget rowToColumn(List<Widget> children) {
    return LayoutBuilder(builder: (context, constraints) {
      bool screenSize = constraints.maxWidth > 600;
      return screenSize
          ? Expanded(
              child: Row(
                children: children,
              ),
            )
          : Column(
              children: children.map((children) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: children,
                );
              }).toList(),
            );
    });
  }

  Widget myElevatedButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        side: BorderSide(color: Colors.green),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      child: Text("Import CSV"),
    );
  }

  Widget mytextfield(TextEditingController controller, Function()? onPressed) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  )),
              child: Text('Choose File')),
        ),
      ),
    );
  }
}
