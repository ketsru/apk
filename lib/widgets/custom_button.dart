import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final double width;
  final double? tabletWidth;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    this.color = const Color(0xFF0C0C13),
    this.textColor = const Color(0xFFEFF3EE),
    this.width = double.infinity, // mobile
    this.tabletWidth, // tablette
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600; // Détection de la tablette

    return SizedBox(
      width: isTablet ? tabletWidth ?? width : width, // Utilisation de tabletWidth si défini pour tablette
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return color.withOpacity(0.8); // Opacité réduite lorsqu'il est pressé
            }
            return color;
          }),
          foregroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            return textColor;
          }),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // Pas de border-radius
              // Aucun effet de shadow
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero), // Padding interne du bouton
        ),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 14.0), // Padding interne pour le texte
          child: Text(
            text,
            style: const TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
