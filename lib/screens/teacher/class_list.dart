import 'package:flutter/material.dart';
import 'package:apk/models/class.dart';

class ClassList extends StatelessWidget {
  final List<ClassModel> classData;
  final void Function(ClassModel classModel) onClassTap;
  final ValueChanged<bool> onCheckboxChanged;

  const ClassList({
    Key? key,
    required this.classData,
    required this.onClassTap,
    required this.onCheckboxChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Nom de la classe')),
          DataColumn(label: Text('Sélectionner')),
        ],
        rows: classData.map((classModel) {
          return DataRow(
            cells: [
              DataCell(
                Text(classModel.name),
                onTap: () {
                  onClassTap(classModel);
                },
              ),
              DataCell(
                Checkbox(
                  value: classModel.isSelected,
                  onChanged: (value) {
                    onCheckboxChanged(value ?? false);
                  },
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
