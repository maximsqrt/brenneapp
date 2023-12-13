// ignore_for_file: prefer_const_constructors

import 'package:brenneapp/worker_card.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'names.dart'; // Import the NameList widget
import 'workersheet.dart'; // Import the Worksheet widget

class TimesScreen extends StatelessWidget {
  final List<String> names; // Declare the names list as a parameter

  const TimesScreen({super.key, required this.names}); // Constructor to receive the names list

  void _navigateToWorkersheetScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Worksheet(tappedDays: const []), // Pass the tappedDays list
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Times Screen'),
        backgroundColor: Colors.purple, // Set the background color of the AppBar
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Handle settings button tap
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Text(
            'Setze Arbeitszeiten',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Names:',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                  child: ElevatedButton(
                    onPressed: () {
                      _navigateToWorkersheetScreen(context);
                    },
                    child: Text('Go to Worksheet'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
