// data.dart
import 'package:apk/models/class.dart';
import 'package:apk/models/eleve.dart';
import 'package:apk/models/subject.dart';

final List<ClassModel> classes = [
  ClassModel(name: "Terminal D", students: [
    Student(studentId: '1', name: 'Abalo KOUDJO', className: 'Terminal D'),
    Student(studentId: '2', name: 'Alice MOKPOKPO', className: 'Terminal D'),
    Student(studentId: '3', name: 'Amélie FIOVI', className: 'Terminal D'),
    Student(studentId: '4', name: 'Bob IRENE', className: 'Terminal D'),
    Student(studentId: '5', name: 'Bobrisky TRANS', className: 'Terminal D'),
    Student(studentId: '6', name: 'Difa GAKPO', className: 'Terminal D'),
    Student(studentId: '7', name: 'Eliora BABALIMA', className: 'Terminal D'),
  ]),
  ClassModel(name: "Terminal A4", students: [
    Student(studentId: '1', name: 'Charlie CHAPLIN', className: 'Terminal A4'),
  ]),
  // Ajoutez d'autres classes et élèves ici
];

final List<Student> students = [
  Student(studentId: 'S001', name: 'Alice Dupont', className: 'CP1'),
  Student(studentId: 'S002', name: 'Bob Martin', className: 'CP2'),
  Student(studentId: 'S003', name: 'Charlie Dupont', className: 'CE1'),
  Student(studentId: 'S004', name: 'Diana Johnson', className: 'CE2'),
  // Ajoutez d'autres étudiants ici
];

final List<Subject> subjects = [
  Subject(subjectId: '1', name: 'Mathématiques'),
  Subject(subjectId: '2', name: 'Français'),
  Subject(subjectId: '3', name: 'Sciences'),
  Subject(subjectId: '4', name: 'Histoire'),
  // Ajoutez d'autres matières ici
];