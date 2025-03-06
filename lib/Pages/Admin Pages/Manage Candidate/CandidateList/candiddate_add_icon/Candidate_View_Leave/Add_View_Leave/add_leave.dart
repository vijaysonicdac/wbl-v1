// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wbl/Pages/Admin%20Pages/Manage%20Candidate/CandidateList/candiddate_add_icon/Candidate_View_Leave/add_viewleave.dart';
import 'package:wbl/Pages/Admin%20Pages/admin_login_page.dart';

class AddLeave extends StatefulWidget {
  const AddLeave({super.key});

  @override
  State<AddLeave> createState() => AddleaveState();
}

class AddleaveState extends State<AddLeave> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _startDate;
  DateTime? _endDate;
  String? leave_value;
  String? day_value;

  final controllerStartDate = TextEditingController();
  final controllerEndDate = TextEditingController();
  final contollerleave_items = TextEditingController();
  final contollerdays_leave_items = TextEditingController();

  final List<String> leave_items = [
    'Medical Leave',
    'Casual Leave',
    'Loss of Pay'
  ];
  final List<String> days_leave_items = ['Half Day', 'Full Day', 'Second Half'];

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _startDate = picked;
        controllerStartDate.text = DateFormat('yyyy-MM-dd').format(_startDate!);
        if (_endDate != null && _endDate!.isBefore(_startDate!)) {
          _endDate = null;
          controllerEndDate.clear();
        }
      });
      _formKey.currentState?.validate();
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: _startDate ?? DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _endDate = picked;
        controllerEndDate.text = DateFormat('yyyy-MM-dd').format(_endDate!);
      });
      _formKey.currentState?.validate();
    }
  }

  void _validateAndSubmit() {
    if (_formKey.currentState!.validate()) {
      _showMessage('Dates submitted successfully!');
    } else {
      _showMessage('Please fill in all required fields');
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AdminLoginPage(
          selectedButtonName: 'View Leave',
          bodyWidget: const Viewleave(),
        ),
      ),
    );

    setState(() {});
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Card(
        color: const Color.fromARGB(255, 250, 246, 246),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: const Color(0xffF0F9FA),
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Add Leave',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 0.3,
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Candidate name: rajesh kumar',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Email: rajesh.kumar@drishinfo.com',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'AICTE ID: abcd1234',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Dropdown(
                          'Select Leave Type',
                          leave_value,
                          'please select the leave type',
                          leave_items,
                          (value) {
                            setState(() {
                              leave_value = value;
                            });
                            _formKey.currentState?.validate();
                          },
                        ),
                        const SizedBox(width: 16),
                        Dropdown(
                          'Select Day types',
                          day_value,
                          'please select the day types',
                          days_leave_items,
                          (value) {
                            setState(() {
                              day_value = value;
                            });
                            _formKey.currentState?.validate();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controllerStartDate,
                            decoration: InputDecoration(
                              labelText: 'Start Date *',
                              border: const OutlineInputBorder(),
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.calendar_today),
                                onPressed: () => _selectStartDate(context),
                              ),
                            ),
                            readOnly: true,
                            validator: (value) {
                              if (_startDate == null) {
                                return 'Start date required';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: controllerEndDate,
                            decoration: InputDecoration(
                              labelText: 'End Date *',
                              border: const OutlineInputBorder(),
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.calendar_today),
                                onPressed: () => _selectEndDate(context),
                              ),
                            ),
                            readOnly: true,
                            validator: (value) {
                              if (_endDate == null) {
                                return 'End date required';
                              }
                              if (_endDate!.isBefore(_startDate!)) {
                                return 'End date cannot be before start date';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Card(
              shape: const RoundedRectangleBorder(
                  side: BorderSide(
                color: Colors.black,
                width: 1,
              )),
              child: Row(
                children: [
                  Expanded(
                    child: DataTable(
                      headingRowColor: WidgetStateProperty.all(Colors.blueGrey),
                      columns: const [
                        DataColumn(
                          label: Text('Leave Type'),
                        ),
                        DataColumn(
                          label: Text('Consumed'),
                        ),
                        DataColumn(
                          label: Text('Available'),
                        ),
                      ],
                      rows: const [
                        DataRow(cells: [
                          DataCell(Text('Medical Leave')),
                          DataCell(Text('2')),
                          DataCell(Text('4')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Casual Leave')),
                          DataCell(Text('1')),
                          DataCell(Text('3')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Loss of Pay')),
                          DataCell(Text('3')),
                          DataCell(Text('No limit')),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: _validateAndSubmit,
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Dropdown(String labelText, String? value, String validatorMessage,
      List<String> items, ValueChanged<String?> onChanged) {
    return Expanded(
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
          fillColor: Colors.white,
          filled: true,
        ),
        value: value,
        onChanged: onChanged,
        validator: (value) => value == null ? validatorMessage : null,
        items: items.map<DropdownMenuItem<String>>((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
      ),
    );
  }
}
