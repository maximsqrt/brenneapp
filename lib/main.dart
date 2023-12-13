import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyKitchenSchedule(),
    );
  }
}
//KOMMENTAR
class MyKitchenSchedule extends StatelessWidget {
  const MyKitchenSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Küchendienstplan'),
      ),
      body: Column(
        children: [
          // Header mit Wochentagen
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var day in ['Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So'])
                Text(day),
            ],
          ),
          // Kalenderwochen
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Tage der Woche
                for (var day in ['Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So'])
                  if (day == 'Mo')
                    // Montag ist frei
                    const SizedBox(width: 50, height: 50)
                  else
                    buildScheduleColumn(day),
              ],
            ),
          ),
          // Leerer Raum für die visuelle Trennung der Wochen
          const SizedBox(height: 20),
          // Wiederholung der Struktur für die zweite Woche
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Tage der Woche
                for (var day in ['Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So'])
                  if (day == 'Mo')
                    // Montag ist frei
                    const SizedBox(width: 50, height: 50)
                  else
                    buildScheduleColumn(day),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildScheduleColumn(String day) {
    return Column(
      children: [
        // Schichten für den Tag
        for (var time in ['14', '16.30', '17.30', '18'])
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Center(
              child: Text('$day\n$time'),
            ),
          ),
      ],
    );
  }
}
