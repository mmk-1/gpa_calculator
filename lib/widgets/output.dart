import 'package:flutter/material.dart';

import '../models/grade.dart';

class Output extends StatelessWidget {
  final Function computeGPA;
  String outputTxt;
  Output(this.computeGPA, this.outputTxt);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            color: Colors.amber,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Text(outputTxt),
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
            onTap: () => computeGPA(),
          ),
        )
      ],
    );
  }
}
