import 'package:flutter/material.dart';
import 'package:apk/models/class.dart';
import 'package:apk/widgets/custom_icon_button.dart';

class ClassModal extends StatefulWidget {
  final ClassModel classModel;

  ClassModal({required this.classModel});

  @override
  _ClassModalState createState() => _ClassModalState();
}

class _ClassModalState extends State<ClassModal> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // En-tête du modal
            Container(
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: const Color.fromARGB(255, 37, 36, 36), width: 1.0)),
              ),
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Classe: ${widget.classModel.name}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  CustomIconButton(
                    icon: Icons.close,
                    color: const Color.fromARGB(255, 253, 19, 2),
                    onPressed: () {
                      Navigator.of(context).pop(); // Ferme le modal
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            // Détails de la classe

            Text(
              'Nombre d\'élèves: ${widget.classModel.studentCount}',
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16.0),
            // Liste des élèves
            Expanded(
              child: widget.classModel.students.isEmpty
                  ? const Center(child: Text('Aucun élève dans cette classe.'))
                  : ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.grey.shade300, // Couleur de la bordure inférieure
                        thickness: 1.0, // Épaisseur de la bordure inférieure
                      ),
                      itemCount: widget.classModel.students.length,
                      itemBuilder: (context, index) {
                        final student = widget.classModel.students[index];
                        return Container(
                          color: Colors.grey.shade200, // Couleur de fond des noms
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(student.name[0]), // Afficher la première lettre du nom
                            ),
                            title: Text(student.name),
                            subtitle: Text('ID: ${student.studentId}'),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
