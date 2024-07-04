import 'package:flutter/material.dart';
import 'package:apk/models/parent.dart';

class ParentListPage extends StatelessWidget {
  final int studentId;

  ParentListPage({Key? key, required this.studentId}) : super(key: key);

  final List<Parent> parents = [
    Parent(
      numeroMatricule: 'P001',
      name: 'Kossi Etsru',
      studentId: 1,
    ),
    Parent(
      numeroMatricule: 'P002',
      name: 'Nathalie Kouma',
      studentId: 2,
    ),
    Parent(
      numeroMatricule: 'P003',
      name: 'Pauline Komi',
      studentId: 3,
    ),
    Parent(
      numeroMatricule: 'P004',
      name: 'Eya John',
      studentId: 4,
    ),
    // Ajoutez d'autres parents ici
  ];

  @override
  Widget build(BuildContext context) {
    // Filtrer les parents par studentId
    final filteredParents = parents.where((parent) => parent.studentId == studentId).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des parents d\'élève'),
      ),
      body: ListView.builder(
        itemCount: filteredParents.length,
        itemBuilder: (context, index) {
          final parent = filteredParents[index];
          return ListTile(
            title: Text(parent.name),
            subtitle: Text('Matricule: ${parent.numeroMatricule}'),
            leading: CircleAvatar(
              child: Text(parent.name[0]), // Utilisez une icône ou une image si disponible
            ),
          );
        },
      ),
    );
  }
}
