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
  List<String> selectedDays = []; // Declare selectedDays here

  TimesScreen({Key? key, required this.names}) : super(key: key);

  void _navigateToWorkersheetScreen(BuildContext context) {
    // Remove the declaration of selectedDays from here
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Worksheet(tappedDays: selectedDays),
      ),
    );
  }

  // The function to build the selected days widget
  Widget _buildSelectedDays() {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.grey[300],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selected Days:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            selectedDays.isEmpty
                ? 'No days selected'
                : selectedDays.join(', '), // Display the selected days
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Times Screen'),
        backgroundColor: Colors.purple,
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
                    selectedDays = days;
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
                _navigateToWorkersheetScreen(context);
              },
              child: const Text('Go to Worksheet'),
            ),
          ),
          _buildSelectedDays(),
        ],
      ),
    );
  }
}
