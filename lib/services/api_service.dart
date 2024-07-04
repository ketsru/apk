import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<http.Response> post(String endpoint, Map<String, dynamic> data) async {
    final url = '$baseUrl/$endpoint';
    return await http.post(
      Uri.parse(url),
      body: data,
    );
  }

  // Define other HTTP methods (get, put, delete) if needed
}
