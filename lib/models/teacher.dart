class Teacher {
  final int userId;
  final String firstName;
  final String lastName;
  final String city;
  final String phone;
  final String birthday;
  final String email;
  final List<int> idClasses;
  final String matter;
  final String password;

  Teacher({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.city,
    required this.phone,
    required this.birthday,
    required this.email,
    required this.idClasses,
    required this.matter,
    required this.password,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      userId: json['user_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      city: json['city'],
      phone: json['phone'],
      birthday: json['birthday'],
      email: json['email'],
      idClasses: List<int>.from(json['id_class']),
      matter: json['matter'],
      password: json['password'],
    );
  }
}
