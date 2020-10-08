import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:bus_ticket_app/features/Features.dart';
import 'package:bus_ticket_app/widget/constants.dart';

class Seat extends StatefulWidget {
  @override
  _SeatState createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  bool selectedSeat = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
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
      body: GestureDetector(
        onTap: () {
          setState(() {
            selectedSeat = true;
          });
        },
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 5,
          itemBuilder: (BuildContext context, int index) => Container(
              color: inactiveCardColor,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text('$index'),
                ),
              )),
          staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, index.isEven ? 2 : 1),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
      ),
    );
  }
}
