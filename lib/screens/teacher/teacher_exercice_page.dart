// lib/screens/teacher/teacher_exercice_page.dart

import 'package:flutter/material.dart';
import 'package:apk/widgets/custom_app_bar.dart';
import 'package:apk/widgets/custom_footer.dart';
import 'package:apk/widgets/custom_modal_with_margin.dart'; // Assurez-vous que le chemin est correct

class TeacherExercicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Exercice.',), // Utiliser le CustomAppBar ici
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Bienvenue sur la page des exercices !',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          CustomFooter(
            onButtonPressed: () {
              // Appeler le modal ici
              CustomModalWithMargin.showAddModal(context);
            },
          ), // Ajouter le footer ici avec une action personnalisée
        ],
      ),
    );
  }
}
