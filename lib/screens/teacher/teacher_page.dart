import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:apk/widgets/custom_app_bar.dart';
import 'package:apk/widgets/class_modal.dart';
import 'package:apk/models/class_model.dart';

// Function to fetch classes
Future<List<ClassModel>> fetchClasses(String token) async {
  final response = await http.get(
    Uri.parse('https://schoolapp-pink-xi.vercel.app/api/api/class'),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = json.decode(response.body);

    if (responseData['status'] == 1) {
      final List<dynamic> classesJson = responseData['class'];
      return classesJson.map((json) => ClassModel.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching classes');
    }
  } else {
    throw Exception('Server error');
  }
}

class TeacherPage extends StatelessWidget {
  Future<String> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    print('Retrieved Token: $token');
    return token ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'School',
        actions: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.orange[600],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child: const Icon(
                  Icons.notifications_active,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildFeatureCard(
                              context,
                              icon: Icons.menu_book,
                              color: Colors.blue[300]!,
                              text: 'Cours',
                              route: '/cours',
                            ),
                            const SizedBox(width: 16),
                            _buildFeatureCard(
                              context,
                              icon: Icons.assignment,
                              color: Colors.grey.shade200,
                              text: 'Exercice',
                              route: '/exercice',
                            ),
                            const SizedBox(width: 16),
                            _buildFeatureCard(
                              context,
                              icon: Icons.grade,
                              color: Colors.green[300]!,
                              text: 'Note',
                              route: '/note',
                            ),
                            const SizedBox(width: 16),
                            _buildFeatureCard(
                              context,
                              icon: Icons.check_circle,
                              color: Colors.orange[300]!,
                              text: 'Présence',
                              route: '/attendance',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Classes',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      FutureBuilder<String>(
                        future: _getToken(),
                        builder: (context, tokenSnapshot) {
                          if (tokenSnapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (tokenSnapshot.hasError) {
                            return Center(child: Text('Error: ${tokenSnapshot.error}'));
                          } else if (!tokenSnapshot.hasData || tokenSnapshot.data!.isEmpty) {
                            return const Center(child: Text('Token not available.'));
                          } else {
                            final accessToken = tokenSnapshot.data!;
                            return FutureBuilder<List<ClassModel>>(
                              future: fetchClasses(accessToken),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const Center(child: CircularProgressIndicator());
                                } else if (snapshot.hasError) {
                                  return Center(child: Text('Error: ${snapshot.error}'));
                                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                  return const Center(child: Text('No classes available.'));
                                } else {
                                  final classes = snapshot.data!;
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: classes.length,
                                    itemBuilder: (context, index) {
                                      final classModel = classes[index];
                                      return Card(
                                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: ListTile(
                                          leading: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.orange,
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: const Center(
                                              child: Icon(
                                                Icons.class_,
                                                color: Colors.white,
                                                size: 24,
                                              ),
                                            ),
                                          ),
                                          contentPadding: const EdgeInsets.all(12.0),
                                          title: Text(
                                            classModel.name,
                                            style: const TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          subtitle: Text('Nombre d\'élève: ${classModel.studentsNumber}'),
                                          trailing: const Icon(Icons.arrow_forward_ios),
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return ClassModal(classModel: classModel);
                                              },
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context, {required IconData icon, required Color color, required String text, required String route}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(11),
              boxShadow: const [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Center(
              child: Icon(
                icon,
                size: 40,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
