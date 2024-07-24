import 'package:flutter/material.dart';
import 'package:apk/widgets/custom_text_field.dart';
import 'package:apk/widgets/custom_button.dart'; // Assure-toi d'importer le bon chemin de custom_button.dart

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('Se connecter')),
      backgroundColor: const Color(0xFFEFF3EE), // Définir la couleur d'arrière-plan
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomTextField(
                controller: _emailController,
                labelText: 'Email',
                prefixIcon: const Icon(Icons.email), // Icône email
              ),
              const SizedBox(height: 24.0), // Espace entre les champs
              CustomTextField(
                controller: _passwordController,
                labelText: 'Password',
                obscureText: true,
                prefixIcon: const Icon(Icons.lock), // Icône mot de passe
              ),
              const SizedBox(height: 24.0), // Espace entre les champs et le bouton
              CustomButton(
                text: 'Connexion',
                onPressed: () {
                  // Naviguer directement vers TeacherPage
                  Navigator.pushReplacementNamed(context, '/teacher');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
