import 'package:flutter/material.dart';

class LevelWidget extends StatelessWidget {
  final String levelName;
  final int numClasses;
  final int numStudents;
  final int numTeachers;
  final int numParents;

  const LevelWidget({
    Key? key,
    required this.levelName,
    required this.numClasses,
    required this.numStudents,
    required this.numTeachers,
    required this.numParents,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF1F7F7), // Couleur de fond personnalisée
        borderRadius: BorderRadius.circular(10.0), // Bordure arrondie
      ),
      margin: EdgeInsets.only(bottom: 16.0), // Marge en bas entre les niveaux
      padding: EdgeInsets.all(16.0), // Espacement interne du conteneur
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            levelName,
            style: TextStyle(
              color: Color(0xFF112A46),
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          _buildInfoRow('Classes', numClasses.toString()),
          _buildInfoRow('Élèves', numStudents.toString()),
          _buildInfoRow('Enseignants', numTeachers.toString()),
          _buildInfoRow('Parents d\'élèves', numParents.toString()),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: Color(0xFF112A46)),
          ),
          Text(
            value,
            style: TextStyle(color: Color(0xFF112A46)),
          ),
        ],
      ),
    );
  }
}
