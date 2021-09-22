import 'package:grade_calculator/models/serializable.dart';
import 'package:uuid/uuid.dart';

class Assigment implements Serializable {
  String assigmentName;
  double weight;
  double maxGrade;
  double currentGrade;
  String? letterGrade;

  @override
  late String uid;

  Assigment(
      {required this.assigmentName,
      required this.weight,
      required this.maxGrade,
      this.currentGrade = -1.0,
      this.letterGrade,
      uid}) {
    //If UID was passed a value use that value, ottherwise, create a new UID.
    this.uid = uid ?? const Uuid().v4();
    //If no value was passed for letterGrade, compute it.
    letterGrade ?? computeLetterGrade();
  }

  //Create an Assigment object from json.
  static Assigment fromJson<T>(Map<String, dynamic> json) => Assigment(
      assigmentName: json['asgment_name'],
      weight: json['asgmnt_weight'],
      maxGrade: json['asgmnt_maxGrade'],
      currentGrade: json['asgmnt_curGrade'],
      uid: json['asgmnt_uid'],
      letterGrade: json['asgmnt_lGrade']);

//Compute the Letter grade based on the current grade.
  void computeLetterGrade() {
    if (currentGrade > -1) {
      var gradeAverage = currentGrade / maxGrade;
      if (gradeAverage > 0.90) {
        letterGrade = 'A';
      } else if (gradeAverage > 0.80) {
        letterGrade = 'B';
      } else if (gradeAverage > 0.70) {
        letterGrade = 'C';
      } else if (gradeAverage > 0.60) {
        letterGrade = 'D';
      } else {
        letterGrade = 'F';
      }
    }
  }

  //Create a json object from the current object.
  @override
  Map<String, dynamic> get json => {
        'asgmnt_uid': uid,
        'asgmnt_name': assigmentName,
        'asgmnt_weight': weight,
        'asgmnt_maxGrade': maxGrade,
        'asgmnt_curGrade': currentGrade,
        'asgmnt_lGrade': letterGrade ?? ''
      };
}
