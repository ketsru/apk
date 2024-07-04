import 'package:flutter/material.dart';
import 'package:apk/screens/admin/student_list_page.dart'; // Importez la page StudentListPage

class CustomClassButton extends StatelessWidget {
  final String level;
  final int studentCount;

  const CustomClassButton({
    Key? key,
    required this.level,
    required this.studentCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StudentListPage(level: level),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(8.0), // Margin autour du container
        padding: EdgeInsets.all(8.0), // Padding à l'intérieur du container
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/images/icone_classe.png',
              width: 32,
              height: 64,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    level,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Elèves = $studentCount',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward,
              size: 32,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}

class ClassButtonsPage extends StatelessWidget {
  final List<Map<String, dynamic>> classData = [
    {'level': 'CP1', 'studentCount': 100},
    {'level': 'CP2', 'studentCount': 120},
    {'level': 'CE1', 'studentCount': 110},
    {'level': 'CE2', 'studentCount': 115},
    {'level': 'CM1', 'studentCount': 105},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Classes'),
      ),
      body: ListView.builder(
        itemCount: classData.length,
        itemBuilder: (context, index) {
          final data = classData[index];
          return CustomClassButton(
            level: data['level'],
            studentCount: data['studentCount'],
          );
        },
      ),
    );
  }
}

class StudentListPage extends StatelessWidget {
  final String level;

  const StudentListPage({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Logique pour filtrer les étudiants par niveau si nécessaire
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des étudiants de $level'),
      ),
      body: Center(
        child: Text('Liste des étudiants de $level'),
      ),
    );
  }
}

// Utilisation :
// Navigator.push(context, MaterialPageRoute(builder: (context) => ClassButtonsPage()));
