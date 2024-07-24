// lib/widgets/custom_modal_with_margin.dart

import 'package:flutter/material.dart';
import 'package:apk/screens/teacher/add_course.dart'; // Assurez-vous que le chemin est correct

class CustomModalWithMargin {
  static void showAddModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.zero, // Supprimer les marges par défaut
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // Pas de coins arrondis
          ),
          child: Container(
            margin: EdgeInsets.only(top: 24.0), // Marge en haut
            child: AddCourse(), // Utilisez le widget AddCourse ici
          ),
        );
      },
    );
  }
}
