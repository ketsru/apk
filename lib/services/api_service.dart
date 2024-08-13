import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:apk/models/class_model.dart';
import 'package:apk/models/studente.dart';
import 'package:apk/models/attendance.dart';

const String _baseUrl = 'https://schoolapp-pink-xi.vercel.app/api/api';

class ApiService {
  // Méthode pour obtenir le token
  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    print('Retrieved Token: $token');
    return token ?? '';
  }

  final String token;

  ApiService({required this.token});

  // Méthode GET avec paramètres
  Future<Map<String, dynamic>> get(String endpoint,
      {Map<String, String>? queryParams}) async {
    final uri =
        Uri.parse('$_baseUrl/$endpoint').replace(queryParameters: queryParams);
    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.reasonPhrase}');
    }
  }

  // Méthode POST
  Future<http.Response> post(String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse('$_baseUrl/$endpoint');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode(data),
    );
    return response;
  }

  // Méthode PUT
  Future<http.Response> put(String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse('$_baseUrl/$endpoint');
    final response = await http.put(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode(data),
    );
    return response;
  }

  // Méthode DELETE
  Future<http.Response> delete(String endpoint) async {
    final url = Uri.parse('$_baseUrl/$endpoint');
    final response = await http.delete(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    return response;
  }

  // Méthode pour obtenir les classes
  static Future<List<ClassModel>> fetchClasses(String token) async {
    final apiService = ApiService(token: token);
    final response = await apiService.get('class');

    if (response['status'] == 1) {
      final List<dynamic> classesJson = response['class'];
      return classesJson
          .map((json) => ClassModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Error fetching classes: ${response['message']}');
    }
  }

  // Méthode pour obtenir les élèves dans chaque classe
  static Future<List<Student>> fetchStudents(String token,
      {required int classId}) async {
    final apiService = ApiService(token: token);
    final queryParams = {'id_class': classId.toString()};
    final response = await apiService.get('studente', queryParams: queryParams);

    if (response['status'] == 1) {
      final List<dynamic> studentsJson = response['studente'];
      print(response);
      return studentsJson
          .map((json) => Student.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Error fetching students: ${response['message']}');
    }
  }

// Méthode pour envoyer la présence des élèves
  static Future<void> sendAttendance(String token, List<Student> students,
      {required int classId}) async {
    final apiService = ApiService(token: token);

    // Convertir la liste des étudiants en JSON
    final List<Map<String, dynamic>> studentsJson =
        students.map((student) => student.toJson()).toList();
    final Map<String, dynamic> data = {
      'id_class': classId,
      'students': studentsJson,
    };

    final response = await apiService.post('presence', data);
    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      if (responseBody['status'] == 1) {
        print(responseBody['message']);
      } else {
        throw Exception(
            'Erreur lors de l\'envoi des données: ${responseBody['message']}');
      }
    } else {
      throw Exception('Erreur lors de la requête: ${response.statusCode}');
    }
  }

  // Méthode pour obtenir les attendance
  static Future<List<Attendance>> fetchAttendance(
      String token, String id) async {
    final apiService = ApiService(token: token);
    final response = await apiService.get('presence/$id');

    if (response['status'] == 1) {
      final List<dynamic> classesJson = response['presence'];
      return classesJson
          .map((json) => Attendance.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Error fetching classes: ${response['message']}');
    }
  }

  // Méthode pour envoyer des données avec des fichiers
  Future<http.Response> postWithFiles(String endpoint,
      Map<String, dynamic> data, List<http.MultipartFile> files) async {
    final uri = Uri.parse('$_baseUrl/$endpoint');
    var request = http.MultipartRequest('POST', uri)
      ..headers.addAll({
        'Authorization': 'Bearer $token',
        'Content-Type': 'multipart/form-data',
      });

    // Ajoutez les champs de formulaire
    data.forEach((key, value) {
      request.fields[key] = value.toString();
    });

    request.files.addAll(files);

    final response = await request.send();
    return http.Response.fromStream(response);
  }
}
