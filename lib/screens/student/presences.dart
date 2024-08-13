import 'package:flutter/material.dart';
import 'package:apk/widgets/custom_app_bar.dart';

class PresencesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Présences',
      ),
      body: Center(
        child: Text('Contenu des Présences'),
      ),
    );
  }
}
