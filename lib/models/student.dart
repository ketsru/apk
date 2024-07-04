// models/student.dart

class Student {
  final String numeroMatricule;
  final String name;
  final int age;
  final String level;
  final DateTime birthday;
  final DateTime dateArrivee;

  Student({
    required this.numeroMatricule,
    required this.name,
    required this.age,
    required this.level,
    required this.birthday,
    required this.dateArrivee,
  });

  // Convert a Student from a JSON object
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      numeroMatricule: json['numero_matricule'],
      name: json['name'],
      age: json['age'],
      level: json['level'],
      birthday: DateTime.parse(json['birthday']),
      dateArrivee: DateTime.parse(json['date_arrivee']),
    );
  }

  // Convert a Student to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'numero_matricule': numeroMatricule,
      'name': name,
      'age': age,
      'level': level,
      'birthday': birthday.toIso8601String(),
      'date_arrivee': dateArrivee.toIso8601String(),
    };
  }
}
