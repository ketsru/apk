import 'package:flutter/material.dart';
import 'package:apk/models/student.dart';
import 'package:apk/screens/admin/student_detail_page.dart'; // Assurez-vous d'utiliser le bon chemin d'importation

class StudentListPage extends StatelessWidget {
  final String level;

  StudentListPage({Key? key, required this.level}) : super(key: key);

  final List<Student> students = [
    Student(
      numeroMatricule: '001',
      name: 'Komi Etsru',
      age: 12,
      level: 'CP1',
      birthday: DateTime(2012, 5, 12),
      dateArrivee: DateTime(2020, 9, 1),
    ),
    Student(
      numeroMatricule: '002',
      name: 'Abalo Kouma',
      age: 13,
      level: 'CP2',
      birthday: DateTime(2011, 6, 15),
      dateArrivee: DateTime(2020, 9, 1),
    ),
    Student(
      numeroMatricule: '003',
      name: 'Nouvivi Komi',
      age: 13,
      level: 'CE1',
      birthday: DateTime(2011, 6, 15),
      dateArrivee: DateTime(2020, 9, 1),
    ),
    Student(
      numeroMatricule: '004',
      name: 'Ernest John',
      age: 13,
      level: 'CE2',
      birthday: DateTime(2011, 6, 15),
      dateArrivee: DateTime(2020, 9, 1),
    ),
    Student(
      numeroMatricule: '005',
      name: 'Agbolota Afi',
      age: 13,
      level: 'CM1',
      birthday: DateTime(2011, 6, 15),
      dateArrivee: DateTime(2020, 9, 1),
    ),
    Student(
      numeroMatricule: '006',
      name: 'Bin Kouma',
      age: 13,
      level: 'CP1',
      birthday: DateTime(2011, 6, 15),
      dateArrivee: DateTime(2020, 9, 1),
    ),
    Student(
      numeroMatricule: '007',
      name: 'Antoine Kouma',
      age: 13,
      level: 'CP1',
      birthday: DateTime(2011, 6, 15),
      dateArrivee: DateTime(2020, 9, 1),
    ),
    // Ajoutez d'autres étudiants ici
  ];

  @override
  Widget build(BuildContext context) {
    // Filtrer les étudiants par niveau
    final filteredStudents = students.where((student) => student.level == level).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des étudiants de $level'),
      ),
      body: ListView.builder(
        itemCount: filteredStudents.length,
        itemBuilder: (context, index) {
          final student = filteredStudents[index];
          return ListTile(
            title: Text(student.name),
            subtitle: Text('Âge: ${student.age} ans, Matricule: ${student.numeroMatricule}'),
            leading: CircleAvatar(
              child: Text(student.name[0]), // Utilisez une icône ou une image si disponible
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentDetailPage(student: student),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
