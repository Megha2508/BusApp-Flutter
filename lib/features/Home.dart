import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:bus_ticket_app/features/Features.dart';
import 'package:bus_ticket_app/widget/constants.dart';
import 'package:bus_ticket_app/widget/features_widget.dart';
import 'package:search_map_place/search_map_place.dart';

String from, to;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[HomePage(), History()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Booked',
          )
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.teal,
        selectedItemColor: Colors.tealAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Book and Go!!!',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Padding(
                padding: EdgeInsets.only(top: 60.0),
                child: ClipRect(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 3.0),
                        child: SearchMapPlaceWidget(
                          apiKey: 'AIzaSyC2DM3W_InplBMF2y65AhImin0pH0nf1vE',
                          placeholder: 'From',
                          iconColor: Colors.teal,
                          onSelected: (Place place) {
                            from =
                                place.description.substring(0, 3).toUpperCase();
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 3.0),
                        child: SearchMapPlaceWidget(
                          apiKey: 'AIzaSyC2DM3W_InplBMF2y65AhImin0pH0nf1vE',
                          placeholder: 'To',
                          iconColor: Colors.teal,
                          onSelected: (Place place) {
                            to =
                                place.description.substring(0, 3).toUpperCase();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.tealAccent,
                ),
                padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 90.0),
                child: ButtonWidget(
                  label: 'Select Bus Type',
                  onPress: () {
                    Navigator.pushNamed(context, '/bus');
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
