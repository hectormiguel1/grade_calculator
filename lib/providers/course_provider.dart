import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:grade_calculator/models/course.dart';
import 'package:grade_calculator/models/section.dart';

class CourseProvider with ChangeNotifier {
  late Course _course;

  CourseProvider(Course course) {
    _course = course;
  }

  UnmodifiableListView<Section> get sections =>
      UnmodifiableListView(_course.sections);

  String get courseName => _course.name;

  String get uid => _course.uid;

  Map<String, dynamic> get json => _course.json;

  void addSection(Section newSection) {
    _course.sections.add(newSection);
    notifyListeners();
  }

  void removeSection(String sectionUID) {
    _course.sections.removeWhere((element) => element.uid == sectionUID);
    notifyListeners();
  }

  void updateCourseName(String newName) {
    _course.name = newName;
    notifyListeners();
  }

  void updateCourseReference(Course newCourse) {
    _course = newCourse;
    notifyListeners();
  }
}
