import 'package:flutter/material.dart';
import 'package:mytasks/providers/grades.dart';
import 'package:provider/provider.dart';

import 'widgets/output.dart';
import 'widgets/bottomBar.dart';
import 'widgets/mainList.dart';
import 'models/grade.dart';
import './providers/grades.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final gradesData = Provider.of<Grades>(context);
    // 2 Scaffolds to make the bottom bar stick on top of keyboard
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: const Text('METU GPA Calculator'),
        ),
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Output
              Output(),
              // "Previous" CGPA and Credits
              ListView(
                shrinkWrap: true,
                children: <Widget>[
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Previous CGPA',
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    keyboardType: TextInputType.number,
                    controller: gradesData.prevCGPAController,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Previous Credit',
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    keyboardType: TextInputType.number,
                    controller: gradesData.prevCreditController,
                  )
                ],
              ),
              // FIX SCROLLING FEATURE
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MainList(),
                  ],
                ),
              ),
            ],
          ),
        ),
        // resizeToAvoidBottomInset: ,
        bottomNavigationBar: BottomBar(), // bottomSheet: ,
      ),
    );
  }
}
