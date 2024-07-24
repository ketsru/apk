class User {
  final int userId;
  final int categorie;
  final String accessToken;

  User({required this.userId, required this.categorie, required this.accessToken});

  // Méthode pour créer un objet User à partir d'une map (json)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      categorie: json['categorie'],
      accessToken: json['access_token'],
    );
  }

  // Méthode pour convertir un objet User en map (json)
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'categorie': categorie,
      'access_token': accessToken,
    };
  }
}
