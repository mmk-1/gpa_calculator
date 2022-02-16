import 'package:flutter/material.dart';

import '../models/grade.dart';

class Output extends StatelessWidget {
  final Function computeGPA;
  String outputTxt;
  Output(this.computeGPA, this.outputTxt);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.,
      children: [
        Expanded(
          flex: 4,
          child: Container(
            color: Colors.amber,
            padding: const EdgeInsets.all(20),
            child: Text(outputTxt),
          ),
        ),
        Expanded(
          child: Container(
            child: ElevatedButton(
              onPressed: () => computeGPA(),
              child: const Text('Calculate'),
            ),
            padding: const EdgeInsets.all(15),
            color: Colors.green,
          ),
        )
      ],
    );
  }
}
