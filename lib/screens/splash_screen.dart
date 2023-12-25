import 'dart:async';
import 'package:flutter/material.dart';

import 'package:netflix/Api/api_file.dart';
import 'package:netflix/main.dart';
import 'package:netflix/screens/home_screen.dart';
import 'package:tmdb_api/tmdb_api.dart';
//import 'package:netflix/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  void loadMovies() async {
    TMDB tmbdLogs = TMDB(ApiKeys(Apikey, APiTocken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map trendingResult = await tmbdLogs.v3.trending.getTrending();
    Map topratedResult = await tmbdLogs.v3.movies.getTopRated();
    Map tvShowsResult = await tmbdLogs.v3.tv.getPopular();

    List allListedMovies = [];

    setState(() {
      trendingMovies = trendingResult['results'];
      topratedMovies = topratedResult['results'];
      tvShows = tvShowsResult['results'];
      allListedMovies.addAll(trendingMovies);
      allListedMovies.addAll(topratedMovies);
      allListedMovies.addAll(tvShows);
      allMovies = allListedMovies;
    });
 

    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MainPage())));
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Center(
          child: Image.asset('images/Nlogo.png', ),
        ),
      ),
    );
  }
}
