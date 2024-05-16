import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix/Api/uri_list.dart';
import 'package:netflix/screens/splash_screen.dart';

class ComingSoonTab extends StatelessWidget {
  ComingSoonTab({required this.itemIndex, Key? key}) : super(key: key);
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 50,
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(DateFormat("MMM").format(DateTime.parse(
                      upCominglist[itemIndex].releaseDate.toString()))),
                  Text(
                    DateFormat("dd").format(DateTime.parse(
                        upCominglist[itemIndex].releaseDate.toString())),
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width - 60,
              child: Column(children: [
                Container(
                  width: size.width,
                  child: Image.network(
                    '$baseUrl/${upCominglist[itemIndex].backdropPath}',
                    fit: BoxFit.cover,
                    width: 200,
                    height: 250,
                  ),
                ),
                SizedBox(
                  // height: 70,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        'https://occ-0-6336-2186.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABb2ylXqXkYYW6mHVKBIMrfAKck56ZbwlzVzaaWL__kjxQVsknC12pG_uLisNbA_EEvjm8ylMTGOoUoTpGFB3TCJwNDIK0EkOWEA5TZcicsQsLH_J38ICYQ7CSvycfw9_DvhBX2LnFQykor0slfnigx8trlWb9MZ1hR-5JO_7Hp9PUQuOUDR2gA.png?r=f33',
                        fit: BoxFit.cover,
                        width: 150,
                        height: 40,
                      ),
                      TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.notifications, color: Colors.white),
                          label: Text(
                            "Remind Me",
                            style: TextStyle(color: Colors.white),
                          )),
                      TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.info, color: Colors.white),
                          label: Text(
                            "Info",
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    //  height: 150,
                    width: size.width,
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Coming on ${(upCominglist[itemIndex].releaseDate != null) ? upCominglist[itemIndex].releaseDate : 'Dec 25'}",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                        Text('${upCominglist[itemIndex].overview}')
                      ],
                    ))
              ]),
            ),
          ],
        ),
      ],
    );
  }
}
