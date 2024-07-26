// lib/widgets/custom_footer.dart
import 'package:flutter/material.dart';

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent({Key? key}) : super(key: key);

  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  String selectedValue = '';

  List<String> classes = ['Terminal G3', 'Terminal G3', 'Terminal G3'];

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
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (selectedValue.isEmpty)
            const Padding(
              padding: EdgeInsets.only(top: 16.0, left: 11.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Veuillez sélectionner la classe',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          if (selectedValue.isEmpty)
            ListView.builder(
              shrinkWrap: true,
              itemCount: classes.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('${classes[index]}'),
                  onTap: () {
                    switchContent(classes[index]);
                  },
                );
              },
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
                        'Veuillez sélectionner une matière :',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      ListTile(
                        title: Text('ECM'),
                      ),
                      ListTile(
                        title: Text('ECM'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 26.0, bottom: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      clearSelection();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                    child: const Icon(
                      Icons.chevron_left_sharp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
