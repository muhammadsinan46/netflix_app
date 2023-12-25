import 'package:flutter/material.dart';
import 'package:netflix/screens/home_screen.dart';

import 'package:netflix/widgets/carousal_widget.dart';

import 'package:netflix/widgets/custom_button2.dart';
import 'package:netflix/widgets/details_widget.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen(
      {required this.title,
      required this.date,
      required this.rate,
      required this.imageUrl,
      required this.overview,
      Key? key})
      : super(key: key);

  final String title;
  final String date;
  final String rate;
  final String imageUrl;
  final String overview;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime cuDate = DateTime.now();

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading:  IconButton(
    icon: Icon(Icons.arrow_back, ),
    onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
  ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 320,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                        height: 220,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          widget.imageUrl,
                          fit: BoxFit.cover,
                        )),
                    Positioned(
                        top: 200,
                        child: Container(
                            color: Color.fromARGB(82, 114, 114, 114),
                            child: Text(
                              "⭐${widget.rate}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            )))
                  ],
                ),
                DetailsWidget(
                  widget: widget,
                  cuDate: cuDate,
                  title: widget.title,
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [],
            ),
          ),
          CustomButton2(
            name: " Play",
            icon: Icon(
              Icons.play_arrow,
              color: Colors.black,
            ),
            Bcolor: Colors.white,
            Fcolor: Colors.black,
          ),
          CustomButton2(
            name: " Download",
            icon: Icon(
              Icons.download,
              color: Colors.white,
            ),
            Bcolor: Color.fromARGB(184, 73, 72, 72),
            Fcolor: Colors.white,
          ),
          Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    widget.overview,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    // height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.add,
                              size: 30,
                            ),
                            Text("My List",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300))
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.recommend, size: 30),
                            Text("Rate",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300)),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.share, size: 30),
                            Text("Share",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300))
                          ],
                        ),
                      ],
                    ),
                  ),
                  CustomCarousal(
                      carousalName: "More Like This", topRated: topratedMovies),
                ],
              ))
        ],
      ),
    ));
  }
}
