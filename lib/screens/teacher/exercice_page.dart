import 'package:flutter/material.dart';
import 'package:apk/widgets/custom_app_bar.dart';
import 'package:apk/widgets/custom_footer.dart';
import 'package:apk/widgets/filtre_tab_bar.dart'; // Import the new widget

class TeacherExercicePage extends StatefulWidget {
  @override
  _TeacherExercicePageState createState() => _TeacherExercicePageState();
}

class _TeacherExercicePageState extends State<TeacherExercicePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2); // Nombre de tabs
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Execice',
      ),
      backgroundColor: Color(0xFFEEE0D5),
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
                Center(
                  child: Text(
                    'Liste de tous les Execice !',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Center(
                  child: Text(
                    'Filtrer les cours par Classe',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
            ),
            builder: (BuildContext context) => Container(
              height: MediaQuery.of(context).size.height * 0.55,
              color: Colors.white,
              child: const BottomSheetContent(
                title: 'Ajouter un exercice',
              ),
            ),
          );
        },
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Ajouter',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF23324F),
          padding: const EdgeInsets.symmetric(horizontal: 11.0, vertical: 8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
    );
  }
}
