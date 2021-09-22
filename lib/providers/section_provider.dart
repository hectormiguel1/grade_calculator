import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:grade_calculator/models/assigment.dart';
import 'package:grade_calculator/models/section.dart';

class SectionProvider with ChangeNotifier {
  late Section _section;

  SectionProvider(Section section) {
    _section = section;
  }

  String get sectionName => _section.sectionName;
  String get uid => _section.uid;
  UnmodifiableListView<Assigment> get assigments =>
      UnmodifiableListView(_section.sectionAssigments);

  void addAssigment(Assigment newAssigment) {
    _section.sectionAssigments.add(newAssigment);
    notifyListeners();
  }

  void removeAssigment(String assigmentUID) {
    _section.sectionAssigments
        .removeWhere((element) => element.uid == assigmentUID);
    notifyListeners();
  }

  void changeSectionName(String newName) {
    _section.sectionName = newName;
    notifyListeners();
  }

  void updateSectionRefernce(Section newSection) {
    _section = newSection;
    notifyListeners();
  }
}
