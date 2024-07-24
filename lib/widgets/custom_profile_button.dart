import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData leadingIcon;
  final IconData trailingIcon;

  ProfileButton({
    required this.title,
    required this.onPressed,
    required this.leadingIcon,
    required this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
      width: double.infinity,
      height: 60.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3D1B02), // Couleur café
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              leadingIcon,
              color: Colors.white,
            ),
            const SizedBox(width: 10), // Espacement entre l'icône et le texte
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.start, // Alignement du texte à gauche
              ),
            ),
          ],
        ),
      ),
    );
  }
}
