import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wbl/Pages/Admin%20Pages/Vacancy/candiatate_vacancy_page.dart';
import 'package:wbl/Pages/Admin%20Pages/admin_login_page.dart';

class Addvacancy extends StatefulWidget {
  const Addvacancy({super.key});

  @override
  State<Addvacancy> createState() => AddvacancyState();
}

class AddvacancyState extends State<Addvacancy> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _startDate;
  DateTime? _endDate;
  final controllerStartDate = TextEditingController();
  var controllerEndDate = TextEditingController();
  String? textFieldValue;
  String? selectedCohort;
  String? selectedLevel;

  final List<String> cohortList = ['select', 'cohort1', 'cohort2', 'cohort3'];
  final List<String> levelList = ['select', 'l1', 'l2'];

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
          controllerEndDate.clear();
          _endDate = null;
        }
      });
      _formKey.currentState?.validate();
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate:
          _startDate ?? DateTime(2000), // Start date must be before end date
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
      if (_endDate!.isBefore(_startDate!)) {
        _showMessage('End date cannot be before start date');
        return;
      }

      _showMessage('Dates submitted successfully!');
    } else {
      _showMessage('Please fill in all required fields');
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AdminLoginPage(
          bodyWidget: VacancyClass(),
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
    return Form(
      key: _formKey,
      child: Container(
        height: 400,
        color: Colors.white,
        child: Card(
          color: const Color.fromARGB(255, 222, 231, 223),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add Vacancy',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 0.3,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Vacancy *',
                          hintText: 'Vacancy',
                        ),
                        onChanged: (value) {
                          setState(() {
                            textFieldValue = value;
                          });
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter vacancy';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          labelText: 'Current cohort',
                          hintText: 'Select cohort',
                        ),
                        value: selectedCohort,
                        items: cohortList.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            selectedCohort = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Level',
                        ),
                        value: selectedLevel,
                        items: levelList.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            selectedLevel = value;
                          });
                        },
                      ),
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
                          return null; // No error if start date is selected
                        },
                        onChanged: (value) {
                          setState(
                              () {}); // Re-trigger validation when user types
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
                          return null; // No error if end date is valid
                        },
                        onChanged: (value) {
                          setState(
                              () {}); // Re-trigger validation when user types
                        },
                      ),
                    ),
                  ],
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
        ),
      ),
    );
  }
}
