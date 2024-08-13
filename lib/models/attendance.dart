class Attendance {
  final int idStudent;
  final String firstName;
  final String lastName;
  final bool isPresent;
  final String idClass;
  final String idTeacher;
  final String? matter;
  final String? teacher;
  final String? uuid;

  Attendance({
    required this.idStudent,
    required this.firstName,
    required this.lastName,
    required this.isPresent,
    required this.idClass,
    required this.idTeacher,
    this.matter,
    this.teacher,
    this.uuid,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
      idStudent: int.tryParse(json['id_studente']) ?? 0,
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      isPresent: json['ispresente'] == '1',
      idClass: json['id_class'] as String? ?? '',
      idTeacher: json['id_teacher'] as String? ?? '',
      matter: json['matter'] as String?,
      teacher: json['teacher'] as String?,
      uuid: json['uuid'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final json = {
      'id_student': idStudent,
      'first_name': firstName,
      'last_name': lastName,
      'is_present': isPresent ? '1' : '0',
      'id_class': idClass,
      'id_teacher': idTeacher,
      'matter': matter,
      'teacher': teacher,
      'uuid': uuid,
    };

    return json;
  }
}
