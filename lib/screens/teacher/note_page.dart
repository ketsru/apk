// lib/screens/teacher/teacher_course_page.dart

import 'package:flutter/material.dart';
import 'package:apk/widgets/custom_app_bar.dart';
import 'package:apk/widgets/custom_footer.dart';
import 'package:apk/widgets/custom_modal_with_margin.dart'; // Non utilisé ici, mais peut-être utile ailleurs.

class AddStudentNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Note',
      ),
      body: const Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Bienvenue sur la page des note !',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        key: UniqueKey(), // Ensure unique key for AnimatedSwitcher
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
