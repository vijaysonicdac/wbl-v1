import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Cohortpage extends StatefulWidget {
  const Cohortpage({super.key});

  @override
  State<Cohortpage> createState() => CohortpageState();
}

class CohortpageState extends State<Cohortpage> {
  final _formkey = GlobalKey<FormState>();
  DateTime? _startDate;
  DateTime? _endDate;
  final controllerStartDate = TextEditingController();
  var controllerEndDate = TextEditingController();

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
      _formkey.currentState?.validate();
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
      _formkey.currentState?.validate();
    }
  }

  void _validateAndSubmit() {
    if (_formkey.currentState!.validate()) {
      if (_endDate!.isBefore(_startDate!)) {
        _showMessage('End date cannot be before start date');
        return;
      }

      _showMessage('Dates submitted successfully!');
    } else {
      _showMessage('Please fill in all required fields');
    }
  }

  // Show a message in a SnackBar
  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: buildInfoCard(),
            ),
            buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget buildInfoCard() {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.grey, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      color: const Color.fromARGB(255, 222, 231, 223),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cohortpage Update',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 2),
            const SizedBox(height: 16),
            const Text('Active Cohortpage: Cohortpage3'),
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
                      return null; // No error if end date is valid
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSubmitButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
              side: const BorderSide(color: Colors.white),
            ),
          ),
          onPressed: _validateAndSubmit,
          child: const Text('Submit'),
        ),
      ),
    );
  }
}
