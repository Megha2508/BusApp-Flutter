import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.colour, this.cardChild, this.onPress});

  final Widget cardChild;
  final Function onPress;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
