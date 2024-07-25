// add_student_note.dart
import 'package:flutter/material.dart';
import 'package:apk/widgets/custom_app_bar.dart';
//import 'package:apk/widgets/class_modal.dart';
import 'package:apk/models/class.dart';
import 'package:apk/models/eleve.dart';
import 'data.dart';

void main() => runApp(const AddStudentNote());

class AddStudentNote extends StatelessWidget {
  const AddStudentNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _addClass(String className, String date) {
    setState(() {
      // On pourrait potentiellement ajouter des classes ici si nécessaire
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget addButton = FloatingActionButton(
      key: UniqueKey(),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) => Column(
            children: [
              Expanded(
                child: BottomSheetExample(
                  classes: classes,
                  students: students,
                ),
              ),
            ],
          ),
        );
      },
      child: const Icon(Icons.add),
    );

    return Scaffold(
      appBar: CustomAppBar(title: 'Note'),
      body: Column(
        children: [
          Expanded(
            child: BottomSheetExample(
              classes: classes,
              students: students,
            ),
          ),
        ],
      ),
      floatingActionButton: addButton,
    );
  }
}

class BottomSheetExample extends StatefulWidget {
  final List<ClassModel> classes;
  final List<Student> students;

  const BottomSheetExample({
    required this.classes,
    required this.students,
    Key? key,
  }) : super(key: key);

  @override
  _BottomSheetExampleState createState() => _BottomSheetExampleState();
}

class _BottomSheetExampleState extends State<BottomSheetExample> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: widget.classes.length,
              itemBuilder: (context, index) {
                final classModel = widget.classes[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 14.0),
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10.0),
                    title: Text(
                      classModel.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${classModel.students.length} élèves'),
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(
                        classModel.name[0],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    onTap: () {
                      /*showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          //return ClassModal(classModel: classModel);
                        },
                      );*/
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
