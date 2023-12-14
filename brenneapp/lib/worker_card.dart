import 'package:flutter/material.dart';

class WorkerCard extends StatefulWidget {
  const WorkerCard({
    Key? key,
    required this.name,
    required this.onDaysChanged,
    this.child,
  }) : super(key: key);

  final String name;
  final Widget? child;
  final Null Function(List<String> days) onDaysChanged;

  @override
  // ignore: library_private_types_in_public_api
  _WorkerCardState createState() => _WorkerCardState();
}

class _WorkerCardState extends State<WorkerCard> {
  Set<String> checkedDays = <String>{};

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

 Widget _buildDayContainer(String text, bool isChecked) {
  return GestureDetector(
    onTap: () {
      setState(() {
        if (isChecked) {
          checkedDays.remove(text);
        } else {
          checkedDays.add(text);
        }
        widget.onDaysChanged(checkedDays.toList()); // Pass the list of selected days
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
