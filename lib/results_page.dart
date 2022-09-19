// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import "constants.dart";
import 'card_reusable.dart';
import 'input_page.dart';
import 'calculator_brain.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(@required this.brain);
  final calculator_brain brain;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("BMI CALCULATOR")),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  "Your Result",
                  style: kTitleText,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: boxLmfao(
                activeColour,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      brain.textForResult(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      brain.BMIResult(),
                      style: kBMIText,
                    ),
                    Text(
                      brain.getInterpetition(),
                      style: TextStyle(fontSize: 22),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            ReUsableButton(() {
              Navigator.pop(context);
            }, "RE-CALCULATE")
          ],
        ));
  }
}
