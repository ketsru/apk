// bottom_sheet_example.dart

import 'package:flutter/material.dart';
import 'package:apk/models/class.dart'; // Assurez-vous que le modèle est importé
import 'package:apk/models/eleve.dart'; // Importer le modèle d'élève
import 'package:apk/widgets/types.dart'; // Importer le fichier des types

class BottomSheetExample extends StatefulWidget {
  final List<ClassModel> classes;
  final List<Student> students;
  final OnCheckboxChanged onCheckboxChanged;

  const BottomSheetExample({
    required this.classes,
    required this.students,
    required this.onCheckboxChanged,
    Key? key,
  }) : super(key: key);

  @override
  _BottomSheetExampleState createState() => _BottomSheetExampleState();
}

class _BottomSheetExampleState extends State<BottomSheetExample> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(3.0),
                topRight: Radius.circular(3.0),
              ),
            ),
            padding: const EdgeInsets.only(top: 12.0),
            child: ListView.builder(
              itemCount: widget.classes.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4.0,
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(
                      widget.classes[index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    leading: Checkbox(
                      value: widget.classes[index].isSelected,
                      onChanged: (value) {
                        widget.onCheckboxChanged(index, value!);
                      },
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward,
                      color: Colors.orange,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
