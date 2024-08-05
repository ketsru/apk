import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:apk/models/preferences_model.dart'; // Assurez-vous que le modèle est correctement importé
import 'package:apk/widgets/custom_app_bar.dart';
import 'package:apk/widgets/custom_footer.dart';
import 'package:apk/widgets/filtre_tab_bar.dart'; // Importer le nouveau widget
import 'package:apk/widgets/custom_modal_with_margin.dart'; // Assurez-vous que ce widget est correctement importé

class TeacherCoursePage extends StatefulWidget {
  @override
  _TeacherCoursePageState createState() => _TeacherCoursePageState();
}

class _TeacherCoursePageState extends State<TeacherCoursePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Box<PreferencesModel> _preferencesBox;
  List<PreferencesModel> _savedData = []; // Liste pour stocker les données sauvegardées

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2); // Nombre de tabs
    _openHiveBox();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _openHiveBox() async {
    _preferencesBox = await Hive.openBox<PreferencesModel>('preferencesBox');
    _loadSavedData(); // Charger les données sauvegardées
  }

  void _loadSavedData() {
    final preferencesList = _preferencesBox.values.toList();
    setState(() {
      _savedData = preferencesList;
    });
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Filtre'),
          content: Text('Contenu du filtre ici.'),
          actions: <Widget>[
            TextButton(
              child: Text('Fermer'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showSavedData() {
    final preferences = _preferencesBox.get('preferences') as PreferencesModel?;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Données Sauvegardées'),
          content: preferences != null
              ? Text(
                  'Classe: ${preferences.selectedClass}\n'
                  'Matière: ${preferences.selectedMatter}\n'
                  'Fichier: ${preferences.fileName}', // Utilisation de fileName
                  style: TextStyle(fontSize: 16),
                )
              : Text(
                  'Aucune donnée sauvegardée.',
                  style: TextStyle(fontSize: 16),
                ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Cours',
      ),
      body: Column(
        children: [
          TabBarWithFilter(
            tabController: _tabController,
            onFilterPressed: _showFilterDialog,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                // Première vue : Liste des cours
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListView.builder(
                      itemCount: _savedData.length,
                      itemBuilder: (context, index) {
                        final item = _savedData[index];
                        return ClassItem(
                          name: item.selectedClass,
                          studentsNumber: 30, // Vous pouvez mettre à jour cela en fonction des données disponibles
                        );
                      },
                    ),
                  ),
                ),
                // Deuxième vue : Filtrer par Classe
                Center(
                  child: Text(
                    'Filtrer par Classe',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        key: UniqueKey(),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) => const BottomSheetContent(),
          ).then((_) {
            // Appel de la fonction pour afficher les données après la fermeture du BottomSheet
            _showSavedData();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Widget pour afficher les éléments de la classe
class ClassItem extends StatelessWidget {
  final String name;
  final int studentsNumber;

  const ClassItem({
    required this.name,
    required this.studentsNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.orange,
                  child: const Icon(
                    Icons.school,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Nombre d\'élèves: $studentsNumber',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
