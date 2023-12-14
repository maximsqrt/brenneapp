import 'package:flutter/material.dart';
import 'times.dart'; // Import the TimesScreen

class NameList extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
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
            decoration: const InputDecoration(
              labelText: 'Enter a name',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _addNameToList,
            child: const Text('Save Name'),
          ),
          const SizedBox(height: 16),
          const Text('Names:'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: names.map((name) => Text(name)).toList(),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _navigateToTimesScreen,
            child: const Text('Go to Times Screen'),
          ),
        ],
      ),
    );
  }
}
