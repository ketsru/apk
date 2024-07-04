import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:apk/blocs/authentication_bloc.dart';
//import 'package:apk/blocs/authentication_event.dart';
//import 'package:apk/repositories/user_repository.dart';
import 'package:apk/widgets/custom_button.dart';
import 'package:apk/widgets/custom_text_field.dart';
import 'package:apk/screens/admin/admin_page.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final AuthenticationBloc authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 32.0),
                child: Text(
                  'Se connecter'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              CustomTextField(
                labelText: 'Username',
                //prefixIcon: Icon(Icons.person), // Icône préfixe pour 'Username'
              ),
              SizedBox(height: 16.0),
              CustomTextField(
                labelText: 'Password',
                obscureText: true,
                //prefixIcon: Icon(Icons.lock), // Icône préfixe pour 'Password' (icône de cadenas)
              ),
              SizedBox(height: 24.0),
              CustomButton(
                text: 'Connexion',
                onPressed: () {
                  // Naviguer vers AdminPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminPage()),
                  );

                  // Exemple de logique d'authentification avec Bloc
                  // À remplacer par ton propre code d'authentification
                  // final username = 'test';
                  // final password = 'test';
                  // authenticationBloc.add(LoginEvent(username, password));
                },
                color: const Color(0xFF0C0C13),
                textColor: const Color(0xFFEFF3EE),
                width: double.infinity,
                tabletWidth: 200.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
