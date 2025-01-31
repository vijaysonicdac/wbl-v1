import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  PrivacyPolicyPageState createState() => PrivacyPolicyPageState();
}

class PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  final TextEditingController _policyController = TextEditingController();
  String lastUpdatedDate = "January 11, 2024";

  @override
  void initState() {
    super.initState();
    // Load the initial privacy policy content
    _policyController.text = '''
This Privacy Policy describes Our policies and procedures on the collection, use, and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.

We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy.

Interpretation and Definitions
Interpretation
The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.
    ''';
  }

  void _updatePolicy() {
    setState(() {
      lastUpdatedDate = DateTime.now().toLocal().toString().split(' ')[0];
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Privacy Policy updated successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Privacy Policy",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Last updated: $lastUpdatedDate",
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _policyController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Write your privacy policy here...",
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _updatePolicy,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text("Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
