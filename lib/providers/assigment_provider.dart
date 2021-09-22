import 'package:flutter/foundation.dart';
import 'package:grade_calculator/models/assigment.dart';

class AssigmentProvider with ChangeNotifier {
  late Assigment _assigment;

  AssigmentProvider(Assigment assigment) {
    _assigment = assigment;
  }

  String get name => _assigment.assigmentName;
  double get weight => _assigment.weight;
  double get currentGrade => _assigment.currentGrade;
  double get maxGrade => _assigment.maxGrade;
  String get letterGrade => _assigment.letterGrade ?? '';

  set name(String newName) {
    _assigment.assigmentName = name;
    notifyListeners();
  }

  set weight(double newWeight) {
    _assigment.weight = newWeight;
    notifyListeners();
  }

  set currentGrade(double currentGrade) {
    _assigment.currentGrade = currentGrade;
    notifyListeners();
  }

  void computeLetterGrade() => _assigment.computeLetterGrade();

  void updateAssigmentReference(Assigment newAssigment) {
    _assigment = newAssigment;
    notifyListeners();
  }
}
