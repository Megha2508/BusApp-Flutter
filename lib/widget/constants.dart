import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const kactiveCardColor = Colors.tealAccent;
const kinactiveCardColor = Color(0xFF1DE9B6);

const kdecorationTextField = InputDecoration(
    filled: true, fillColor: Colors.white, hintText: 'Enter a value');

final auth = FirebaseAuth.instance;
