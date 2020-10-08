import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({this.label1, this.label2, this.label3});

  final String label1;
  final String label2;
  final String label3;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            label1,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          label2,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          label3,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
