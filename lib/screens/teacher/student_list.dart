// student_list_page.dart

import 'package:flutter/material.dart';
import 'package:apk/models/eleve.dart'; // Assurez-vous d'importer le modèle Student

class StudentListPage extends StatelessWidget {
  final int parentId; // Identifiant du parent pour filtrer les élèves

  StudentListPage({Key? key, required this.parentId}) : super(key: key);

  final List<Student> students = [
    Student(
      studentId: 'S001',
      name: 'Jean Dupont',
      className: 'Terminal G3',
    ),
    Student(
      studentId: 'S002',
      name: 'Marie Curie',
      className: 'Terminal A4',
    ),
    Student(
      studentId: 'S003',
      name: 'Albert Einstein',
      className: 'Terminal G2',
    ),
    Student(
      studentId: 'S004',
      name: 'Isaac Newton',
      className: 'Terminal D',
    ),
    // Ajoutez d'autres élèves ici
  ];

  @override
  Widget build(BuildContext context) {
    // Filtrer les élèves par parentId
    final filteredStudents = students.where((student) {
      // Ajoutez ici la logique de filtrage si nécessaire
      // Par exemple, filtrer par parentId si vous avez une relation entre parent et élève
      return true; // Pour l'exemple, nous retournons tous les élèves
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des élèves'),
      ),
      body: ListView.builder(
        itemCount: filteredStudents.length,
        itemBuilder: (context, index) {
          final student = filteredStudents[index];
          return ListTile(
            title: Text(student.name),
            subtitle: Text('ID: ${student.studentId}\nClasse: ${student.className}'),
            leading: CircleAvatar(
              child: Text(student.name[0]), // Utilisez une icône ou une image si disponible
            ),
          );
        },
      ),
    );
  }
}
