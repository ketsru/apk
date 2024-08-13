import 'package:flutter/material.dart';
import 'package:apk/widgets/percentage_card.dart';
import 'package:flutter/services.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final int? id = arguments?['id'] as int?;
    final String? firstName = arguments?['firstName'] as String?;
    final String? lastName = arguments?['lastName'] as String?;
    final String? ClassName = arguments?['ClassName'] as String?;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFFC89E86),
        ),
        title: const Text(''),
      ),
      backgroundColor: const Color(0xFFEEE0D5),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage('assets/images/default_avatar.jpeg'),
                ),
                const SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${firstName?.toString() ?? 'Prénom non disponible'} ${lastName?.toString() ?? 'Nom non disponible'}',
                      style: const TextStyle(
                        fontSize: 18,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 7.0),
                    Text(
                      ClassName?.toString() ?? 'Casse non disponible',
                      style: const TextStyle(
                        fontSize: 16,
                        letterSpacing: 1.2,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Container(
              width: double.infinity,
              child: PercentageCard(
                loadingPercent: 0.25,
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                ),
                child: const Text(
                  'Voire les notes',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
