import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/grades.dart';

class Output extends StatelessWidget {
  Widget build(BuildContext context) {
    final gradesData = Provider.of<Grades>(context);
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            color: Colors.amber,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('CGPA: ' + gradesData.outputCGPA),
                Text(' GPA: ' + gradesData.outputGPA),
              ],
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: Colors.green,
              child: const Text(
                'Calculate',
                textAlign: TextAlign.center,
              ),
            ),
            onTap: () => gradesData.computeGPA(),
          ),
        )
      ],
    );
  }
}
