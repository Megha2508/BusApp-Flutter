import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bus_ticket_app/widget/constants.dart';
import '../widget/features_widget.dart';

const activeCardColor = Colors.tealAccent;
const inactiveCardColor = Color(0xFF1DE9B6);
int busSeatNumber;
String busType;
String busPrice;
String classType;

enum BusType { Volvo, Semi_Deluxe, Non_AC_Sleeper, Mini }

class Bus extends StatefulWidget {
  @override
  _BusState createState() => _BusState();
//  int noOfSeats() => (busSeatNumber);
}

class _BusState extends State<Bus> {
  BusType selectedBusType;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Select your type...',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
          ),
          backgroundColor: Colors.teal,
          elevation: 10.0,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () async {
                  Navigator.pushNamed(context, '/');
                  await auth.signOut();
                }),
          ],
        ),
        backgroundColor: Colors.teal,
        body: ListView(
          children: <Widget>[
            SizedBox(height: 30.0),
            ReusableCard(
              onPress: () {
                setState(() {
                  selectedBusType = BusType.Volvo;
                  busSeatNumber = 45;
                  classType = "A/C Sleeper";
                  busType = 'Volvo';
                  busPrice = '1500';
                });
              },
              colour: selectedBusType == BusType.Volvo
                  ? activeCardColor
                  : inactiveCardColor,
              cardChild: IconContent(
                label1: 'Volvo',
                label2:
                    'Spacious and Comfortable 2*2 A/C buses for ease and comfort during journey between all districts and major routes.',
                label3: 'Price: Rs. 1500',
              ),
            ),
            ReusableCard(
              onPress: () {
                setState(() {
                  selectedBusType = BusType.Semi_Deluxe;
                  busSeatNumber = 40;
                  classType = "A/C Seater";
                  busType = 'Semi_Deluxe';
                  busPrice = '1000';
                });
              },
              colour: selectedBusType == BusType.Semi_Deluxe
                  ? activeCardColor
                  : inactiveCardColor,
              cardChild: IconContent(
                label1: 'Semi Deluxe',
                label2:
                    'Low fare A/C 2*2 which provide great economical facilities to the passengers.',
                label3: 'Price: Rs. 1000',
              ),
            ),
            ReusableCard(
              onPress: () {
                setState(() {
                  selectedBusType = BusType.Non_AC_Sleeper;
                  busSeatNumber = 40;
                  classType = "Non A/C Sleeper";
                  busType = 'Non A/C Sleeper';
                  busPrice = '500';
                });
              },
              colour: selectedBusType == BusType.Non_AC_Sleeper
                  ? activeCardColor
                  : inactiveCardColor,
              cardChild: IconContent(
                label1: 'Non A/C Sleeper',
                label2:
                    '10 sleeper coaches for long distance routes for the comfort, especially, during night.',
                label3: 'Price: Rs. 500',
              ),
            ),
            ReusableCard(
              onPress: () {
                setState(() {
                  selectedBusType = BusType.Mini;
                  busSeatNumber = 25;
                  classType = "Non A/C Seater";
                  busType = 'Mini Bus';
                  busPrice = '300';
                });
              },
              colour: selectedBusType == BusType.Mini
                  ? activeCardColor
                  : inactiveCardColor,
              cardChild: IconContent(
                label1: 'Mini',
                label2:
                    'To extend travelling facility to the colonies and suburban towns.',
                label3: 'Price: Rs. 300',
              ),
            ),
            SizedBox(height: 10.0),
            ReusableButton(
              label: 'Proceed',
              onPress: () {
                Navigator.pushNamed(context, '/passenger');
              },
            ),
          ],
        ),
      ),
    );
  }
}
