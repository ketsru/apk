import 'package:flutter/material.dart';

class AddClassForm extends StatefulWidget {
  final void Function(String className, String date) onAddClass;

  const AddClassForm({Key? key, required this.onAddClass}) : super(key: key);

  @override
  _AddClassFormState createState() => _AddClassFormState();
}

class _AddClassFormState extends State<AddClassForm> {
  final TextEditingController _classController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _classController,
            decoration: const InputDecoration(
              labelText: 'Nom de la classe',
            ),
          ),
          const SizedBox(height: 12.0),
          TextField(
            controller: _dateController,
            decoration: const InputDecoration(
              labelText: 'Date',
            ),
          ),
          const SizedBox(height: 12.0),
          ElevatedButton(
            onPressed: () {
              final className = _classController.text;
              final date = _dateController.text;

              if (className.isNotEmpty && date.isNotEmpty) {
                widget.onAddClass(className, date);
                Navigator.pop(context);
              }
            },
            child: const Text('Ajouter'),
          ),
        ],
      ),
    );
  }
}
