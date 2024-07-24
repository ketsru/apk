//import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';
import '../services/api_service.dart';

class UserRepository {
  final ApiService apiService;

  UserRepository({required this.apiService});

  Future<User> login(String email, String password) async {
    final response = await apiService.post(
      'login',
      {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data['status'] == 1) {
        return User.fromJson(data);
      } else {
        throw Exception('Failed to authenticate');
      }
    } else {
      throw Exception('Failed to connect to the server');
    }
  }
}
