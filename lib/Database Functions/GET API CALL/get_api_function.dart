import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String baseUrl = 'http://10.228.1.73:4000/api';

// General Function to Fetch API Data (Handles POST Requests)
Future<List<dynamic>> fetchApiData(String url) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth_token'); // ✅ Retrieve token

    if (token == null) {
      throw Exception('❌ No token found. Please log in again.');
    }

    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token", // ✅ Include authentication token
      },
      body: jsonEncode({}),
    );

    if (kDebugMode) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    }

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data;
    } else if (response.statusCode == 401) {
      throw Exception(
          '❌ Unauthorized: Token may have expired. Please log in again.');
    } else {
      throw Exception('❌ Failed to load data from $url');
    }
  } catch (error) {
    throw Exception('❌ Error fetching data from $url: $error');
  }
}

// Function to fetch data from API
Future<Map<String, dynamic>> fetchApiGetData(String url) async {
  try {
    final response = await http.get(
      Uri.parse(url),
    );

    if (kDebugMode) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    }

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("Outputxx: $data");
      return data;
    } else {
      throw Exception('Failed to load data from $url');
    }
  } catch (error) {
    throw Exception('Error fetching data from $url: $error');
  }
}

//Stipend

Future<List<dynamic>> getApiStipend() async {
  const String endpoint = '/Stipend/GetAll';
  return fetchApiData(baseUrl + endpoint);
}

//Vacancy Post

Future<List<dynamic>> getVacancyData() async {
  const String endpoint = '/Vacancy/GetAll';
  return fetchApiData(baseUrl + endpoint);
}

// Function to get stipend ID data
Future<Map<String, dynamic>> getStipendId() async {
  const String endpoint = '/Stipend/47';
  return fetchApiGetData(baseUrl + endpoint);
}
