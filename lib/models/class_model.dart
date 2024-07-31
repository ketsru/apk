import 'package:hive/hive.dart';

part 'class_model.g.dart'; // Le fichier généré par build_runner

@HiveType(typeId: 0)
class ClassModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int studentsNumber;

  ClassModel({
    required this.id,
    required this.name,
    required this.studentsNumber,
  });

  factory ClassModel.fromJson(Map<String, dynamic> json) {
    return ClassModel(
      id: json['id'],
      name: json['name'],
      studentsNumber: json['students_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'students_number': studentsNumber,
    };
  }
}
