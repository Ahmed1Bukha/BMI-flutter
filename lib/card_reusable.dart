// ignore_for_file: prefer_const_constructors, invalid_required_positional_param, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class boxLmfao extends StatelessWidget {
  boxLmfao(@required this.colour, @required this.childCard);
  final Widget childCard;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childCard,
      height: 150,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
