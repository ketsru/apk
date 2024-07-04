import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    _navigateToNextPage();
  }

  void _navigateToNextPage() async {
    await Future.delayed(Duration(seconds: 5));

    // Vérifie l'état de la connexion et le type d'utilisateur
    var userType = await _checkUserLoggedIn();

    if (userType == 'Admin') {
      Navigator.pushReplacementNamed(context, '/admin');
    } else if (userType == 'Teacher') {
      Navigator.pushReplacementNamed(context, '/teacher');
    } else if (userType == 'Student') {
      Navigator.pushReplacementNamed(context, '/student');
    } else if (userType == 'Parent') {
      Navigator.pushReplacementNamed(context, '/parent');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  Future<String?> _checkUserLoggedIn() async {
    // Logique pour vérifier si l'utilisateur est connecté
    // et retourner le type d'utilisateur (Admin, Teacher, Student, Parent)
    // Remplace ceci par ta propre logique de vérification
    // Par exemple, tu peux utiliser un service d'authentification

    // Exemple de code (à remplacer par ta logique)
    bool isLoggedIn = false; // Remplace par ta vérification de connexion
    String userType = ''; // Remplace par le type d'utilisateur récupéré

    if (isLoggedIn) {
      // Remplace cette partie par ta logique pour obtenir le type d'utilisateur
      // Exemple :
      // userType = await AuthService.getUserType();
      userType = 'Admin'; // Exemple: remplace par le type réel de l'utilisateur
    }

    return isLoggedIn ? userType : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                ),
              ),
            ),
            // Le bouton "Connexion" a été supprimé
          ],
        ),
      ),
    );
  }
}
