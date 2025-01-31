// ignore_for_file: prefer_final_fields, unused_local_variable
import 'package:flutter/material.dart';
import 'package:wbl/Pages/Admin%20Pages/Manage%20Candidate/CandidateList/candiddate_add_icon/Candidate_Add_Stipend/add_stipend.dart';
import 'package:wbl/Pages/Admin%20Pages/Manage%20Candidate/CandidateList/candiddate_add_icon/Candidate_Add_assessment/assesment_add_icon.dart';
import 'package:wbl/Pages/Admin%20Pages/Manage%20Candidate/CandidateList/candiddate_add_icon/Candidate_View_Leave/add_viewleave.dart';
import 'package:wbl/Pages/Admin%20Pages/Manage%20Candidate/CandidateList/candiddate_add_icon/Candidate_View_Stipend/add_view_stipend.dart';
import 'package:wbl/Pages/Admin%20Pages/admin_login_page.dart';
import 'package:wbl/Reusable%20Widgets/Admin%20Page%20Reusable%20Widgets/login_page_format.dart';

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
  String selectedState = 'select';
  String selectedLevel = 'select';
  String selectedYear = 'select';
  String? _selectedWidget;
  String searchQuery = '';
  List<Map<String, dynamic>> filteredcandidate = [];
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
      "ID": 52,
      "DOB": "21-06-2023",
      "Year": 2023,
      "Name": "Rajesh Kumar",
      "Email": "rajesh.kumar@example.com",
      "Mobile": "+1234567890",
      "Status": "Active"
    },
    {
      "ID": 44,
      "DOB": "01-05-2023",
      "Year": 2023,
      "Name": "Vaidik Goyal",
      "Email": "vaidik.goyal@example.com",
      "Mobile": "+0987654321",
      "Status": "Inactive"
    },
    {
      "ID": 50,
      "DOB": "21-06-2023",
      "Year": 2023,
      "Name": "Rajesh Kumar",
      "Email": "rajesh.kumar@example.com",
      "Mobile": "+1234567890",
      "Status": "Active"
    },
    {
      "ID": 4,
      "DOB": "01-05-2023",
      "Year": 2023,
      "Name": "Vaidik Goyal",
      "Email": "vaidik.goyal@example.com",
      "Mobile": "+0987654321",
      "Status": "Inactive"
    },
    {
      "ID": 5,
      "DOB": "21-06-2023",
      "Year": 2023,
      "Name": "Rajesh Kumar",
      "Email": "rajesh.kumar@example.com",
      "Mobile": "+1234567890",
      "Status": "Active"
    },
    {
      "ID": 10,
      "DOB": "01-05-2023",
      "Year": 2023,
      "Name": "Vaidik Goyal",
      "Email": "vaidik.goyal@example.com",
      "Mobile": "+0987654321",
      "Status": "Inactive"
    },
  ];

  ScrollController horizontal = ScrollController();
  ScrollController vertical = ScrollController();

  @override
  void dispose() {
    horizontal.dispose();
    vertical.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    filteredcandidate = candidates;
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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSearchWrap(),
          Expanded(
            child: buildVerticalScrollbar(
              vertical,
              child: buildHorizontalScrollbar(
                horizontal,
                child: DataTableWidget(candidates),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearchWrap() {
    return Wrap(
      spacing: 8, // Space between dropdowns
      runSpacing: 8, // Space between rows of dropdowns
      alignment: WrapAlignment.start, // Align to start
      children: [
        Padding(
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
        ),
        buildDropdown("Select Cohort", selectedCohort, cohortList, (newValue) {
          setState(() {
            selectedCohort = newValue!;
          });
        }),
        buildDropdown("State", selectedState, stateList, (newValue) {
          setState(() {
            selectedState = newValue!;
          });
        }),
        buildDropdown("Level", selectedLevel, levelList, (newValue) {
          setState(() {
            selectedLevel = newValue!;
          });
        }),
        buildDropdown("Year", selectedYear, yearList, (newValue) {
          setState(() {
            selectedYear = newValue!;
          });
        }),
      ],
    );
  }

  Widget buildDropdown(String label, String selectedValue, List<String> items,
      ValueChanged<String?> onChanged) {
    return mysearchbutton(
      selectedValue,
      items,
      label,
      onChanged,
    );
  }

  Widget mysearchbutton(String selectedItem, List<String> items,
      String labelText, ValueChanged<String?> onChanged) {
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
          onChanged: onChanged,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
          ),
        ),
      ),
    );
  }

  Widget buildVerticalScrollbar(ScrollController controller,
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

  Widget buildHorizontalScrollbar(ScrollController controller,
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

  // ignore: non_constant_identifier_names
  Widget DataTableWidget(List<Map<String, dynamic>> candidates) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minWidth:
              MediaQuery.of(context).size.width - LoginPageFormat.sidebarWidth),
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
      "Name",
      "Email",
      "Mobile No.",
      "Status",
      "Action"
    ].map((title) => DataColumn(label: mylabel(title))).toList();
  }

  DataRow buildDataRow(Map<String, dynamic> candidate) {
    return DataRow(
      cells: [
        DataCell(mylabel(candidate['ID'].toString())),
        DataCell(mylabel(candidate['DOB'].toString())),
        DataCell(mylabel(candidate['Year'].toString())),
        DataCell(mylabel(candidate['Name'].toString())),
        DataCell(mylabel(candidate['Email'].toString())),
        DataCell(mylabel(candidate['Mobile'].toString())),
        DataCell(mylabel(candidate['Status'].toString())),
        DataCell(buildActionButtons(candidate)),
      ],
    );
  }

  void searchlist() {
    setState(() {
      if (searchQuery.isEmpty) {
        filteredcandidate = candidates;
      } else {
        filteredcandidate = candidates
            .where((candidate) =>
                candidate['ID']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['DOB']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['Year']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['Name']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['Email']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                candidate['Mobile']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()))
            .toList();
      }
    });
  }

  Widget buildActionButtons(Map<String, dynamic> candidate) {
    return Wrap(
      children: [
        IconButton(icon: const Icon(Icons.visibility), onPressed: () {}),
        widget.onclick ?? popup(),
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
                  candidates.removeWhere((c) => c['ID'] == candidateId);
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

  Widget mylabel(String label) {
    return Expanded(child: Text(label));
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
        content: _buildBankForm(),
        actions: _buildDialogActions(),
      ),
    );
  }

  Widget _buildBankForm() {
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

  List<Widget> _buildDialogActions() {
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
