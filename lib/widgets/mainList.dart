import 'package:flutter/material.dart';
import '../models/grade.dart';

class MainList extends StatelessWidget {
  List<Grade> grades = [];
  MainList(this.grades);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: grades.length,
        itemBuilder: (BuildContext ctx, itemcount) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.symmetric(vertical: 5),
            color: Colors.red,
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(grades[itemcount].credit.toString()),
                Text('Credit'),
                Text(grades[itemcount].grade.toString()),
                Text('Grade'),
                Icon(Icons.edit)
              ],
            ),
          );
        });
  }
}
