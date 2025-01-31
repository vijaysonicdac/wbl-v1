import 'package:flutter/material.dart';

class MyEnrollmentPassword extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final FormFieldValidator<String>? validator;

  const MyEnrollmentPassword({
    super.key,
    required this.controller,
    required this.hintText, // Added a comma here
    required this.labelText, // Added this line to include labelText
    required this.validator,
    AutovalidateMode? autovalidationMode,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MyEnrollmentPasswordState createState() => _MyEnrollmentPasswordState();
}

class _MyEnrollmentPasswordState extends State<MyEnrollmentPassword> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        fillColor: Colors.white,
        filled: true,
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: _togglePasswordVisibility,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Password can\'t be empty';
            } else if (value.length < 6) {
              return 'Password must be at least 6 characters long';
            }
            return null;
          },
    );
  }
}
