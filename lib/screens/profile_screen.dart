import 'package:flutter/material.dart';
import 'package:netflix/screens/home_screen.dart';
import 'package:netflix/widgets/carousal_widget.dart';
import 'package:netflix/widgets/profile_widget.dart';
import 'package:netflix/widgets/profile_widget2.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          
          padding: const EdgeInsets.only(left:8.0),
          child: Text("My Netflix", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        ),
        actions: [
          Icon(Icons.search),
          Padding(
        padding: const EdgeInsets.only(right:8.0),
            child: Icon(Icons.menu),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: false,
        children: [
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.only(top: 12),
                  child: Image.network(
                      'https://wallpapers.com/images/high/netflix-profile-pictures-1000-x-1000-w3lqr61qe57e9yt8.webp')),
              Text("Hexen")
            ],
          )),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.notifications),
              ),
              title: Text("Notifications"),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          ProfileWidget1(index: 1,),
          SizedBox(
            height: 10,
          ),
           ProfileWidget1(index: 5,),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.lightBlue,
                child: Icon(Icons.download),
              ),
              title: Text("Downloads"),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          ProfileWidget2(),
          CustomCarousal(carousalName: "Trailers you have Watched", topRated: tvShows),
          CustomCarousal(carousalName: "Continue Watching", topRated: topratedMovies),
              
        ],
      ),
    );
  }
}

