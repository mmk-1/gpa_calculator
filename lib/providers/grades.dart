import 'package:flutter/material.dart';

import '../models/grade.dart';

class Grades with ChangeNotifier {
  final List<Grade> _gradesList = [Grade(4, 'AA', '')];
  String outputGPA = '0.0';
  String outputCGPA = '0.0';
  final prevCGPAController = TextEditingController();
  final prevCreditController = TextEditingController();

  List<Grade> get getGradesList {
    return _gradesList;
  }

  void addNewGrade(double credit, String grade, String oldGrade) {
    final newGrade = Grade(credit, grade, oldGrade);
    _gradesList.add(newGrade);
    notifyListeners();
  }

  void computeGPA() {
    double totalGrade = 0;
    double totalCred = 0;
    for (var i = 0; i < _gradesList.length; i++) {
      double convertedGrade = _getGrade(_gradesList[i].letterGrade);

      totalGrade += _gradesList[i].credit * convertedGrade;
      totalCred += _gradesList[i].credit;
    }
    // if prev is both not empty
    final gpa = totalGrade / totalCred;
    outputCGPA = gpa.toStringAsFixed(2);
    if (prevCGPAController.text.isNotEmpty &&
        prevCreditController.text.isNotEmpty) {
      double prevCGPA = double.parse(prevCGPAController.text);
      double prevCredit = double.parse(prevCreditController.text);
      double prevtotalGrade = (prevCredit * prevCGPA).floorToDouble();
      double cgpa = (prevtotalGrade + totalGrade) / (prevCredit + totalCred);
      outputCGPA = cgpa.toStringAsFixed(2);
    }
    outputGPA = gpa.toStringAsFixed(2);
    notifyListeners();
  }

  double _getGrade(String letterGrade) {
    double convertedGrade = 0;
    switch (letterGrade) {
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
    return convertedGrade;
  }

  void removeGrade(double credit, String grade, String oldGrade) {
    // print(_gradesList);
    // _gradesList.remove(Grade(credit, grade, oldGrade));
    _gradesList.removeWhere((el) =>
        el.credit == credit &&
        el.letterGrade == grade &&
        el.oldGrade == oldGrade);
    notifyListeners();
  }
}
