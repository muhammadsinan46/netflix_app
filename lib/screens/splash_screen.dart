import 'dart:async';
import 'package:flutter/material.dart';

import 'package:netflix/Api/movie_model.dart';
import 'package:netflix/Api/movies_helper.dart';
import 'package:netflix/main.dart';

List<Movie> popularmovielist = [];
List<Movie> trendinglist = [];
List<Movie> nowplayinglist = [];
List<Movie> upCominglist = [];
List<Movie> topRatedMovielist = [];
List<Movie> allMovies = [];



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

  Map<int, dynamic>? fullLoaded;
  void loadMovies() async {
    await popularLoading();
    await topRatedLoading();
    await upComingtLoading();
    await trendigLoading();

    List<Movie> combinedMovies = [];
    combinedMovies.addAll(popularmovielist);
    combinedMovies.addAll(trendinglist);
    combinedMovies.addAll(topRatedMovielist);

    setState(() {
      allMovies = combinedMovies;
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
          child: Image.asset(
            'images/Nlogo.png',
          ),
        ),
      ),
    );
  }
}
