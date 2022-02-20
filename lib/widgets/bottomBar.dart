import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:provider/provider.dart';

import '../providers/grades.dart';
import 'mainList.dart';
import '../models/grade.dart';

class BottomBar extends StatefulWidget {
  // final Function addGrade;
  // BottomBar(this.addGrade);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final creditController = TextEditingController();
  String dropdownVal = 'AA';
  String hintVal = 'Select Grade';
  String oldGradeVal = '';
  String oldGradeHintVal = 'Old Grade';

  void _submitData() {
    if (creditController.text.isEmpty) {
      return;
    }
    // widget.addGrade(double.parse(creditController.text), dropdownVal);
    Provider.of<Grades>(context, listen: false).addNewGrade(
        double.parse(creditController.text), dropdownVal, oldGradeVal);
  }

  @override
  void dispose() {
    creditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(93, 232, 199, 1),
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // Credit INPUT
          Flexible(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 100),
              child: TextField(
                controller: creditController,
                decoration: const InputDecoration(
                  hintText: 'Credits',
                ),
              ),
            ),
          ),
          // GRADE SELECTION
          Flexible(
            child: DropdownButton2(
                isExpanded: true,
                hint: Text(
                  hintVal,
                ),
                items: <String>['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD']
                    .map<DropdownMenuItem<String>>((String val) {
                  return DropdownMenuItem<String>(
                    value: val,
                    child: Container(
                      constraints:
                          const BoxConstraints(maxWidth: 100, minWidth: 50),
                      child: Text(
                        val,
                        textAlign: TextAlign.center,
                      ),
                      alignment: Alignment.center,
                    ),
                  );
                }).toList(),
                onChanged: (val) {
                  dropdownVal = val.toString();
                  setState(() {
                    hintVal = val.toString();
                  });
                }),
          ),
          // OLD GRADE SELECTION
          Flexible(
            child: DropdownButton2(
                isExpanded: true,
                hint: Text(oldGradeHintVal),
                items: <String>['', 'AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD']
                    .map<DropdownMenuItem<String>>((String val) {
                  return DropdownMenuItem<String>(
                    value: val,
                    child: Container(
                      constraints:
                          const BoxConstraints(maxWidth: 100, minWidth: 50),
                      child: Text(
                        val,
                        textAlign: TextAlign.center,
                      ),
                      alignment: Alignment.center,
                    ),
                  );
                }).toList(),
                onChanged: (val) {
                  oldGradeVal = val.toString();
                  setState(() {
                    oldGradeHintVal = val.toString();
                  });
                }),
          ),
          // ADD BUTTON
          Flexible(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 200),
              child: ElevatedButton.icon(
                onPressed: () {
                  _submitData();
                  creditController.clear();
                  hintVal = 'Select Grade';
                  oldGradeHintVal = 'Old Grade';
                },
                icon: const Icon(Icons.add),
                label: const Text('Add'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
