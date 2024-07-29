import 'package:flutter/material.dart';
import 'package:apk/widgets/custom_app_bar.dart';
import 'package:apk/widgets/custom_footer.dart';
import 'package:apk/widgets/custom_modal_with_margin.dart'; // Non utilisé ici, mais peut-être utile ailleurs.
import 'package:apk/widgets/filtre_tab_bar.dart'; // Import the new widget

class AddStudentNote extends StatefulWidget {
  @override
  _AddStudentNoteState createState() => _AddStudentNoteState();
}

class _AddStudentNoteState extends State<AddStudentNote>
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
        title: 'Note',
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
                Center(
                  child: Text(
                    'Liste de tous les Notes !',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Center(
                  child: Text(
                    'Filtrer les notes par Classe',
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
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
