import 'package:flutter/material.dart';
import 'package:apk/widgets/custom_app_bar.dart';

class CoursScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Cours',
      ),
      body: Center(
        child: Text('Contenu des Cours'),
      ),
    );
  }
}
