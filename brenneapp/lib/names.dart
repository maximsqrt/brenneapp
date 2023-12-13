import 'package:flutter/material.dart';
import 'times.dart'; // Import the TimesScreen

class NameList extends StatefulWidget {
  @override
  _NameListState createState() => _NameListState();
}

class _NameListState extends State<NameList> {
  List<String> names = [];
  TextEditingController nameController = TextEditingController();

  void _addNameToList() {
    String newName = nameController.text.trim();
    if (newName.isNotEmpty) {
      setState(() {
        names.add(newName);
        nameController.clear();
      });
    }
  }

  void _navigateToTimesScreen() {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TimesScreen(names: names), // Pass the names list
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Enter a name',
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _addNameToList,
            child: Text('Save Name'),
          ),
          SizedBox(height: 16),
          Text('Names:'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: names.map((name) => Text(name)).toList(),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _navigateToTimesScreen,
            child: Text('Go to Times Screen'),
          ),
        ],
      ),
    );
  }
}
