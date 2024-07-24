// teacher_page.dart
import 'package:flutter/material.dart';
import 'package:apk/widgets/custom_app_bar.dart';
import 'package:apk/widgets/custom_lesson_button.dart';
import 'package:apk/widgets/class_modal.dart';
//import 'package:apk/models/class.dart';
//import 'package:apk/models/eleve.dart';
import 'package:apk/screens/teacher/overview_student_attendance.dart';
import 'data.dart'; // Importer le fichier de données

class TeacherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'School.',),
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
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: CustomLessonButton(
                              backgroundColor: Colors.blue[300]!,
                              icon: Icons.book,
                              label: 'Cours',
                              onPressed: () {
                                Navigator.pushNamed(context, '/cours');
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          SizedBox(
                            width: 120, // Largeur fixe pour chaque bouton
                            child: CustomLessonButton(
                              backgroundColor: Colors.grey.shade100,
                              icon: Icons.assignment,
                              label: 'Exercice',
                              onPressed: () {
                                Navigator.pushNamed(context, '/exercice');
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          SizedBox(
                            width: 120, // Largeur fixe pour chaque bouton
                            child: CustomLessonButton(
                              backgroundColor: Colors.green[300]!,
                              icon: Icons.grade,
                              label: 'Note',
                              onPressed: () {
                                Navigator.pushNamed(context, '/note');
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          SizedBox(
                            width: 120, // Largeur fixe pour chaque bouton
                            child: CustomLessonButton(
                              backgroundColor: Colors.orange[300]!,
                              icon: Icons.update,
                              label: 'Présence',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StudentAttendance(
                                      classData: classes.map((classModel) => {
                                        'level': classModel.name,
                                        'studentCount': classModel.students.length,
                                        'students': classModel.students.map((student) => {
                                          'studentId': student.studentId,
                                          'name': student.name,
                                        }).toList(),
                                      }).toList(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: classes.length,
                        itemBuilder: (context, index) {
                          final classModel = classes[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 14.0),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(10.0),
                              title: Text(
                                classModel.name,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('${classModel.students.length} élèves'),
                              leading: CircleAvatar(
                                backgroundColor: Colors.blue,
                                child: Text(
                                  classModel.name[0],
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
