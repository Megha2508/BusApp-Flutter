import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Reset extends StatefulWidget {
  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.teal,
          appBar: AppBar(backgroundColor: Colors.teal)),
    );
  }
}
