import 'package:flutter/material.dart';
import 'package:apk/widgets/custom_info_container.dart';
import 'package:apk/widgets/custom_app_bar.dart';
import 'package:apk/screens/admin/student_list_page.dart'; // Assurez-vous d'importer le bon chemin

class ClassListPage extends StatelessWidget {
  final List<Map<String, dynamic>> classData;

  const ClassListPage({Key? key, required this.classData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Liste des classes',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...classData.map((data) {
              return CustomInfoContainer(
                title: data['level'],
                subtitle: '${data['studentCount']} élèves',
                icon: Icons.school,
                iconColor: Colors.green,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentListPage(
                        level: data['level'],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
