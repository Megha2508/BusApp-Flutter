import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bus_ticket_app/widget/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bus_ticket_app/widget/features_widget.dart';

import 'Features.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<String> pname = [];
  final firestore = FirebaseFirestore.instance;
  List<dynamic> pDetail = [];

  void getDetails() async {
    final details = await firestore.collection('passengers').get();
    for (var detail in details.docs) {
      pDetail.add(detail.data().entries.last);
//      print(detail.data);
      print(pDetail);
    }
  }

  void pList() {
    for (var i in passengers) {
      pname.add(i);
    }
  }

  @override
  void initState() {
    super.initState();
    getDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'History',
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
        body: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: inactiveCardColor,
                    borderRadius: BorderRadius.circular(10.0)),
                child: ReusableCard(
                  onPress: () {
                    Navigator.pushNamed(context, '/ticket');
                  },
                  cardChild: Center(
                      child: IconContent(
                    label1: 'Name: ${pDetail.last[6]}',
                    label2: 'Destination: Jaipur',
                    label3: 'DOJ: ${pDetail.last[5]}',
                  )),
                ),
              ),
            )
          ],
        ),
//        ListView.builder(
//          itemCount: count,
//          itemBuilder: (context, index) {
//            index++;
//            print(index);
//            return ListView(
//              children: <Widget>[
//                ReusableCard(
//                  onPress: () {
//                    Navigator.pushNamed(context, '/ticket');
//                  },
////                  colour: pname[index] == pDetail.last
////                      ? activeCardColor
////                      : inactiveCardColor,
//                  cardChild: Center(child: IconContent(label1: pDetail.last)),
//                )
//              ],
//            );
//          },
//        ),
      ),
    );
  }
}
