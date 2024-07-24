// student_model.dart

import 'package:flutter/material.dart';

class StudentModel {
  final String name;
  final String className;

  StudentModel({required this.name, required this.className});
}

class StudentProvider with ChangeNotifier {
  List<StudentModel> _students = [];

  List<StudentModel> get students => _students;

  void addStudent(String name, String className) {
    _students.add(StudentModel(name: name, className: className));
    notifyListeners();
  }

  List<StudentModel> getStudentsByClass(String className) {
    return _students.where((student) => student.className == className).toList();
  }
}
