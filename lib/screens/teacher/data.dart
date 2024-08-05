// data.dart qui n'est plus utilisé
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
    Student(studentId: '8', name: 'Fanny DOLI', className: 'Terminal D'),
    Student(studentId: '9', name: 'George BEY', className: 'Terminal D'),
    Student(studentId: '10', name: 'Helen KODJO', className: 'Terminal D'),
    Student(studentId: '11', name: 'Isaac LAWSON', className: 'Terminal D'),
    Student(studentId: '12', name: 'Joyce AGBLE', className: 'Terminal D'),
    Student(studentId: '13', name: 'Kevin KOUMI', className: 'Terminal D'),
    Student(studentId: '14', name: 'Linda AKOLO', className: 'Terminal D'),
    Student(studentId: '15', name: 'Michel ABITO', className: 'Terminal D'),
    Student(studentId: '16', name: 'Nadia KOUTI', className: 'Terminal D'),
    Student(studentId: '17', name: 'Oscar MIAKPO', className: 'Terminal D'),
    Student(studentId: '18', name: 'Pauline AGBO', className: 'Terminal D'),
    Student(studentId: '19', name: 'Quentin VODO', className: 'Terminal D'),
    Student(studentId: '20', name: 'Rebecca YOVO', className: 'Terminal D'),
  ]),

  ClassModel(name: "Terminal A4", students: [
    Student(studentId: '1', name: 'Charlie CHAPLIN', className: 'Terminal A4'),
    Student(studentId: '2', name: 'Dorothée AZANDE', className: 'Terminal A4'),
    Student(studentId: '3', name: 'Evelyne AGBO', className: 'Terminal A4'),
    Student(studentId: '4', name: 'Francis BADO', className: 'Terminal A4'),
    Student(studentId: '5', name: 'Grace AKOLO', className: 'Terminal A4'),
    Student(studentId: '6', name: 'Henri ZOBO', className: 'Terminal A4'),
    Student(studentId: '7', name: 'Irene KOUTI', className: 'Terminal A4'),
    Student(studentId: '8', name: 'Jacques MIAKPO', className: 'Terminal A4'),
    Student(studentId: '9', name: 'Karen YOVO', className: 'Terminal A4'),
    Student(studentId: '10', name: 'Louis DOLI', className: 'Terminal A4'),
    Student(studentId: '11', name: 'Monica KOUMI', className: 'Terminal A4'),
    Student(studentId: '12', name: 'Nathaniel LAWSON', className: 'Terminal A4'),
    Student(studentId: '13', name: 'Olivia BEY', className: 'Terminal A4'),
    Student(studentId: '14', name: 'Patrice GAKPO', className: 'Terminal A4'),
    Student(studentId: '15', name: 'Quincy TRANS', className: 'Terminal A4'),
    Student(studentId: '16', name: 'Rebecca FIOVI', className: 'Terminal A4'),
    Student(studentId: '17', name: 'Samuel MOKPOKPO', className: 'Terminal A4'),
    Student(studentId: '18', name: 'Theresa KOUDJO', className: 'Terminal A4'),
    Student(studentId: '19', name: 'Ursula BABALIMA', className: 'Terminal A4'),
    Student(studentId: '20', name: 'Victor IRENE', className: 'Terminal A4'),
  ])
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