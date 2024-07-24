// lib/screens/teacher/teacher_course_page.dart

import 'package:flutter/material.dart';
import 'package:apk/widgets/custom_app_bar.dart';
import 'package:apk/widgets/custom_footer.dart';
import 'package:apk/widgets/custom_modal_with_margin.dart';

class TeacherCoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Cours',),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                'Bienvenue sur la page des cours !',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          CustomFooter(
            onButtonPressed: () {
              CustomModalWithMargin.showAddModal(context);
            },
          ),
        ],
      ),
    );
  }
}
