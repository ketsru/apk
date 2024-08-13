class Student {
  final int id;
  final String firstName;
  final String lastName;
  final String? city;
  final String? phone;
  final String? profil;
  final String? schoolName;
  final int? schoolId;
  final int? responsibleId;
  bool isPresent;

  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.city,
    this.phone,
    this.profil,
    this.schoolName,
    this.schoolId,
    this.responsibleId,
    this.isPresent = false, // Valeur par défaut false
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'] as int,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      city: json['city'] as String?,
      phone: json['phone'] as String?,
      profil: json['profil'] as String?,
      schoolName: json['school_name'] as String?,
      schoolId: json['school_id'] as int?,
      responsibleId: json['responsible_id'] as int?,
      isPresent: json['is_present'] as bool? ??
          false, // Valeur par défaut false si null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'city': city,
      'phone': phone,
      'profil': profil,
      'school_name': schoolName,
      'school_id': schoolId,
      'responsible_id': responsibleId,
      'is_present': isPresent,
    };
  }
}
