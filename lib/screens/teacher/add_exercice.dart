// lib/screens/teacher/add_exercise.dart

import 'package:flutter/material.dart';
import 'package:apk/widgets/custom_button.dart'; // Assurez-vous que le chemin est correct
import 'package:apk/widgets/custom_icon_button.dart'; // Assurez-vous que le chemin est correct

class AddExercise extends StatefulWidget {
  @override
  _AddExerciseState createState() => _AddExerciseState();
}

class _AddExerciseState extends State<AddExercise> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedClass;
  String? _selectedSubject;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ajouter un nouvel exercice',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                CustomIconButton(
                  icon: Icons.close,
                  color: Colors.red,
                  onPressed: () {
                    Navigator.of(context).pop(); // Ferme le modal
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              items: <String>['Classe 1', 'Classe 2'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 16.0),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedClass = newValue;
                });
              },
              validator: (value) => value == null ? 'Veuillez choisir une classe' : null,
              decoration: InputDecoration(
                labelText: 'Choisir la classe',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              items: <String>['Mathématiques', 'Français'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 16.0),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedSubject = newValue;
                });
              },
              validator: (value) => value == null ? 'Veuillez choisir une matière' : null,
              decoration: InputDecoration(
                labelText: 'Choisir la matière',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            CustomButton(
              text: 'Choisir fichier de l\'exercice',
              onPressed: () {
                // Code pour choisir un fichier image, PDF ou Word
              },
            ),
            Spacer(),
            CustomButton(
              text: 'Ajouter',
              color: Colors.blue,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Action à effectuer lors de l'ajout
                  print('Classe sélectionnée: $_selectedClass');
                  print('Matière sélectionnée: $_selectedSubject');
                  Navigator.of(context).pop(); // Ferme le modal
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
