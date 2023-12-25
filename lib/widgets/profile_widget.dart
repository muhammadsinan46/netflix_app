import 'package:flutter/material.dart';
import 'package:netflix/screens/home_screen.dart';

class ProfileWidget1 extends StatelessWidget {
  const ProfileWidget1({ required this.index
    ,Key? key,
  }):super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 100,
      child: Row(
        children: [
          SizedBox(
              height: 80,
              width: 100,
              child: Image.network(
                'http://image.tmdb.org/t/p/w500' +
                    tvShows[index]['poster_path'],
                fit: BoxFit.cover,
              )),
          SizedBox(
            width: 10,
          ),
          SizedBox(
              height: 80,
              width: 100,
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text("New Arrival",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ))),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "${(tvShows[index]['original_title'] != null) ? tvShows[index]['original_title'] : 'Late Night'}",
                          style: TextStyle(fontSize: 16),
                        )),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text("28 Dec"))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
