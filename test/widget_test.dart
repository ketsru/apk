import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:apk/main.dart';
import 'package:apk/repositories/user_repository.dart';
import 'package:apk/services/api_service.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Création des dépendances nécessaires pour MyApp
    final ApiService apiService = ApiService(baseUrl: 'https://documenter.getpostman.com/view/32611385/2sA3dvjXoo');
    final UserRepository userRepository = UserRepository(apiService: apiService);

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(userRepository: userRepository)); // Pas de 'const' ici

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
