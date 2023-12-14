import 'package:brenneapp/worker_card.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:brenneapp/names.dart'; // Import the NameList widget
import 'package:brenneapp/workersheet.dart'; // Import the Worksheet widget
// ignore: unused_import
import 'package:brenneapp/days_list.dart';

class TimesScreen extends StatelessWidget {
  final List<String> names;
final DaysList daysList = DaysList();
  TimesScreen({Key? key, required this.names}) : super(key: key);

  void _navigateToWorkersheetScreen(BuildContext context, DaysList daysList) {
    List<String> selectedDays = daysList.getSelectedDays();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Worksheet(tappedDays: selectedDays),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Times Screen'),
        backgroundColor:
            Colors.purple, // Set the background color of the AppBar
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Handle settings button tap
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Text(
            'Setze Arbeitszeiten',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Names:',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: names.length,
              itemBuilder: (BuildContext context, int index) {
                return WorkerCard(
                  name: names[index],
                  onDaysChanged: (days) {
                    // Handle days changed if needed (or provide a dummy implementation)
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.only(top: 12.0),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _navigateToWorkersheetScreen(context, daysList);
              },
              child: const Text('Go to Worksheet'),
            ),
          ),
        ],
      ),
    );
  }
}
