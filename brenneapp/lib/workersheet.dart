import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:brenneapp/times.dart';
// ignore: unused_import
import 'package:brenneapp/worker_card.dart';
// ignore: unused_import
import 'package:brenneapp/names.dart';






class Worksheet extends StatelessWidget {
  final List<String> tappedDays; // Declare the tappedDays list as a parameter

  const Worksheet({super.key, required this.tappedDays}); // Constructor to receive the tappedDays list
// Inside Worksheet


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Worksheet Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is the Workersheet Screen!'),
            const SizedBox(height: 16),
            const Text('Tapped Days:'),
            Text(tappedDays.join(', ')),
          ],
        ),
      ),
    );
  }
}
