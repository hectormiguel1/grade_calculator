import 'package:grade_calculator/models/assigment.dart';
import 'package:grade_calculator/models/serializable.dart';
import 'package:uuid/uuid.dart';

class Section implements Serializable {
  @override
  late String uid;
  String sectionName;
  List<Assigment> sectionAssigments;

  Section(
      {required this.sectionName,
      this.sectionAssigments = const [],
      String? uid}) {
    this.uid = uid ?? const Uuid().v4();
  }

  static Section fromJson(Map<String, dynamic> json) => Section(
      uid: json['sec_uid'],
      sectionName: json['sec_name'],
      sectionAssigments: (json['sec_asgmnts'] as List<dynamic>)
          .map((element) => Assigment.fromJson(element))
          .toList());

  @override
  Map<String, dynamic> get json => {
        'sec_uid': uid,
        'sec_name': sectionName,
        'sec_asgmnts':
            sectionAssigments.map((element) => element.json).toList(),
      };
}
