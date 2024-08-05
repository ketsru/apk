import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:apk/widgets/select_drop_down.dart';
import 'package:hive/hive.dart';
import 'package:apk/models/preferences_model.dart'; // Assurez-vous que le chemin est correct

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent({Key? key}) : super(key: key);

  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  String selectedValue = '';
  String selectClass = 'Sélectionnez la classe';
  IconData selectClassIcone = Icons.gite_rounded;
  String selectMatter = 'Sélectionnez la matière';
  IconData selectMatterIcone = Icons.book_rounded;
  String selectedFormat = '';
  String? selectedFileName;

  List<String> classes1 = ['Terminal G3', 'Terminal G2', 'Terminal G1'];
  List<String> classes2 = ['COURS G3', 'COURS G2', 'COURS G1'];

  late Box<PreferencesModel> preferencesBox;

  @override
  void initState() {
    super.initState();
    _openHiveBox();
  }

  Future<void> _openHiveBox() async {
    preferencesBox = await Hive.openBox<PreferencesModel>('preferencesBox');
    _loadPreferences();
  }

  void _loadPreferences() {
    final preferences = preferencesBox.get('preferences');
    if (preferences != null) {
      setState(() {
        selectClass = preferences.selectedClass;
        selectMatter = preferences.selectedMatter;
      });
    }
  }

  void _savePreferences() {
    final preferences = PreferencesModel(
      selectedClass: selectClass,
      selectedMatter: selectMatter,
      fileName: selectedFileName ?? '',
    );
    preferencesBox.put('preferences', preferences);
  }

  void clearSelection() {
    setState(() {
      selectedValue = '';
      selectedFormat = '';
      selectedFileName = null;
    });
  }

  Future<void> _pickFile(String format) async {
    final result = await FilePicker.platform.pickFiles(
      type: format == 'Image' ? FileType.image : FileType.custom,
      allowedExtensions: format == 'Document' ? ['docx', 'pdf', 'xlsx', 'pptx'] : null,
    );

    if (result != null) {
      final file = result.files.single;
      setState(() {
        selectedFileName = file.name;
      });
      print('File selected: ${file.path}');
    } else {
      print('No file selected');
    }
  }

  void _showSummaryDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Résumé'),
          content: Text(
            'Classe: $selectClass\n'
            'Matière: $selectMatter\n'
            'Fichier sélectionné: ${selectedFileName ?? 'Aucun fichier sélectionné'}',
            style: const TextStyle(fontSize: 16),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                _savePreferences();  // Sauvegardez les préférences lorsque l'utilisateur ferme la boîte de dialogue
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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sélectionnez une classe',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  CustomSingleSelectDropDown(
                    selectedItem: (selectedItem) {
                      setState(() {
                        selectClass = selectedItem;
                      });
                    },
                    classes: classes1,
                    icone: selectClassIcone,
                    titre: selectClass,
                  ),
                  const SizedBox(height: 16.0),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sélectionnez une matière',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  CustomSingleSelectDropDown(
                    selectedItem: (selectedItem) {
                      setState(() {
                        selectMatter = selectedItem;
                      });
                    },
                    classes: classes2,
                    icone: selectMatterIcone,
                    titre: selectMatter,
                  ),
                  const SizedBox(height: 14.0),
                  const Padding(
                    padding: EdgeInsets.only(left: 14.0, top: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sélectionner un fichier ou image :',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => _pickFile('Document'),
                          icon: const Icon(Icons.attach_file),
                          label: const Text(
                            'Fichier',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => _pickFile('Image'),
                          icon: const Icon(Icons.image),
                          label: const Text(
                            'Image',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (selectedFileName != null) ...[
                    const SizedBox(height: 16.0),
                    Text(
                      'Fichier sélectionné : $selectedFileName',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                  const SizedBox(height: 18.0),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _showSummaryDialog();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                      ),
                      child: const Text(
                        'Envoyer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
