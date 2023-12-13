import 'package:flutter/material.dart';

class WorkerCard extends StatefulWidget {
  WorkerCard({
    required this.name, 
    required Null Function(dynamic days) onDaysChanged, 
    this.child});

  final String name;
  final Widget? child;

  @override
  _WorkerCardState createState() => _WorkerCardState();
}

class _WorkerCardState extends State<WorkerCard> {
  Set<String> checkedDays = Set<String>();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                _buildDayContainer("VB", isChecked("VB")),
                _buildDayContainer("1", isChecked("1")),
                _buildDayContainer("2", isChecked("2")),
                _buildDayContainer("3", isChecked("3")),
              ],
            ),
            Center(
              child: Text(
                widget.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildDayContainer("Mo", isChecked("Mo")),
                _buildDayContainer("Tue", isChecked("Tue")),
                _buildDayContainer("Wed", isChecked("Wed")),
                _buildDayContainer("Thu", isChecked("Thu")),
                _buildDayContainer("Fri", isChecked("Fri")),
                _buildDayContainer("Sa", isChecked("Sa")),
                _buildDayContainer("Su", isChecked("Su")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<String> tappedDays = [];
  Widget _buildDayContainer(String text, bool isChecked) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isChecked) {
            checkedDays.remove(text);
          } else {
            checkedDays.add(text);
          }
          tappedDays = checkedDays.toList();
        });
      },
      child: Container(
        width: 20,
        height: 20,
        color: isChecked ? Colors.green : null,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  bool isChecked(String day) {
    return checkedDays.contains(day);
  }
}
