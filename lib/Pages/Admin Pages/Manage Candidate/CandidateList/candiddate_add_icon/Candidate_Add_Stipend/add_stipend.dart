import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:wbl/Pages/Admin%20Pages/admin_login_page.dart';

class Addstipend extends StatefulWidget {
  const Addstipend({super.key});

  @override
  State<Addstipend> createState() => AddstipendState();
}

class AddstipendState extends State<Addstipend> {
  final _formkey = GlobalKey<FormState>();
  DateTime? _startDate;
  DateTime? _endDate;
  String? textFieldValue;
  final controllerStartDate = TextEditingController();
  final controllerEndDate = TextEditingController();

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _startDate) {
      setState(() {
        _startDate = picked;
        controllerStartDate.text = DateFormat('yyyy-MM-dd').format(_startDate!);
        // Reset end date if it is before the selected start date
        if (_endDate != null && _endDate!.isBefore(_startDate!)) {
          _endDate = null;
          controllerEndDate.clear();
        }
      });
      _formkey.currentState?.validate();
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate ?? (_startDate ?? DateTime.now()),
      firstDate: _startDate ?? DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _endDate) {
      setState(() {
        _endDate = picked;
        controllerEndDate.text = DateFormat('yyyy-MM-dd').format(_endDate!);
      });
      _formkey.currentState?.validate();
    }
  }

  void _validateAndSubmit() {
    if (_formkey.currentState?.validate() == true) {
      _showMessage('Dates submitted successfully!');
    } else {
      _showMessage('Please fill in all required fields');
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AdminLoginPage(
          bodyWidget: const Addstipend(),
        ),
      ),
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 250, 246, 246),
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: const Color(0xffF0F9FA),
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Add Stipend',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 0.3,
                    ),
                    const SizedBox(height: 16),
                    const Wrap(
                      children: [
                        Text(
                          'Candidate name: rajesh kumar',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 100),
                        Text(
                          'Email: rajesh.kumar@drishinfo.com',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 100),
                        Text(
                          'AICTE ID: abcd1234',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                            child: _buildTextField('Amount *', 'Enter amount',
                                isNumeric: true)),
                        const SizedBox(width: 16),
                        Expanded(
                            child: _buildTextField(
                                'Absent days *', 'Enter absent days',
                                isNumeric: true)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                            child: _buildDateField(
                                'Start Date *',
                                controllerStartDate,
                                () => _selectStartDate(context))),
                        const SizedBox(width: 16),
                        Expanded(
                            child: _buildDateField(
                                'End Date *',
                                controllerEndDate,
                                () => _selectEndDate(context))),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                labelText: 'Attendance',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                            child: SizedBox(
                          width: 1,
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Card(
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: DataTable(
                      headingRowColor: const WidgetStatePropertyAll(
                          Color.fromARGB(255, 229, 226, 226)),
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
                          DataCell(Text('ML')),
                          DataCell(Text('2')),
                          DataCell(Text('4')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('CL')),
                          DataCell(Text('1')),
                          DataCell(Text('3')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('LOP')),
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
                alignment: Alignment.centerRight, child: _buildSubmitButton()),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {bool isNumeric = false}) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        fillColor: Colors.white,
        filled: true,
        labelText: label,
        hintText: hint,
      ),
      keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
      inputFormatters:
          isNumeric ? [FilteringTextInputFormatter.digitsOnly] : [],
      onChanged: (value) {
        setState(() {
          textFieldValue = value;
        });
        _formkey.currentState?.validate();
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        if (isNumeric && int.tryParse(value) == null) {
          return 'Please enter a valid number';
        }
        return null;
      },
    );
  }

  Widget _buildDateField(
      String label, TextEditingController controller, VoidCallback onTap) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        fillColor: Colors.white,
        filled: true,
        labelText: label,
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_today),
          onPressed: onTap,
        ),
      ),
      readOnly: true,
      validator: (value) {
        if (label == 'Start Date *' && _startDate == null) {
          return 'Start date required';
        }
        if (label == 'End Date *') {
          if (_endDate == null) return 'End date required';
          if (_startDate != null && _endDate!.isBefore(_startDate!)) {
            return 'End date cannot be before start date';
          }
        }
        return null;
      },
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
      onPressed: _validateAndSubmit,
      child: const Text('Submit'),
    );
  }
}
