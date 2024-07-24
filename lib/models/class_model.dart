class ClassModel {
  final int id;
  final String name;
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
      studentsNumber: json['students_number'] ?? 0,
    );
  }
}
