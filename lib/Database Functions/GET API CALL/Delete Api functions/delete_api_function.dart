import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'http://10.228.1.73:4000/api';

Future<void> deleteApi(BuildContext context, String url) async {
  try {
    final response = await http.delete(Uri.parse(url));

    if (response.statusCode == 200) {
      print(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Deleted successfully')),
      );
    } else {
      throw Exception("Failed to load data");
    }
  } catch (e) {
    print("Error deleting candidate stipend: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $e')),
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
