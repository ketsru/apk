import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:apk/models/class_model.dart';

class ClassService {
  final String apiUrl = 'https://schoolapp-pink-xi.vercel.app/api/api/class/class';
  final String token;

  ClassService({required this.token});

  Future<List<ClassModel>> fetchClasses() async {
  final response = await http.get(
    Uri.parse(apiUrl),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final List classesJson = data['class'];
    return classesJson.map((json) => ClassModel.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load classes');
  }
}

}
