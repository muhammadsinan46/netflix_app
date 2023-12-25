import 'package:flutter/material.dart';
import 'package:linear_timer/linear_timer.dart';
import 'package:netflix/screens/details_screen.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    super.key,
    required this.widget,
    required this.cuDate,
    required this.title,
  });

  final DetailsScreen widget;
  final DateTime cuDate;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LinearTimer(
            color: Colors.red,
            backgroundColor: Color.fromARGB(129, 67, 67, 67),
            duration: Duration(minutes: 20),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
            "$title",
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.w800),
            ),
          ),
          Row(
            children: [
              Text(
                "${cuDate.year}",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.explicit),
              SizedBox(
                width: 5,
              ),
              Text("1h44m  "),
              Icon(Icons.hd)
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Watch in Malayalam, Hindi,Spanish",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
