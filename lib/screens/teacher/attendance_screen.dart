import 'package:flutter/material.dart';
import 'package:apk/widgets/custom_info_container.dart';
import 'package:apk/widgets/custom_app_bar.dart';

class StudentAttendance extends StatelessWidget {
  final List<Map<String, dynamic>> classData;

  const StudentAttendance({Key? key, required this.classData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Présence.',),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: const EdgeInsets.all(16.0),
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
                title: data['level'],
                subtitle: '${data['studentCount']} élèves',
                icon: Icons.school,
                iconColor: Colors.green,
                onTap: () {
                  _showClassDetailsModal(context, data);
                },
              );
            }).toList(),
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
                'Classe: ${classData['level']}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: classData['students'].length,
                  itemBuilder: (context, index) {
                    final student = classData['students'][index];
                    return ListTile(
                      title: Text(student['name']),
                      subtitle: Text('ID: ${student['studentId']}'),
                      leading: CircleAvatar(
                        child: Text(student['name'][0]),
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
