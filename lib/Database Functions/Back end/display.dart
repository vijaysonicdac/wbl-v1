import 'package:flutter/material.dart';
import 'package:wbl/Database%20Functions/Back%20end/backend.dart';
import 'package:mysql1/mysql1.dart';

// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> students = [];

  Future<void> fetchAicteData() async {
    final conn = await DatabaseService.connect(); // Establish connection

    // Query to fetch all data from 'aicte' table
    var results = await conn.query('SELECT * FROM aicte');

    setState(() {
      students = results
          .map((row) => {
                'id': row[0], // ID column
                'aicteId': row[1], // aicteId column
                'candidateId': row[2], // candidateId column
                'createdAt': row[3].toString(), // createdAt column
                'updatedAt': row[4].toString(), // updatedAt column
                'centerId': row[5], // centerId column
              })
          .toList();
    });

    await conn.close(); // Close connection
  }

  @override
  void initState() {
    super.initState();
    fetchAicteData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter MySQL Connection')),
        body: students.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(students[index]['name']),
                    subtitle: Text('Age: ${students[index]['age']}'),
                  );
                },
              ),
      ),
    );
  }
}
