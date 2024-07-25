import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:apk/widgets/custom_text_field.dart';
import 'package:apk/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login(BuildContext context) async {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    try {
      final response = await http.post(
        Uri.parse('https://schoolapp-pink-xi.vercel.app/api/api/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        if (responseData['status'] == 1) {
          final String category = responseData['categorie'];
          final String token = responseData['access_token'];

          // Stocker le token dans SharedPreferences
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('access_token', token);

          switch (category) {
            case '1':
              Navigator.pushReplacementNamed(context, '/student');
              break;
            case '2':
              Navigator.pushReplacementNamed(context, '/teacher');
              break;
            case '3':
              Navigator.pushReplacementNamed(context, '/student');
              break;
            case '4':
              Navigator.pushReplacementNamed(context, '/parent');
              break;
            default:
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Catégorie inconnue.')),
              );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erreur de connexion.')),
          );
        }
      } else if (response.statusCode == 400) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['message'] ?? 'Email ou mot de passe incorrect')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur de serveur : ${response.statusCode}')),
        );
      }
    } catch (e) {
      print('Exception: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur de serveur.')),
      );
    }
  }

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
                onPressed: () => _login(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
