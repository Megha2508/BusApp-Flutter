import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ticket_widget/flutter_ticket_widget.dart';
import 'package:bus_ticket_app/features/Bus.dart';
import 'package:bus_ticket_app/widget/button_widget.dart';
import 'package:bus_ticket_app/widget/constants.dart';
import 'package:random_string/random_string.dart';

import 'Home.dart';
import 'Passenger.dart';

Home home = Home();
Bus bus = Bus();

class Ticket extends StatefulWidget {
  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  String busNo = randomNumeric(4);
  String _1 = randomNumeric(4);
  String _2 = randomNumeric(4);
  String _3 = randomNumeric(4);
  String _4 = randomNumeric(4);
  int seatNo = randomBetween(1, busSeatNumber);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your Ticket'),
          centerTitle: true,
          elevation: 10.0,
          backgroundColor: Colors.teal,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () async {
                  await auth.signOut();
                  Navigator.pushNamed(context, '/');
                }),
          ],
        ),
        backgroundColor: Colors.teal,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                child: FlutterTicketWidget(
                  width: 300.0,
                  isCornerRounded: true,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                border:
                                    Border.all(width: 1.0, color: Colors.green),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Text(
                                  '$busType',
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'JOD',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 2.0),
                                  child: Icon(
                                    Icons.directions_bus,
                                    color: Colors.pink,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 2.0),
                                  child: Text(
                                    'JAI',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            'Bus Ticket',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Column(
                            children: <Widget>[
                              ticketDetailsWidget(
                                  'Passengers', '$pName', 'Date', '$pDoj'),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0, right: 20.0),
                                child: ticketDetailsWidget('Bus No.',
                                    'RJ19 $busNo', 'Amount', '$busPrice'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0, right: 40.0),
                                child: ticketDetailsWidget(
                                    'Class', '$classType', 'Seat', '$seatNo'),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 30.0, left: 30.0, right: 30.0),
                          child: Container(
                            width: 250.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/barcode.png'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 10.0),
                          child: Center(
                            child: Text(
                              '$_1 $_2 $_3 $_4',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: ReusableButton(
                  label: 'Checkout',
                  onPress: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ticketDetailsWidget(String firstTitle, String firstDesc,
      String secondTitle, String secondDesc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                firstTitle,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  firstDesc,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                secondTitle,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  secondDesc,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
