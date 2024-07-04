import 'package:flutter/material.dart';

class ParentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Parent Page')),
      body: Center(
        child: Text('Welcome, Parent!'),
      ),
    );
  }
}
