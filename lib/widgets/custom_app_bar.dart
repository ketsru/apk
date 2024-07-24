import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(90); // Hauteur de l'AppBar

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orange, // Couleur d'arrière-plan orange
      elevation: 0,
      titleSpacing: 0,
      toolbarHeight: 90, // Hauteur de l'AppBar

      // Utilise le titre comme colonne pour personnaliser le contenu
      title: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.orange[600],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: const Icon(
                    Icons.notifications_active,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
