import 'package:flutter/material.dart';

import '../models/grade.dart';

class Grades with ChangeNotifier {
  final List<Grade> _gradesList = [Grade(4, 'AA')];
  String outputTxt = 'Press Calculate';

  List<Grade> get getGradesList {
    return _gradesList;
  }

  void addNewGrade(double credit, String grade) {
    final newGrade = Grade(credit, grade);
    _gradesList.add(newGrade);
    notifyListeners();
  }

  void computeGPA() {
    double res = 0;
    double totalCred = 0;
    for (var i = 0; i < _gradesList.length; i++) {
      double convertedGrade = 0;
      switch (_gradesList[i].letterGrade) {
        case 'AA':
          {
            convertedGrade = 4;
          }
          break;
        case 'BA':
          {
            convertedGrade = 3.5;
          }
          break;
        case 'BB':
          {
            convertedGrade = 3;
          }
          break;
        case 'CB':
          {
            convertedGrade = 2.5;
          }
          break;
        case 'CC':
          {
            convertedGrade = 2;
          }
          break;
        case 'DC':
          {
            convertedGrade = 1.5;
          }
          break;
        case 'DD':
          {
            convertedGrade = 1;
          }
          break;
      }

      res += _gradesList[i].credit * convertedGrade;
      totalCred += _gradesList[i].credit;
    }
    res /= totalCred;
    outputTxt = res.toStringAsFixed(2);
    notifyListeners();
  }
}
