// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

class PostAuth {
  String baseUrl = "http://10.228.1.73:4000/api/Auth/login";
  Future<bool> loginuser(String username, String password) async {
    final url = Uri.parse(baseUrl);
    try {
      final respose = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          "username": "_CgJy2hyvB9dn4CG0TBa0w",
          "password": "gyhXXMo6eaowHiI4uJzJDg",
        }),
      );
      if (respose.statusCode == 200) {
        print('Login Successful: ${respose.body}');
        return true;
      } else {
        print("Error  : ${respose.statusCode} - ${respose.body}");
        return false;
      }
    } catch (e) {
      print("Exception: $e");
      return false;
    }
  }
}
