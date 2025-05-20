// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<String>> fetchStateNames() async {
  final url = Uri.parse('http://localhost:8081/states');
  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List data = json.decode(response.body);

      // Extract only the 'name' field from each item
      return data.map<String>((item) => item['name'].toString()).toList();
    } else {
      throw Exception('Failed to load state names');
    }
  } catch (e) {
    print('Error: $e');
    return [];
  }
}
