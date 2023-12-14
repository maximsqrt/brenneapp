// days_list.dart
import 'package:brenneapp/times.dart'; 
import 'package:flutter/material.dart';
import 'package:brenneapp/worker_card.dart'; 


import 'package:flutter/material.dart';

class DaysList extends ChangeNotifier {
  // Ein Map, um ausgewählte Tage für verschiedene WorkerCards zu verwalten
  Map<String, List<String>> _selectedDaysMap = {};

  // Methode zum Abrufen der aktuellen ausgewählten Tage für eine bestimmte WorkerCard
  List<String> getSelectedDays(String workerCardName) {
    if (_selectedDaysMap.containsKey(workerCardName)) {
      return _selectedDaysMap[workerCardName]!;
    } else {
      return [];
    }
  }

  // Methode zum Hinzufügen/Entfernen von Tagen für eine bestimmte WorkerCard
  void toggleDay(String workerCardName, String day) {
    if (!_selectedDaysMap.containsKey(workerCardName)) {
      _selectedDaysMap[workerCardName] = [];
    }

    if (_selectedDaysMap[workerCardName]!.contains(day)) {
      _selectedDaysMap[workerCardName]!.remove(day);
    } else {
      _selectedDaysMap[workerCardName]!.add(day);
    }

    // Benachrichtige alle Zuhörer, dass sich der Zustand geändert hat
    notifyListeners();
  }
}
