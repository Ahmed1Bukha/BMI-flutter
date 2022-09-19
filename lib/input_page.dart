// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_reusable.dart';
import 'constants.dart';
import "icon_title_content.dart";

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

  void updateColor(Geneders geneder) {
    if (geneder == Geneders.Male) {
      if (maleCardColor == inactiveColur) {
        maleCardColor = activeColour;
        femaleCardColor = inactiveColur;
      } else if (maleCardColor == activeColour) {
        maleCardColor = inactiveColur;
      }
    }
    if (geneder == Geneders.Female) {
      if (femaleCardColor == inactiveColur) {
        femaleCardColor = activeColour;
        maleCardColor = inactiveColur;
      } else if (femaleCardColor == activeColour) {
        femaleCardColor = inactiveColur;
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
            children: [
              Expanded(
                child: boxLmfao(
                  activeColour,
                  Column(
                    children: [
                      Text(
                        "WEIGHT",
                        style: labelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberStyle,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: boxLmfao(
                  activeColour,
                  cardChild("MALE", FontAwesomeIcons.mars),
                ),
              ),
            ],
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
