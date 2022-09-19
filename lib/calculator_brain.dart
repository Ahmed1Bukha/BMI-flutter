import 'package:flutter/cupertino.dart';
import 'dart:math';

class calculator_brain {
  calculator_brain(
      @required this.height, @required this.weight, @required this.age);
  final double height;
  final int weight;
  final int age;

  String BMIResult() {
    double _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String textForResult() {
    if (double.parse(BMIResult()) >= 25.0) {
      return "Over weight";
    } else if (double.parse(BMIResult()) > 18.5) {
      return "Normal";
    } else {
      return "UnderWeight";
    }
  }

  String getInterpetition() {
    if (double.parse(BMIResult()) >= 25.0) {
      return "You need to took after your food and try to look for more healthy choises";
    } else if (double.parse(BMIResult()) > 18.5) {
      return "Pog! keep it up";
    } else {
      return "You have a lower than normal body weight. You can eat a bit more :)";
    }
  }
}
