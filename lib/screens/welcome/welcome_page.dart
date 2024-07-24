import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apk/blocs/authentication_bloc.dart';
// import 'package:apk/models/user.dart';

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
    await Future.delayed(const Duration(seconds: 5));

    // Vérifie l'état du Bloc d'authentification
    final AuthenticationBloc authBloc = BlocProvider.of<AuthenticationBloc>(context);
    final state = authBloc.state;

    if (state is AuthenticationAuthenticated) {
      final user = state.user;
      final categorie = user.categorie;

      // Redirection en fonction de la catégorie
      switch (categorie) {
        case 2: // Teacher
          Navigator.pushReplacementNamed(context, '/teacher');
          break;
        case 3: // Student
          Navigator.pushReplacementNamed(context, '/student');
          break;
        case 4: // Parent
          Navigator.pushReplacementNamed(context, '/parent');
          break;
        default:
          Navigator.pushReplacementNamed(context, '/login');
          break;
      }
    } else {
      // Redirection vers la page de login si non authentifié
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF3EE), // Définir la couleur d'arrière-plan
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
          ],
        ),
      ),
    );
  }
}
