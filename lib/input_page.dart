// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, invalid_required_positional_param, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_reusable.dart';
import 'constants.dart';
import "icon_title_content.dart";
import "results_page.dart";
import "calculator_brain.dart";

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

enum Geneders { Male, Female }

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveColur;
  Color femaleCardColor = inactiveColur;
  double height = 120.0;
  int weight = 60;
  int age = 18;

  void updateColor(Geneders geneder) {
    if (geneder == Geneders.Male) {
      if (maleCardColor == inactiveColur) {
        maleCardColor = activeColour;
        femaleCardColor = inactiveColur;
      }
    }
    if (geneder == Geneders.Female) {
      if (femaleCardColor == inactiveColur) {
        femaleCardColor = activeColour;
        maleCardColor = inactiveColur;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("BMI CALCULATOR"),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateColor(Geneders.Male);
                    });
                  },
                  child: boxLmfao(
                    maleCardColor,
                    cardChild("MALE", FontAwesomeIcons.mars),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateColor(Geneders.Female);
                    });
                  },
                  child: boxLmfao(
                    femaleCardColor,
                    cardChild("FEMALE", FontAwesomeIcons.venus),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: boxLmfao(
              activeColour,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Enter height:",
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      Text(
                        "cm",
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x29EB1555),
                        thumbColor: Color(0XFFEB1555),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30,
                        )),
                    child: Slider(
                      value: height,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (value) {
                        setState(() {
                          height = value.roundToDouble();
                        });
                      },
                      min: 110,
                      max: 250,
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Expanded(
                child: boxLmfao(
                  activeColour,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: labelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            weight.toString(),
                            style: kNumberStyle,
                          ),
                          Text(
                            "kg",
                            style: labelTextStyle,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(FontAwesomeIcons.minus, () {
                            {
                              setState(() {
                                weight--;
                              });
                            }
                            ;
                          }),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(FontAwesomeIcons.plus, () {
                            {
                              setState(() {
                                weight++;
                              });
                            }
                            ;
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: boxLmfao(
                  activeColour,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Age",
                        style: labelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(FontAwesomeIcons.minus, () {
                            {
                              setState(() {
                                age--;
                              });
                            }
                            ;
                          }),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(FontAwesomeIcons.plus, () {
                            {
                              setState(() {
                                age++;
                              });
                            }
                            ;
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ReUsableButton(() {
            calculator_brain brain = calculator_brain(height, weight, age);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ResultsPage(brain);
                },
              ),
            );
          }, "Calculate"),
        ],
      ),
    );
  }
}

class ReUsableButton extends StatelessWidget {
  ReUsableButton(@required this.onTap, @required this.buttonTitle);
  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeBottomText,
          ),
        ),
        color: bottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton(@required this.icon, @required this.onPressed);
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: () => onPressed(),
      elevation: 6,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
