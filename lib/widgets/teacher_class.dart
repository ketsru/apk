import 'package:flutter/material.dart';

class TeacherClass extends StatelessWidget {
  final String className;
  final String? subtitle; // Correction de 'substitle' en 'subtitle'
  final String route;
  final Map<String, dynamic> arguments;
  final Color? iconColor;
  final Color containerColor;
  final Color? subtitleColor;

  final IconData? icon;
  final EdgeInsetsGeometry iconPadding;
  final IconData trailingIcon;

  const TeacherClass({
    Key? key,
    required this.className,
    this.subtitle,
    required this.route,
    required this.arguments,
    this.iconColor,
    this.subtitleColor,
    this.containerColor = const Color(0xFFBDBDBD),
    this.icon,
    this.iconPadding = const EdgeInsets.all(16),
    this.trailingIcon = Icons.chevron_right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          route,
          arguments: arguments,
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (icon != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: iconPadding,
                        color: iconColor ?? Colors.orange,
                        child: Icon(
                          icon,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  if (icon != null) const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        className,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      if (subtitle != null && subtitle!.isNotEmpty) ...[
                        const SizedBox(height: 5),
                        Text(
                          subtitle!,
                          style: TextStyle(
                            fontSize: 14,
                            color: subtitleColor,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
              Icon(trailingIcon),
            ],
          ),
        ),
      ),
    );
  }
}
