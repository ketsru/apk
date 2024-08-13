import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

class CustomDropdownExample extends StatefulWidget {
  final ValueChanged<String> onClassSelected;
  final ValueChanged<String> onMatterSelected;

  const CustomDropdownExample({
    Key? key,
    required this.onClassSelected,
    required this.onMatterSelected,
  }) : super(key: key);

  @override
  State<CustomDropdownExample> createState() => _CustomDropdownExampleState();
}

class _CustomDropdownExampleState extends State<CustomDropdownExample> {
  final classController = TextEditingController();
  final matterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropdown(
          hintStyle: const TextStyle(color: Color(0xFF666666)),
          borderSide: const BorderSide(color: Color(0xFF666666)),
          hintText: 'Sélectionnez la classe',
          items: const ['Class 1', 'Class 2', 'Class 3'],
          controller: classController,
          onChanged: (value) {
            if (value != null) {
              widget.onClassSelected(value);
            }
          },
        ),
        const SizedBox(height: 22.0),
        CustomDropdown(
          hintStyle: const TextStyle(color: Color(0xFF666666)),
          borderSide: const BorderSide(color: Color(0xFF666666)),
          hintText: 'Sélectionnez la matière',
          items: const ['Math', 'Science', 'History'],
          controller: matterController,
          onChanged: (value) {
            if (value != null) {
              widget.onMatterSelected(value);
            }
          },
        ),
      ],
    );
  }
}
