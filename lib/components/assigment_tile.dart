// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:grade_calculator/models/assigment.dart';

class AssigmentTile extends StatelessWidget {
  final Assigment assigment;

  const AssigmentTile({required this.assigment});

  @override
  Widget build(BuildContext context) => ListTile(
      title: Text(assigment.assigmentName),
      leading: const Icon(Icons.book),
      trailing: assigment.letterGrade == null
          ? Text('${assigment.currentGrade}/${assigment.maxGrade}')
          : Text(assigment.letterGrade!));
}
