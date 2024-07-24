// class_model.dart
import 'package:apk/models/eleve.dart';

class ClassModel {
  final String name;
  bool isSelected;
  List<Student> students; // Ajouter une liste d'élèves

  ClassModel({
    required this.name,
    this.isSelected = false,
    this.students = const [], // Initialiser avec une liste vide par défaut
  });

  int get studentCount => students.length; // Méthode pour obtenir le nombre d'élèves
}
