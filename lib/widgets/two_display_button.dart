import 'package:flutter/material.dart';

class TwoDisplayButton extends StatelessWidget {
  final String textButton1;
  final String textButton2;
  final Color colorButton1;
  final Color colorButton2;
  final Color textColorButton1;
  final Color textColorButton2;
  final VoidCallback onPressedButton1;
  final VoidCallback onPressedButton2;
  final double width;
  final double height;

  const TwoDisplayButton({
    Key? key,
    required this.textButton1,
    required this.textButton2,
    required this.colorButton1,
    required this.colorButton2,
    required this.textColorButton1,
    required this.textColorButton2,
    required this.onPressedButton1,
    required this.onPressedButton2,
    this.width = double.infinity,
    this.height = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressedButton1,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return colorButton1.withOpacity(0.8);
                }
                return colorButton1;
              }),
              foregroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                return textColorButton1;
              }),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, // Aucun border-radius
                ),
              ),
            ),
            child: Text(textButton1),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: onPressedButton2,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return colorButton2.withOpacity(0.8);
                }
                return colorButton2;
              }),
              foregroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                return textColorButton2;
              }),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, // Aucun border-radius
                ),
              ),
            ),
            child: Text(textButton2),
          ),
        ),
      ],
    );
  }
}
