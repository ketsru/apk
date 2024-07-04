class User {
  final String id;
  final String username;
  final String email;
  final String role;
  final String token;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.role,
    required this.token
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      role: json['role'],
      token: json['token'],
    );
  }
}
