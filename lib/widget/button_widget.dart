import 'package:flutter/material.dart';
import 'package:bus_ticket_app/widget/features_widget.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({@required this.label, this.onPress});

  final String label;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 55,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.title.copyWith(
                color: Colors.white,
                fontSize: 20,
              ),
        ),
      ),
    );
  }
}

class ReusableButton extends StatelessWidget {
  ReusableButton({this.label, this.onPress});

  final String label;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      cardChild: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.0),
        child: RaisedButton(
          textColor: Colors.black,
          color: Color(0xFF1DE9B6),
          child: Padding(
            padding: EdgeInsets.all(18.0),
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          onPressed: onPress,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
