// lib/widgets/custom_icon_button.dart

import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;
  final VoidCallback onPressed;

  const CustomIconButton({
    Key? key,
    required this.icon,
    this.color = const Color(0xFF0C0C13),
    this.size = 24.0,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return color.withOpacity(0.2); // Opacité réduite lorsqu'il est pressé
          }
          return color;
        }),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0), // Border radius
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(8.0)), // Padding interne du bouton
      ),
      child: Icon(
        icon,
        size: size,
        color: Colors.white,
      ),
    );
  }
}
