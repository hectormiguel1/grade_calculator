import 'package:grade_calculator/models/section.dart';
import 'package:grade_calculator/models/serializable.dart';
import 'package:uuid/uuid.dart';

class Course implements Serializable {
  String name;
  List<Section> sections;

  @override
  late String uid;

  Course({required this.name, this.sections = const [], String? uid}) {
    this.uid = uid ?? const Uuid().v4();
  }

  static Course fromJson(Map<String, dynamic> json) => Course(
      name: json['course_name'],
      sections: (json['course_secs'] as List<dynamic>)
          .map((element) => Section.fromJson(element))
          .toList(),
      uid: json['course_uid']);

  @override
  Map<String, dynamic> get json => {
        'course_uid': uid,
        'course_name': name,
        'course_secs': sections.map((element) => element.json).toList()
      };
}
