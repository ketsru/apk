import 'package:flutter/material.dart';
import 'package:apk/widgets/custom_app_bar.dart';
import 'package:apk/widgets/custom_action_button.dart';

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Admin',),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CustomActionButton(
              text: 'Class',
              onPressed: () {
                // Action à effectuer lorsque le bouton est pressé
              },
              icon: Icons.add,
              width: 120.0,
              height: 90.0,
            ),
            CustomActionButton(
              text: 'Elève',
              onPressed: () {
                // Action à effectuer lorsque le bouton est pressé
              },
              icon: Icons.add,
              width: 120.0,
              height: 90.0,
            ),
            CustomActionButton(
              text: 'Prof',
              onPressed: () {
                // Action à effectuer lorsque le bouton est pressé
              },
              icon: Icons.add,
              width: 120.0,
              height: 90.0,
            ),
            CustomActionButton(
              text: 'Parent',
              onPressed: () {
                // Action à effectuer lorsque le bouton est pressé
              },
              icon: Icons.add,
              width: 120.0,
              height: 90.0,
            ),
          ],
        ),
      ),
    );
  }
}
