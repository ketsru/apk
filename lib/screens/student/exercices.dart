import 'package:flutter/material.dart';
import 'package:apk/widgets/custom_app_bar.dart';

class ExercicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Exercices',
      ),
      body: Center(
        child: Text('Contenu des Exercices'),
      ),
    );
  }
}
