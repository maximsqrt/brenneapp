import 'package:flutter/material.dart';
import 'names.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Brenne App'),
        ),
        body: NameList(),
      ),
    );
  }
}
