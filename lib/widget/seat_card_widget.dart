import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bus_ticket_app/features/Seat.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

Seat seat = Seat();

class SeatCard extends StatelessWidget {
  SeatCard({this.num});

  final int num;
//  Color colour() {
//    // ignore: unrelated_type_equality_checks
//    return selectedSeat == true ? activeCardColor : inactiveCardColor;
//  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
//        seat.press();
      },
//      child: GridView.count(
//        primary: false,
//        padding: EdgeInsets.all(10),
//        crossAxisSpacing: 10,
//        mainAxisSpacing: 10,
//        crossAxisCount: 1,
//        children: <Widget>[
//          Container(
//            padding: EdgeInsets.all(8),
//            child: Center(
//              child: Text(
//                "$num",
//                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//              ),
//            ),
//            decoration: BoxDecoration(
////              color: colour(),
//              borderRadius:
//                  BorderRadius.vertical(bottom: Radius.circular(25.0)),
//            ),
//          ),
//        ],
//      ),
    );
  }
}

class SeatLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
//        seat.press();
      },
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 5,
        itemBuilder: (BuildContext context, int index) => new Container(
            color: Color(0xFF1DE9B6),
            child: new Center(
              child: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text('$index'),
              ),
            )),
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 2 : 1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
