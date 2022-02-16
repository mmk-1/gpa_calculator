import 'package:flutter/material.dart';

import '../models/grade.dart';

class Grades extends ChangeNotifier {
  final List<Grade> _gradesList = [Grade(4, 'AA')];
}
