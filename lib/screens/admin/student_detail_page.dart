import 'package:flutter/material.dart';
import 'package:apk/models/student.dart';
import 'package:apk/widgets/two_display_button.dart';

class StudentDetailPage extends StatelessWidget {
  final Student student;

  const StudentDetailPage({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de ${student.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nom: ${student.name}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Numéro Matricule: ${student.numeroMatricule}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Age: ${student.age} ans',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Niveau: ${student.level}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Date de naissance: ${student.birthday.toLocal().toString().split(' ')[0]}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Date d\'arrivée: ${student.dateArrivee.toLocal().toString().split(' ')[0]}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            // Boutons Update et Delete
            TwoDisplayButton(
              textButton1: 'Update',
              textButton2: 'Delete',
              colorButton1: Color(0xFF030BF9),
              colorButton2: Color(0xFFFC081A),
              textColorButton1: Colors.white,
              textColorButton2: Colors.white,
              onPressedButton1: () {
                // Action pour Update
                // À implémenter selon vos besoins
              },
              onPressedButton2: () {
                // Action pour Delete
                // À implémenter selon vos besoins
              },
              width: double.infinity,
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
