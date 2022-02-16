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
                    Text(grades[itemcount].credit.toString()),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('Grade'),
                    Text(grades[itemcount].grade.toString()),
                  ],
                ),
                const Icon(Icons.edit)
              ],
            ),
          );
        });
  }
}
