import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String baseUrl = "http://10.228.1.73:4000/api";

Future<bool> loginUser(
    String url, String encryptedUsername, String encryptedPassword) async {
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
          {"UserName": encryptedUsername, "Password": encryptedPassword}),
    );

    if (kDebugMode) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    }

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);

      if (responseBody.containsKey('token')) {
        String token = responseBody['token'];
        if (kDebugMode) {
          print("✅ Saving Token: $token");
        }

        // Save the token using SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', token);

        return true;
      } else {
        if (kDebugMode) {
          print("❌ No token in the response");
        }
        return false;
      }
    } else {
      if (kDebugMode) {
        print('❌ Login failed. Status Code: ${response.statusCode}');
      }
      return false;
    }
  } catch (e) {
    print('❌ Error: $e');
    return false;
  }
}

Future<bool> loginAdmin(String encryptedUsername, String encryptedPassword) {
  String endPoint = '/Auth/login';
  return loginUser(baseUrl + endPoint, encryptedUsername, encryptedPassword);
}
