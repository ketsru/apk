// lib/widgets/custom_footer.dart
import 'package:flutter/material.dart';

class CustomFooter extends StatelessWidget {
  final VoidCallback onButtonPressed;
  final double buttonWidth;
  final double buttonHeight;

  CustomFooter({
    required this.onButtonPressed,
    this.buttonWidth = 60.0,
    this.buttonHeight = 60.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(),
          ),
          Container(
            width: buttonWidth,
            height: buttonHeight,
            child: FloatingActionButton(
              key: UniqueKey(),
              onPressed: onButtonPressed,
              backgroundColor: const Color(0xFF3D1B02),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
