import 'package:hive/hive.dart';

part 'preferences_model.g.dart'; // Assurez-vous que le fichier généré est correctement inclus

@HiveType(typeId: 0)
class PreferencesModel extends HiveObject {
  @HiveField(0)
  final String selectedClass;

  @HiveField(1)
  final String selectedMatter;

  @HiveField(2)
  final String fileName; // Ajoutez cette ligne pour le nom du fichier

  PreferencesModel({
    required this.selectedClass,
    required this.selectedMatter,
    required this.fileName,
  });
}
