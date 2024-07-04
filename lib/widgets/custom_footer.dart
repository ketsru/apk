import 'package:flutter/material.dart';
import 'package:apk/screens/admin/add_page.dart'; // Assure-toi que le chemin d'importation est correct

class CustomFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF1F7F7), // Couleur de fond du footer
      padding: EdgeInsets.symmetric(horizontal: 64.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Centrer le contenu dans le Row
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0), // Border radius à 50%
              color: Colors.blue, // Background blue
            ),
            child: IconButton(
              icon: Icon(Icons.add), // Icône "Add"
              color: Color(0xFF000408), // Couleur de l'icône
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPage()), // Utilisation de AddPage comme widget
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
