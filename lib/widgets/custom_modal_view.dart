// lib/widgets/custom_modal.dart

import 'package:flutter/material.dart';

class CustomModal {
  static void showAddModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ajouter Nouveau'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Contenu du modal ici'),
                // Ajoutez ici d'autres widgets pour le contenu du modal
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop(); // Ferme le modal
              },
            ),
            TextButton(
              child: Text('Ajouter'),
              onPressed: () {
                // Action à effectuer lors de l'ajout
                Navigator.of(context).pop(); // Ferme le modal
              },
            ),
          ],
        );
      },
    );
  }
}
