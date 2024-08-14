import 'package:flutter/material.dart';

class TeacherClass extends StatelessWidget {
  final String className;
  final String? subtitle;
  final String route;
  final Map<String, dynamic> arguments;
  final Color? iconColor;
  final Color containerColor;
  final Color? classNameColor;
  final Color? subtitleColor;
  final String? imageUrl;
  final EdgeInsetsGeometry iconPadding;
  final IconData trailingIcon;
  final List<BoxShadow>? boxShadow;

  const TeacherClass({
    Key? key,
    required this.className,
    this.subtitle,
    required this.route,
    required this.arguments,
    this.iconColor,
    this.classNameColor,
    this.subtitleColor,
    this.containerColor = const Color(0xFFBDBDBD),
    this.imageUrl,
    this.iconPadding = const EdgeInsets.all(16),
    this.trailingIcon = Icons.chevron_right,
    this.boxShadow,
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
            boxShadow: boxShadow,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (imageUrl != null)
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: iconColor ?? Colors.orange,
                      backgroundImage: AssetImage(imageUrl!),
                    ),
                  if (imageUrl != null) const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        className,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: classNameColor,
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
