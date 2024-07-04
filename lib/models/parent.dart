// models/parent.dart

class Parent {
  final String numeroMatricule;
  final String name;
  final int studentId;

  Parent({
    required this.numeroMatricule,
    required this.name,
    required this.studentId,
  });

  // Convert a Parent from a JSON object
  factory Parent.fromJson(Map<String, dynamic> json) {
    return Parent(
      numeroMatricule: json['numero_matricule'],
      name: json['name'],
      studentId: json['student_id'],
    );
  }

  // Convert a Parent to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'numero_matricule': numeroMatricule,
      'name': name,
      'student_id': studentId,
    };
  }
}
