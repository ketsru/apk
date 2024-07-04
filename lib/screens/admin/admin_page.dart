import 'package:flutter/material.dart';
import 'package:apk/widgets/custom_footer.dart';
import 'package:apk/widgets/custom_dashboard.dart';
import 'package:apk/widgets/custom_info_container.dart';
import 'package:apk/screens/admin/class_list_page.dart'; // Assurez-vous d'importer le bon chemin

class AdminPage extends StatelessWidget {
  final List<Map<String, dynamic>> classData = [
    {'level': 'CP1', 'studentCount': 10}, // Initialisé à 0 par défaut
    {'level': 'CP2', 'studentCount': 25},
    {'level': 'CE1', 'studentCount': 19},
    {'level': 'CE2', 'studentCount': 30},
    {'level': 'CM1', 'studentCount': 34},
    {'level': 'CM2', 'studentCount': 29},
    {'level': '6ème', 'studentCount': 43},
    {'level': '5ème', 'studentCount': 18},
    {'level': '4ème', 'studentCount': 30},
    {'level': '3ème', 'studentCount': 34},
    {'level': '2nd', 'studentCount': 86},
    {'level': '1ère', 'studentCount': 54},
    {'level': 'Trnl', 'studentCount': 81},
    // Ajoutez d'autres niveaux ici
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomDashboard(),
            CustomInfoContainer(
              title: 'Nb Elève',
              subtitle: '${getTotalStudentCount()}',
              icon: Icons.school,
              iconColor: Colors.green,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClassListPage(
                      classData: classData,
                    ),
                  ),
                );
              },
            ),
            CustomInfoContainer(
              title: 'Nb Parent',
              subtitle: '50',
              icon: Icons.people,
              iconColor: Colors.red,
            ),
            CustomInfoContainer(
              title: 'Nb Enseignant',
              subtitle: '15',
              icon: Icons.person_outline,
              iconColor: Colors.orange,
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomFooter(),
    );
  }

  // Fonction pour obtenir le nombre total d'élèves
  int getTotalStudentCount() {
    int total = 0;
    classData.forEach((data) {
      total += (data['studentCount'] as int); // Conversion explicite de 'num' à 'int'
    });
    return total;
  }
}
