import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String baseUrl = 'http://10.228.1.73:4000/api';

Future<void> deleteApi(BuildContext context, String url) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth_token'); // ✅ Retrieve token

    if (token == null) {
      throw Exception('❌ No token found. Please log in again.');
    }

    final response = await http.delete(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token", // ✅ Include authentication
      },
    );

    if (response.statusCode == 200) {
      print("✅ Response: ${response.body}");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('✅ Deleted successfully')),
      );
    } else {
      throw Exception(
          "❌ Failed to delete data. Status Code: ${response.statusCode}");
    }
  } catch (e) {
    print("❌ Error deleting candidate stipend: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('❌ Error: $e')),
    );
  }
}

// Function to trigger deletion of stipend
Future<void> deleteCandidateStipend(
    BuildContext context, String stipendId) async {
  String endpoint = "/Stipend/$stipendId";
  await deleteApi(context, baseUrl + endpoint);
}

Future<void> deleteVacancy(BuildContext context, String vacancyId) async {
  String endpoint = "/Vacancy/$vacancyId";
  await deleteApi(context, baseUrl + endpoint);
}

Future<void> deleteStipend(BuildContext context, stipendId) async {
  String endpoint = '/Stipend/$stipendId';
  await deleteApi(context, baseUrl + endpoint);
}
