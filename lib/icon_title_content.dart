import 'package:flutter/material.dart';
import 'constants.dart';

class cardChild extends StatelessWidget {
  IconData iconUsed;
  String titleForIcon;
  cardChild(@required this.titleForIcon, @required this.iconUsed);

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconUsed,
          size: 70,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          titleForIcon,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
