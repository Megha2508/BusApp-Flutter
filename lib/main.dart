import 'package:flutter/material.dart';
import 'package:bus_ticket_app/features/Features.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/reset': (context) => Reset(),
        '/home': (context) => Home(),
        '/bus': (context) => Bus(),
        '/seat': (context) => Seat(),
        '/ticket': (context) => Ticket(),
        '/passenger': (context) => Passenger()
      },
    );
  }
}
