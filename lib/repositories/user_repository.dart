import 'dart:convert';
import 'package:http/http.dart' as http;
import '../services/api_service.dart';
import '../models/user.dart';

class UserRepository {
  final ApiService apiService;

  UserRepository({required this.apiService});

  Future<User> authenticate(String username, String password) async {
    final response = await apiService.post('login', {
      'username': username,
      'password': password,
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return User.fromJson(data);
    } else {
      throw Exception('Failed to authenticate user');
    }
  }

  Future<void> persistToken(String token) async {
    // Persist token in local storage
  }

  Future<void> deleteToken() async {
    // Delete token from local storage
  }

  //Future<bool> hasToken() async {
    // Check if token exists
  //}
}
