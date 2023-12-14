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

  Set<String> getCheckedDays() {
  return _WorkerCardState().checkedDays;
}
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
      // Ein GestureDetector wird verwendet,
      //um auf Benutzerinteraktionen zu reagieren, insbesondere auf Taps.
      onTap: () {
        // setState wird verwendet, um Flutter darüber zu informieren,
        //dass sich der State der App ändert.
        // Dadurch wird das Widget neu gerendert und die visuelle Darstellung aktualisiert.
        setState(() {
          if (isChecked) {
            // Wenn der Tag zuvor ausgewählt war, entferne ihn aus der Liste der ausgewählten Tage.
            checkedDays.remove(text);
          } else {
            // Wenn der Tag zuvor nicht ausgewählt war, füge ihn zur Liste der ausgewählten Tage hinzu.
            checkedDays.add(text);
          }
          // Nachdem die Liste der ausgewählten Tage aktualisiert wurde,
          //rufe die Callback-Funktion auf,
          // um den übergeordneten Widgets (Parent Widget) die aktualisierte
          //Liste mit den ausgewählten Tagen mitzuteilen.
          widget.onDaysChanged(checkedDays.toList()); 
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
