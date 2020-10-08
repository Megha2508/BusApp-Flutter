import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:bus_ticket_app/widget/constants.dart';
import 'package:bus_ticket_app/widget/features_widget.dart';

String pName;
String pAge;
String pDob;
String pAdhaar;
String pDoj;
int count = 0;
List<String> passengers = [];

class Passenger extends StatefulWidget {
  @override
  _PassengerState createState() => _PassengerState();
}

class _PassengerState extends State<Passenger> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController adhaar = TextEditingController();
  TextEditingController doj = TextEditingController();

  clearAll() {
    name.clear();
    age.clear();
    dob.clear();
    adhaar.clear();
    doj.clear();
  }

  final firestore = FirebaseFirestore.instance;
  User loggedInUser;
  bool showSpinner = false;
  bool isPressed = false;

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
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.teal,
          title: Text('Add your details'),
          elevation: 10.0,
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
          child: ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 2.0),
                            child: TextField(
                              controller: name,
                              decoration: kdecorationTextField.copyWith(
                                  hintText: 'Name',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                              onChanged: (value) {
                                pName = value;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 2.0),
                            child: TextField(
                              controller: age,
                              decoration: kdecorationTextField.copyWith(
                                  hintText: 'Age',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                              onChanged: (value) {
                                pAge = value;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 2.0),
                            child: TextField(
                              controller: dob,
                              decoration: kdecorationTextField.copyWith(
                                  hintText: 'Date-Of-Birth(dd-mm-yyyy)',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                              onChanged: (value) {
                                pDob = value;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 2.0),
                            child: TextField(
                              controller: adhaar,
                              decoration: kdecorationTextField.copyWith(
                                  hintText: 'Adhaar Card Number(12 digits)',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                              onChanged: (value) {
                                pAdhaar = value;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 2.0),
                            child: TextField(
                              controller: doj,
                              decoration: kdecorationTextField.copyWith(
                                  hintText: 'Date-Of-Journey(dd-mm-yyyy)',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                              onChanged: (value) {
                                pDoj = value;
                              },
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 30.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: FloatingActionButton.extended(
                            backgroundColor: Color(0xFF1DE9B6),
                            label: Text(
                              'Add Another',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0),
                            ),
                            onPressed: () {
                              setState(() {
                                showSpinner = true;
                                isPressed = true;
                                count++;
                                passengers.add(pName);
                              });
                              firestore.collection('passengers').add({
                                'Name': pName,
                                'Age': pAge,
                                'DOB': pDob,
                                'Adhaar': pAdhaar,
                                'DOJ': pDoj,
                                'Registered Mail': loggedInUser.email,
                              });
                              setState(() {
                                clearAll();
                                showSpinner = false;
                              });
                            },
                            icon: Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: ReusableButton(
                      label: 'Proceed',
                      onPress: () async {
                        if (!isPressed) {
                          firestore.collection('passengers').add({
                            'Name': pName,
                            'Age': pAge,
                            'DOB': pDob,
                            'Adhaar': pAdhaar,
                            'DOJ': pDoj,
                            'Registered Mail': loggedInUser.email
                          });
                          await Navigator.pushNamed(context, '/ticket');
                          print(passengers);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
