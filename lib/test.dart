import "dart:convert";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:wbl/Reusable%20Widgets/custumdatatable.dart";

class FaqClass extends StatefulWidget {
  const FaqClass({super.key});

  @override
  State<FaqClass> createState() => FaqClassState();
}

class FaqClassState extends State<FaqClass> {
  String searchQuery = '';
  bool isLoading = true;

  List<Map<String, dynamic>> originalCandidates = [];
  List<Map<String, dynamic>> filteredCandidates = [];

  @override
  void initState() {
    super.initState();
    fetchFaqsData();
  }

  Future<void> fetchFaqsData() async {
    try {
      final response = await http.get(Uri.parse("http://localhost:8080/faqs"));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);

        setState(() {
          originalCandidates = jsonData.cast<Map<String, dynamic>>();
          filteredCandidates = List.from(originalCandidates);
          isLoading = false;
        });
      } else {
        throw Exception("Failed to load FAQs: ${response.statusCode}");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error fetching data: $e");
    }
  }

  void searchwidget() {
    setState(() {
      if (searchQuery.isEmpty) {
        filteredCandidates = List.from(originalCandidates);
      } else {
        filteredCandidates = originalCandidates.where((faq) {
          return faq['id']
                  .toString()
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase()) ||
              faq['question']
                  .toString()
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase()) ||
              faq['answer']
                  .toString()
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase());
        }).toList();
      }
    });
  }

  void _showDeleteConfirmationDialog(
      BuildContext context, Map<String, dynamic> faqData) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Do you want to delete?'),
          content: const Text("You won't be able to revert this action."),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.blueAccent),
              ),
              onPressed: () {
                setState(() {
                  filteredCandidates.remove(faqData);
                  originalCandidates.remove(faqData);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Yes, Delete it',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  List<DataColumn> columns() {
    return ["id", "question", "answer", "Action"]
        .map((title) => DataColumn(label: Text(title)))
        .toList();
  }

  DataRow rowdata(Map<String, dynamic> faqData) {
    return DataRow(cells: [
      DataCell(Text(faqData['id'].toString())),
      DataCell(Text(
        faqData['question'],
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      )),
      DataCell(Text(
        faqData['answer'],
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      )),
      DataCell(Row(
        children: [
          IconButton(
            onPressed: () {}, // Add edit logic here
            icon: const Icon(Icons.edit, color: Colors.blue),
          ),
          IconButton(
            onPressed: () {
              _showDeleteConfirmationDialog(context, faqData);
            },
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
        ],
      )),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Center(
                              child: Text(
                                "Frequently Asked Questions",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {}, // Add FAQ button logic
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0)),
                            ),
                            child: const Row(
                              children: [Icon(Icons.add), Text('Add FAQ')],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(thickness: 2),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Expanded(child: SizedBox()),
                          const Text('Search:'),
                          const SizedBox(width: 5),
                          SizedBox(
                            width: 200,
                            child: TextField(
                              onChanged: (value) {
                                searchQuery = value;
                                searchwidget();
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Search...',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Custumdatatable(
                              columns: columns(),
                              rows: filteredCandidates
                                  .map((faqData) => rowdata(faqData))
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
