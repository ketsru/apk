import 'package:flutter/material.dart';
import 'package:apk/widgets/custom_info_container.dart';
import 'package:apk/widgets/custom_app_bar.dart';
import 'package:apk/widgets/custom_footer.dart'; // Importez le CustomFooter

class StudentAttendance extends StatelessWidget {
  final List<Map<String, dynamic>> classData;

  // Assurez-vous que le constructeur prend les données en paramètre
  const StudentAttendance({Key? key, required this.classData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Présence'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Liste des classes',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...classData.map((data) {
              return CustomInfoContainer(
                title: data['level'] as String, // Assurez-vous que c'est un String
                subtitle: '${data['studentCount'] as int} élèves', // Assurez-vous que c'est un int
                icon: Icons.school,
                iconColor: Colors.green,
                onTap: () {
                  _showClassDetailsModal(context, data);
                },
              );
            }).toList(),
            CustomFooter(
              onButtonPressed: () {
                // Action à effectuer lorsque le bouton est pressé
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Bouton ajouté pressé')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showClassDetailsModal(BuildContext context, Map<String, dynamic> classData) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Classe: ${classData['level'] as String}', // Assurez-vous que c'est un String
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: (classData['students'] as List).length, // Assurez-vous que c'est une List
                  itemBuilder: (context, index) {
                    final student = (classData['students'] as List)[index] as Map<String, dynamic>;
                    return ListTile(
                      title: Text(student['name'] as String),
                      subtitle: Text('ID: ${student['studentId'] as String}'),
                      leading: CircleAvatar(
                        child: Text((student['name'] as String)[0]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
