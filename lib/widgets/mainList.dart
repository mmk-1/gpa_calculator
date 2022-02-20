import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/grade.dart';
import '../providers/grades.dart';

class MainList extends StatelessWidget {
  // List<Grade> grades = [];
  // MainList(this.grades);
  @override
  Widget build(BuildContext context) {
    final gradesData = Provider.of<Grades>(context);

    return ListView.builder(
        shrinkWrap: true,
        itemCount: gradesData.getGradesList.length,
        itemBuilder: (BuildContext ctx, itemcount) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.symmetric(vertical: 5),
            color: Colors.grey,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('Credit'),
                    Text(gradesData.getGradesList[itemcount].credit.toString())
                    // Text(grades[itemcount].credit.toString()),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('Grade'),
                    Text(gradesData.getGradesList[itemcount].letterGrade
                        .toString())
                    // Text(grades[itemcount].letterGrade.toString()),
                  ],
                ),
                const Icon(Icons.edit)
              ],
            ),
          );
        });
  }
}
