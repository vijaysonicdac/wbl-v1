import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<String>> fetchStateNames() async {
  final String apiUrl =
      'http://10.228.1.73:4000/api/Common/GetAllStates'; // API URL yahan daalein

  try {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((state) => state["name"].toString()).toList();
    } else {
      throw Exception('Failed to load state names');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}
