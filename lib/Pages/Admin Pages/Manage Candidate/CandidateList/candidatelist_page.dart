// ignore_for_file: prefer_final_fields, unused_local_variable, non_constant_identifier_names, depend_on_referenced_packages
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wbl/Database%20Functions/GET%20API%20CALL/getstates.dart';
import 'package:wbl/Pages/Admin%20Pages/Manage%20Candidate/CandidateList/candiddate_add_icon/Candidate_Add_Stipend/add_stipend.dart';
import 'package:wbl/Pages/Admin%20Pages/Manage%20Candidate/CandidateList/candiddate_add_icon/Candidate_Add_assessment/assesment_add_icon.dart';
import 'package:wbl/Pages/Admin%20Pages/Manage%20Candidate/CandidateList/candiddate_add_icon/Candidate_View_Leave/add_viewleave.dart';
import 'package:wbl/Pages/Admin%20Pages/Manage%20Candidate/CandidateList/candiddate_add_icon/Candidate_View_Stipend/add_view_stipend.dart';
import 'package:wbl/Pages/Admin%20Pages/admin_login_page.dart';
import 'package:wbl/Reusable%20Widgets/Admin_Year_dropwon/year.dart';

// ignore: must_be_immutable
class CandidateList extends StatefulWidget {
  CandidateList({super.key, this.onclick, this.selectedButtonName});
  final Widget? onclick;
  Widget? selectedButtonName;

  @override
  State<CandidateList> createState() => _CandidateListState();
}

class _CandidateListState extends State<CandidateList> {
  String selectedCohort = 'select';
  String? selectedState;
  String selectedLevel = 'select';
  int? selectedYear;
  bool isLoading = false;
  // List<int> yearList = [];
  String? _selectedWidget;
  String searchQuery = '';
  final List<String> cohortList = [
    'select',
    'Cohort 1',
    'Cohort 2',
    'Cohort 3'
  ];
  List<String> stateList = [];
  final List<String> levelList = ['Select', 'Level 1', 'Level 2', 'Level 3'];

  List<Map<String, dynamic>> candidates = [];
  List<Map<String, dynamic>> filteredcandidate = [];

  ScrollController horizontal = ScrollController();
  ScrollController vertical = ScrollController();

  @override
  void dispose() {
    horizontal.dispose();
    vertical.dispose();
    super.dispose();
  }

  Stream<List<Map<String, dynamic>>> candidateStream() async* {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:8081/candidates'));

      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        yield data.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to load candidates');
      }
    } catch (e) {
      print("Stream error: $e");
      yield [];
    }
  }

  void searchlist() {
    setState(() {
      if (searchQuery.isEmpty) {
        filteredcandidate = candidates;
      } else {
        filteredcandidate = candidates
            .where((candidate) =>
                candidate['id']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['dateOfJoining']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['dob']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['firstName']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['lastName']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['email']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['mobile']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()))
            .toList();
      }
    });
  }

  confirmDelete(int candidateId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Do you want to delete Vacancy?',
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: const Text('You wont be able to revert this!'),
          actions: [
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blue[700]),
              child: const Text('Yes, Delete it!',
                  style: TextStyle(color: Colors.white)),
              onPressed: () {
                setState(() {
                  candidates.removeWhere((c) => c['id'] == candidateId);
                });
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('NO', style: TextStyle(color: Colors.white)),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    initFetchstates();
    candidateStream().listen((data) {
      setState(() {
        candidates = data;
        filteredcandidate = candidates;
      });
    });
  }

  void initFetchstates() async {
    List<String> names = await fetchStateNames();
    setState(() {
      stateList = ['Select', ...names];
      selectedState = stateList.isNotEmpty ? stateList.first : null;
    });
  }

  String? validateAccountNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter account number';
    }
    if (!RegExp(r'^[0-9]{9,18}$').hasMatch(value)) {
      return 'Enter a valid account number (9-18 digits)';
    }
    return null;
  }

  String? validateIFSC(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter IFSC code';
    }
    if (!RegExp(r'^[A-Z]{4}0[A-Z0-9]{6}$').hasMatch(value)) {
      return 'Enter a valid IFSC code (e.g., ABCD0123456)';
    }
    return null;
  }

  String? validateNonEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth < 500
            ? buildCardView()
            : buildTableView(); // Adjust the breakpoint as needed
        // if (constraints.maxWidth < 500) {
        //   return buildCardView(); // Small screen
        // } else {
        //   return buildTableView(); // Large screen
        // }
      },
    );
  }

  Widget buildTableView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SearchWrap(),
        Expanded(
          child: StreamBuilder<List<Map<String, dynamic>>>(
            stream: candidateStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("No data available"));
              }

              final candidates = snapshot.data!;

              return LayoutBuilder(
                builder: (context, constraints) {
                  return VerticalScrollbar(
                    vertical,
                    child: HorizontalScrollbar(
                      horizontal,
                      child: constraints.maxWidth < 500
                          ? buildCardView()
                          : DataTableWidget(candidates),
                    ),
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }

  Widget buildCardView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchWrap(),
        const SizedBox(height: 10),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: filteredcandidate.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // crossAxisCount: MediaQuery.of(context).size.width < 600 ? 2 : 3,
                crossAxisCount: 2,
                crossAxisSpacing: 8, // Horizontal space between cards
                mainAxisSpacing: 8, // Vertical space between rows
              ),
              itemBuilder: (context, index) {
                var candidate = filteredcandidate[index];
                bool isActive = candidate['Status'].toLowerCase() == "active";

                return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: StreamBuilder<Map<String, dynamic>>(
                      stream: candidateStream().asyncExpand((list) =>
                          Stream.fromIterable(list)), // pass your actual ID
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return const Center(
                              child: Text('No candidate data found.'));
                        }

                        final candidate = snapshot.data!;
                        final isActive = candidate['isActive'] == '1';

                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Name: ${candidate['firstName']} ${candidate['lastName']}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "ID: ${candidate['id']}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text("Email:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(candidate['email'],
                                    style: TextStyle(color: Colors.grey[700])),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Mobile: ${candidate['mobile']}"),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Text("DOB: ${candidate['dateOfJoining']}"),
                                SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Year: ${candidate['dob']}"),
                                    Text(
                                      "Status: ${candidate['isActive']}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: isActive
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                                buildActionButtons(candidate),
                              ],
                            ),
                          ),
                        );
                      },
                    ));
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget SearchWrap() {
    return Wrap(
      spacing: 8, // Space between dropdowns
      runSpacing: 8, // Space between rows of dropdowns
      alignment: WrapAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
            width: 180,
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
        ),
        Dropdown("Select Cohort", selectedCohort, cohortList, (newValue) {
          setState(() {
            selectedCohort = newValue!;
          });
        }),
        Dropdown("Select State", selectedState ?? "", stateList, (newValue) {
          setState(() {
            selectedState = newValue;
          });
        }),
        Dropdown("Select Level", selectedLevel, levelList, (newValue) {
          setState(() {
            selectedLevel = newValue!;
          });
        }),
        YearDropdown(
          selectedYear: selectedYear,
          onChanged: (newValue) {
            setState(() {
              selectedYear = newValue;
            });
          },
        ),
      ],
    );
  }

  Widget Dropdown(String label, String? selectedValue, List<String> items,
      ValueChanged<String?> onChanged) {
    return mysearchbutton(
      selectedValue ?? "Select",
      items,
      label,
      onChanged,
    );
  }

  Widget mysearchbutton(String? selectedItem, List<String> items,
      String labelText, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: 200,
        child: DropdownButtonFormField<String>(
          hint: Text("Select", style: TextStyle(color: Colors.black)),
          value: items.contains(selectedItem) ? selectedItem : null,
          isExpanded: true,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                maxLines: 1,
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
          ),
        ),
      ),
    );
  }

  Widget VerticalScrollbar(ScrollController controller,
      {required Widget child}) {
    return Scrollbar(
      thickness: 10,
      thumbVisibility: true,
      controller: controller,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        controller: controller,
        child: child,
      ),
    );
  }

  Widget HorizontalScrollbar(ScrollController controller,
      {required Widget child}) {
    return Scrollbar(
      thickness: 10,
      thumbVisibility: true,
      controller: controller,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        child: child,
      ),
    );
  }

  Widget DataTableWidget(List<Map<String, dynamic>> candidates) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(minWidth: MediaQuery.of(context).size.width - 200),
      child: DataTable(
        headingRowColor:
            const WidgetStatePropertyAll(Color.fromARGB(255, 224, 230, 224)),
        columns: buildDataColumns(),
        rows: filteredcandidate
            .map((candidate) => buildDataRow(candidate))
            .toList(),
      ),
    );
  }

  List<DataColumn> buildDataColumns() {
    return [
      "ID",
      "D.O.J",
      "Year",
      "Full Name", // ✅ Combine First + Last here
      "Email",
      "Mobile No.",
      "Status",
      "Action"
    ].map((title) => DataColumn(label: Text(title))).toList();
  }

  DataRow buildDataRow(Map<String, dynamic> candidate) {
    final date = DateTime.tryParse(candidate['dateOfJoining'] ?? '');
    final formattedDate =
        date != null ? DateFormat('yyyy-MM-dd').format(date) : 'Invalid date';
    final dob = DateTime.tryParse(candidate['dateOfJoining'] ?? '');
    final dobYear = dob != null ? DateFormat('yyyy').format(dob) : 'Invalid';

    final fullName =
        '${candidate['firstName'] ?? ''} ${candidate['lastName'] ?? ''}';

    return DataRow(
      cells: [
        DataCell(SizedBox(width: 30, child: Text(candidate['id'].toString()))),
        DataCell(Text(formattedDate)),
        DataCell(Text(dobYear)),
        DataCell(
          SizedBox(
            width: 160, // Adjust width as needed
            child: Text(
              fullName,
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        // 🔥 Remove separate Last Name column (Optional)
        // DataCell(SizedBox(width: 80, child: Text(candidate['lastName'] ?? ''))),
        DataCell(SizedBox(width: 150, child: Text(candidate['email'] ?? ''))),
        DataCell(Text(candidate['mobile'].toString())),
        DataCell(
            SizedBox(width: 20, child: Text(candidate['isActive'].toString()))),
        DataCell(buildActionButtons(candidate)),
      ],
    );
  }

  Widget buildActionButtons(Map<String, dynamic> candidate) {
    return Wrap(
      children: [
        IconButton(icon: const Icon(Icons.visibility), onPressed: () {}),
        popup(),
        IconButton(
          icon: const Icon(Icons.edit, color: Colors.blue),
          onPressed: () {
            // Edit action
          },
        ),
        IconButton(
          icon: const Icon(Icons.delete,
              color: Color.fromARGB(255, 226, 123, 108)),
          onPressed: () => confirmDelete(candidate['ID']),
        ),
      ],
    );
  }

  Widget popup() {
    return Column(
      children: [
        PopupMenuButton<String>(
          onSelected: (value) => handleMenuSelection(value),
          icon: const Icon(Icons.add),
          itemBuilder: (context) => _buildPopupMenuItems(),
        ),
      ],
    );
  }

  handleMenuSelection(
    String value,
  ) {
    if (value == 'Edit Bank Detail') {
      showEditBankDialog();
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => AdminLoginPage(
            selectedButtonName: value,
            bodyWidget: _getSelectedWidget(),
          ),
        ),
        (route) => false,
      );
      setState(() {
        widget.onclick;
        _selectedWidget = value;
      });
    }
  }

  showEditBankDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Bank Detail',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        content: BankForm(),
        actions: DialogActions(),
      ),
    );
  }

  Widget BankForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(children: [
            _bankTextForm('Enter Your Account Number', 'Account Number *',
                validateAccountNumber),
            _bankTextForm('Enter Your IFSC Code', 'IFSC Code *', validateIFSC)
          ]),
          Row(children: [
            _bankTextForm(
                'Enter Your Bank Name', 'Bank Name *', validateNonEmpty)
          ]),
          Row(children: [
            _bankTextForm(
                'Enter Your Bank Address', 'Bank Address *', validateNonEmpty)
          ]),
        ],
      ),
    );
  }

  List<Widget> DialogActions() {
    return [
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Text('Cancel', style: TextStyle(color: Colors.red)),
      ),
      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) Navigator.of(context).pop();
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        child: const Text('Update'),
      ),
    ];
  }

  List<PopupMenuItem<String>> _buildPopupMenuItems() {
    return [
      _popupMenuItem('Add Assessment', Icons.add, 'Add Assessment'),
      _popupMenuItem('Add Stipend', Icons.add, 'Add Stipend'),
      _popupMenuItem('View Stipend', Icons.auto_awesome_mosaic, 'View Stipend'),
      _popupMenuItem('View Leaves', Icons.auto_awesome_mosaic, 'View Leaves'),
      _popupMenuItem('Edit Bank Detail', Icons.edit, 'Edit Bank Detail'),
    ];
  }

  PopupMenuItem<String> _popupMenuItem(
      String value, IconData icon, String text) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }

  Widget _getSelectedWidget() {
    if (_selectedWidget == 'Add Assessment') {
      return const AssesmentAddIcon();
    } else if (_selectedWidget == 'Add Stipend') {
      return const Addstipend();
    } else if (_selectedWidget == 'View Stipend') {
      return const ViewStipend();
    } else if (_selectedWidget == 'View Leaves') {
      return const Viewleave();
    } else {
      return const Text('');
    }
  }

  Widget _bankTextForm(
      String hinttext, labeltext, String? Function(String?)? validation) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hinttext,
            labelText: labeltext,
            border: const OutlineInputBorder(),
          ),
          validator: validation,
        ),
      ),
    );
  }
}
