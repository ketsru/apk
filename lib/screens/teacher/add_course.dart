// lib/screens/teacher/add_course.dart

import 'package:flutter/material.dart';
import 'package:apk/widgets/custom_button.dart';
import 'package:apk/widgets/custom_icon_button.dart';

class AddCourse extends StatefulWidget {
  @override
  _AddCourseState createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedClass;
  String? _selectedSubject;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Ajouter un nouveau cours',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                CustomIconButton(
                  icon: Icons.close,
                  color: const Color(0xFF7AB9F7 ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              items: <String>['Classe 1', 'Classe 2'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedClass = newValue;
                });
              },
              validator: (value) => value == null ? 'Veuillez choisir une classe' : null,
              decoration: const InputDecoration(
                labelText: 'Choisir la classe',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              items: <String>['Mathématiques', 'Français'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedSubject = newValue;
                });
              },
              validator: (value) => value == null ? 'Veuillez choisir une matière' : null,
              decoration: const InputDecoration(
                labelText: 'Choisir la matière',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            CustomButton(
              text: 'Choisir fichier du cours',
              onPressed: () {
                // Code pour choisir un fichier image, PDF ou Word
              },
            ),
            const Spacer(),
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
