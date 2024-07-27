import 'package:flutter/material.dart';
import 'package:apk/widgets/select_drop_down.dart'; // Assurez-vous que le chemin d'importation est correct

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

  List<String> classes1 = ['Terminal G3', 'Terminal G2', 'Terminal G1'];
  List<String> classes2 = ['COURS G3', 'COURS G2', 'COURS G1'];

  void switchContent(String value) {
    setState(() {
      selectedValue = value;
    });
  }

  void clearSelection() {
    setState(() {
      selectedValue = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (selectedValue.isEmpty)
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
                        //switchContent(selectedItem);
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
                        //switchContent(selectedItem);
                      },
                      classes: classes2,
                      icone: selectMatterIcone,
                      titre: selectMatter,
                    ),
                    const SizedBox(height: 14.0),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          switchContent('selectedItem');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 18),
                        ),
                        child: const Text(
                          'Continuer',
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
            if (selectedValue.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 14.0, top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choix du dormat  une PDF WORD EXELL :',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 26.0, bottom: 16.0),
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          clearSelection();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.all(10),
                        ),
                        child: const Icon(
                          Icons.chevron_left_sharp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
