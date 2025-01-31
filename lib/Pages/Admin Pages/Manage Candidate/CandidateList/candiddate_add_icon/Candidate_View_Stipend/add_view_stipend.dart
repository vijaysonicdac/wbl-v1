import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class ViewStipend extends StatefulWidget {
  const ViewStipend({super.key});

  @override
  State<ViewStipend> createState() => _ViewStipendState();
}

class _ViewStipendState extends State<ViewStipend> {
  String? selectedFileName;
  String? errorMessage;

  TextEditingController documentController = TextEditingController();
  static const int maxFileSize = 200 * 1024;

  final List<Map<String, dynamic>> stipendData = [
    {
      'Month': 'july',
      'Start Date': '9 july 2023',
      'End Date': '2 jan 2024',
      'Amount': '50000',
    },
    {
      'Month': 'may',
      'Start Date': '12 may 2023',
      'End Date': '2 dec 2024',
      'Amount': '60000',
    },
  ];
  Future<void> _pickFiles(int index) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'bmp', 'pdf'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      if (file.size > maxFileSize) {
        setState(() {
          errorMessage =
              'File size is larger than 200KB, please upload less than 200KB.';
          selectedFileName = null;
          documentController.clear();
        });
      } else {
        setState(() {
          selectedFileName = file.name;
          documentController.text = selectedFileName!;
          errorMessage = null; // Clear any previous error messages
        });
      }
    } else {}
  }

  @override
  void dispose() {
    documentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: DataTable(
          headingRowColor:
              const WidgetStatePropertyAll(Color.fromARGB(255, 224, 230, 224)),
          columns: const [
            DataColumn(label: Text('Month')),
            DataColumn(label: Text('Start Date')),
            DataColumn(label: Text('End Date')),
            DataColumn(label: Text('Amount')),
            DataColumn(label: Text('Documents')),
          ],
          rows: stipendData
              .asMap() // Use asMap to get index
              .map(
                (index, stipend) => MapEntry(
                  index,
                  DataRow(
                    cells: [
                      DataCell(Text(stipend['Month'].toString())),
                      DataCell(Text(stipend['Start Date'].toString())),
                      DataCell(Text(stipend['End Date'].toString())),
                      DataCell(Text(stipend['Amount'].toString())),
                      DataCell(
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.download_done_outlined),
                              onPressed: () {
                                // Add your download logic here
                                
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.upload_file_sharp),
                              onPressed: () => _pickFiles(index), // Pass index
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .values
              .toList(),
        ),
      ),
    );
  }
}
