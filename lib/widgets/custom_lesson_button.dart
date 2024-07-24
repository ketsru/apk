import 'package:flutter/material.dart';

class CustomLessonButton extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  CustomLessonButton({
    required this.backgroundColor,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
        ),
        padding: const EdgeInsets.all(20),
        shadowColor: Colors.grey.shade400,
        elevation: 5,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.black,
          ),
          const SizedBox(height: 12),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0C0C13),
            ),
          ),
        ],
      ),
    );
  }
}
