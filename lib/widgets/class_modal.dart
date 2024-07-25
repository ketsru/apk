import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:apk/models/class_model.dart';
import 'package:apk/models/student_model.dart';
import 'package:apk/widgets/custom_icon_button.dart';

// Fonction pour récupérer les élèves
Future<List<Student>> fetchStudents(int classId, String token) async {
  final response = await http.get(
    Uri.parse('https://schoolapp-pink-xi.vercel.app/api/api/studente/4'),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = json.decode(response.body);

    if (responseData['status'] == 1) {
      final List<dynamic>? studentsJson = responseData['students'] as List<dynamic>?;

      if (studentsJson != null) {
        return studentsJson.map((json) => Student.fromJson(json)).toList();
      } else {
        throw Exception('Aucune donnée d\'élèves trouvée');
      }
    } else {
      throw Exception('Erreur de récupération des élèves');
    }
  } else {
    throw Exception('Erreur de serveur');
  }
}

class ClassModal extends StatefulWidget {
  final ClassModel classModel;

  ClassModal({required this.classModel});

  @override
  _ClassModalState createState() => _ClassModalState();
}

class _ClassModalState extends State<ClassModal> {
  late Future<List<Student>> _studentsFuture;

  @override
  void initState() {
    super.initState();
    _studentsFuture = _getToken().then((token) => fetchStudents(widget.classModel.id, token));
  }

  Future<String> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    return token ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // En-tête du modal
            Container(
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Color.fromARGB(255, 37, 36, 36), width: 1.0)),
              ),
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Classe: ${widget.classModel.name}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  CustomIconButton(
                    icon: Icons.close,
                    color: Color.fromARGB(255, 241, 100, 90),
                    onPressed: () {
                      Navigator.of(context).pop(); // Ferme le modal
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            // Détails de la classe
            Text(
              'Nombre d\'élèves: ${widget.classModel.studentsNumber}',
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16.0),
            // Liste des élèves
            Expanded(
              child: FutureBuilder<List<Student>>(
                future: _studentsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Erreur : ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('Aucun élève dans cette classe.'));
                  } else {
                    final students = snapshot.data!;

                    return ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.grey.shade300,
                        thickness: 1.0,
                      ),
                      itemCount: students.length,
                      itemBuilder: (context, index) {
                        final student = students[index];
                        return Container(
                          color: Colors.grey.shade200,
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(student.firstName[0]), // Afficher la première lettre du prénom
                            ),
                            title: Text('${student.firstName} ${student.lastName}'),
                            subtitle: Text('ID: ${student.id}'),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
