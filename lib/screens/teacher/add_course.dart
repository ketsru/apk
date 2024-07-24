import 'package:flutter/material.dart';
import 'package:apk/widgets/custom_button.dart';
import 'package:apk/widgets/custom_icon_button.dart';
import 'package:apk/models/class.dart'; // Importer les modèles
import 'package:apk/models/subject.dart'; // Importer les modèles
import 'package:apk/screens/teacher/data.dart'; // Importer les données

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
    return Scaffold(
      body: Container(
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
                    color: const Color(0xFF7AB9F7),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              _buildClassSelection(),
              const SizedBox(height: 16.0),
              if (_selectedClass != null) _buildSubjectSelection(),
              const SizedBox(height: 16.0),
              if (_selectedSubject != null) _buildFileSelection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClassSelection() {
    return GestureDetector(
      onTap: _showClassSelectionModal,
      child: Container(
        width: double.infinity, // Occupe toute la largeur
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: _buildChip(
          _selectedClass ?? 'Choisir la classe',
          Icons.class_,
          height: 50.0, // Hauteur personnalisée
        ),
      ),
    );
  }

  Widget _buildSubjectSelection() {
    return GestureDetector(
      onTap: _showSubjectSelectionModal,
      child: Container(
        width: double.infinity, // Occupe toute la largeur
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: _buildChip(
          _selectedSubject ?? 'Choisir la matière',
          Icons.book,
          height: 50.0, // Hauteur personnalisée
        ),
      ),
    );
  }

  Widget _buildFileSelection() {
    return GestureDetector(
      onTap: _showFileSelectionModal,
      child: Container(
        width: double.infinity, // Occupe toute la largeur
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: _buildChip(
          'Choisir fichier du cours',
          Icons.attach_file,
          height: 50.0, // Hauteur personnalisée
        ),
      ),
    );
  }

  Widget _buildChip(String label, IconData icon, {double height = 48.0}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Icon(icon, color: Colors.blue),
                const SizedBox(width: 8.0),
                Text(label, style: const TextStyle(fontSize: 16.0)),
              ],
            ),
          ),
          Icon(Icons.arrow_drop_down, color: Colors.blue),
        ],
      ),
    );
  }

  void _showClassSelectionModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: classes.map((ClassModel classModel) {
              return ListTile(
                title: Text(classModel.name),
                onTap: () {
                  setState(() {
                    _selectedClass = classModel.name;
                    _selectedSubject = null; // Réinitialiser la matière sélectionnée
                  });
                  Navigator.of(context).pop(); // Ferme le modal de sélection de classe
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void _showSubjectSelectionModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: subjects.map((Subject subject) {
              return ListTile(
                title: Text(subject.name),
                onTap: () {
                  setState(() {
                    _selectedSubject = subject.name;
                  });
                  Navigator.of(context).pop(); // Ferme le modal de sélection de matière
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void _showFileSelectionModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text('Choisir le fichier du cours', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 16.0),
              CustomButton(
                text: 'Choisir un fichier',
                onPressed: () {
                  // Code pour choisir un fichier image, PDF ou Word
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
