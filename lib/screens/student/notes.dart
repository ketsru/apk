import 'package:flutter/material.dart';
import 'package:apk/widgets/custom_app_bar.dart';

class NotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Notes',
      ),
      body: Center(
        child: Text('Contenu des Notes'),
      ),
    );
  }
}
