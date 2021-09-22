import 'package:grade_calculator/models/assigment.dart';
import 'package:grade_calculator/models/course.dart';
import 'package:grade_calculator/models/section.dart';

abstract class Serializable {
  Map<String, dynamic> get json;

  String get uid;

  static Type getType<T>() => T;

  static dynamic fromJson<T>(Map<String, dynamic> json) {
    switch (getType<T>()) {
      case Assigment:
        return Assigment.fromJson(json);
      case Section:
        return Section.fromJson(json);
      case Course:
        return Course.fromJson(json);
      default:
        throw 'No Such Type ${getType<T>()}';
    }
  }
}
