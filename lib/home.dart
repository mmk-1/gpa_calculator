import 'package:flutter/material.dart';

import 'widgets/output.dart';
import 'widgets/bottomBar.dart';
import 'widgets/mainList.dart';
import 'models/grade.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Grade> _grades = [];
  String outputTxt = 'Press Calculate';

  void addNewGrade(double credit, double grade) {
    final newGrade = Grade(credit, grade);
    setState(() {
      _grades.add(newGrade);
    });
  }

  void computeGPA() {
    double res = 0;
    double totalCred = 0;
    for (var i = 0; i < _grades.length; i++) {
      res += _grades[i].credit * _grades[i].grade;
      totalCred += _grades[i].credit;
    }
    // print(res);
    // print(totalCred);
    res /= totalCred;
    setState(() {
      outputTxt = res.toStringAsFixed(2);
    });
    // return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('METU GPA Calculator'),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Output
            Output(computeGPA, outputTxt),
            // "Previous" stuff
            ListView(
              shrinkWrap: true,
              children: const <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Previous CGPA'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Previous Credits'),
                  keyboardType: TextInputType.number,
                )
              ],
            ),
            // FIX SCROLLING FEATURE
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MainList(_grades),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(addNewGrade), // bottomSheet: ,
    );
  }
}
