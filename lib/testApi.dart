// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:wbl/model.dart';

// class Testapi extends StatefulWidget {
//   const Testapi({super.key});

//   @override
//   State<Testapi> createState() => _TestapiState();
// }

// class _TestapiState extends State<Testapi> {
//   Stipend? stipendData;

//   // Add the API token here (replace with your actual token)
//   final String apiToken =
//       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiX0NnSnkyaHl2QjlkbjRDRzBUQmEwdyIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlBJIiwiZGF0YSI6IntcInVzZXJJZFwiOjEsXCJvcmdhbmlzYXRpb25JZFwiOjEsXCJjZW50ZXJJZFwiOjUsXCJyb2xlSWRcIjo0fSIsImV4cCI6MTc0MTMyMzkxOSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NTAwMSIsImF1ZCI6Imh0dHBzOi8vbG9jYWxob3N0OjUwMDEifQ.O7n36lXl7aahsde8zojNxpAzRQHQ5o0_IP9RicdCJsE';

//   // Function to fetch data from the API
//   Future<void> getApi() async {
//     try {
//       final response = await http.get(
//         Uri.parse("http://10.228.1.73:4000/api/Stipend/47"),
//         headers: {
//           'Authorization':
//               'Bearer $apiToken', // Add the Bearer token to the headers
//         },
//       );

//       if (response.statusCode == 200) {
//         setState(() {
//           stipendData = Stipend.fromJson(json.decode(response.body));
//         });
//         print("Response: ${response.body}");
//       } else {
//         setState(() {
//           stipendData = null; // No data fetched, show error message
//         });
//         print("Failed to load data: ${response.statusCode}");
//       }
//     } catch (e) {
//       print("Error: $e");
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     getApi(); // Fetch data when widget is initialized
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Test API'),
//       ),
//       body: Center(
//         child: stipendData == null
//             ? CircularProgressIndicator() // Show loading indicator while waiting for data
//             : Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Candidate Name: ${stipendData!.candidateName}',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'Amount: ₹${stipendData!.amount}',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'Email: ${stipendData!.email}',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'Start Date: ${stipendData!.startDate}',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'End Date: ${stipendData!.endDate}',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   ],
//                 ),
//               ),
//       ),
//     );
//   }
// }
