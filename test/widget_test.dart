/*import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:lib/main.dart'; // Stellen Sie sicher, dass Sie den richtigen Pfad zur main.dart-Datei angeben

void main() {
  testWidgets('Check Kitchen Schedule Display', (WidgetTester tester) async {
    // Erstellen Sie die App und rendern Sie das Widget
    await tester.pumpWidget(MyApp());

    // Überprüfen Sie, ob der AppBar-Titel korrekt ist
    expect(find.text('Küchendienstplan'), findsOneWidget);

    // Überprüfen Sie, ob die Wochentage im Header korrekt sind
    for (var day in ['Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So']) {
      expect(find.text(day), findsOneWidget);
    }

    // Überprüfen Sie, ob die Schichten für die erste Woche korrekt sind
    for (var day in ['Di', 'Mi', 'Do', 'Fr', 'Sa', 'So']) {
      for (var time in ['14', '16.30', '17.30', '18']) {
        expect(find.text('$day\n$time'), findsOneWidget);
      }
    }

    // Überprüfen Sie, ob die Schichten für die zweite Woche korrekt sind
    for (var day in ['Di', 'Mi', 'Do', 'Fr', 'Sa', 'So']) {
      for (var time in ['14', '16.30', '17.30', '18']) {
        expect(find.text('$day\n$time'), findsOneWidget);
      }
    }
  });
}
*/