// days_list.dart
import 'package:brenneapp/times.dart'; 
import 'package:flutter/material.dart';
import 'package:brenneapp/worker_card.dart'; 


import 'package:flutter/material.dart';

class DaysList extends ChangeNotifier {
  List<String> _selectedDays = [];

  List<String> getSelectedDays() => _selectedDays;

  void toggleDay(String day) {
    if (_selectedDays.contains(day)) {
      _selectedDays.remove(day);
    } else {
      _selectedDays.add(day);
    }

    notifyListeners();
  }

  void updateDaysFromWorkerCards(List<WorkerCard> workerCards) {
    // Iteriere über alle WorkerCard-Objekte und füge die ausgewählten Tage zur Liste hinzu
    for (var workerCard in workerCards) {
      Set<String> workerCardDays = workerCard.getCheckedDays();
      _selectedDays.addAll(workerCardDays);
    }

    notifyListeners();
  }
}
