import 'package:flutter/material.dart';
import 'package:apk/widgets/home_teacher_app_bar.dart';
import 'package:apk/models/class_model.dart';
import 'package:apk/services/api_service.dart';
import 'package:apk/widgets/teacher_class.dart';

class TeacherPage extends StatelessWidget {
  Future<String> _getToken() async {
    return ApiService
        .getToken(); // Utilisation de la méthode getToken du service API
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        title: 'School',
        actions: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child: const Icon(
                  Icons.notifications_active,
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
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFF2EFF6),
                ),
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage(
                                    'assets/images/default_avatar.jpeg'),
                              ),
                              const SizedBox(width: 20.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'BIN-IDRIS Rizkilaye',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        letterSpacing: 1.2,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow
                                          .ellipsis, // Empêche le texte de déborder
                                    ),
                                    const SizedBox(height: 7.0),
                                    Text(
                                      'Rizklayeb@gail.com',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        letterSpacing: 1.2,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow
                                          .ellipsis, // Empêche le texte de déborder
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Menus',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            color: Colors.white,
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
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Classes',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      FutureBuilder<String>(
                        future: _getToken(),
                        builder: (context, tokenSnapshot) {
                          if (tokenSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (tokenSnapshot.hasError) {
                            return Center(
                                child: Text('Error: ${tokenSnapshot.error}'));
                          } else if (!tokenSnapshot.hasData ||
                              tokenSnapshot.data!.isEmpty) {
                            return const Center(
                                child: Text('Token not available.'));
                          } else {
                            final accessToken = tokenSnapshot.data!;
                            return FutureBuilder<List<ClassModel>>(
                              future: ApiService.fetchClasses(
                                  accessToken), // Utilisation de fetchClasses du service API
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else if (snapshot.hasError) {
                                  return Center(
                                      child: Text('Error: ${snapshot.error}'));
                                } else if (!snapshot.hasData ||
                                    snapshot.data!.isEmpty) {
                                  return const Center(
                                      child: Text('No classes available.'));
                                } else {
                                  final classes = snapshot.data!;
                                  return ListView(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: classes.map((classModel) {
                                      return TeacherClass(
                                        className: classModel.name,
                                        icon: Icons.school,
                                        subtitle:
                                            'Nombre d\'élève: ${classModel.studentsNumber}',
                                        route: '/attendance',
                                        arguments: {
                                          'id': classModel.id,
                                          'ClassName': classModel.name,
                                        },
                                        iconColor: Color(0xff92a9db),
                                        containerColor: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade400,
                                            blurRadius: 35,
                                            spreadRadius: -7,
                                          ),
                                        ],
                                      );
                                    }).toList(),
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

  Widget _buildFeatureCard(BuildContext context,
      {required IconData icon,
      required Color color,
      required String text,
      required String route}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Column(
        children: [
          Container(
            height: 80,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(11),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
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
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
