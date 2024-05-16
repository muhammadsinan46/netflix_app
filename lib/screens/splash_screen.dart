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
        const Duration(milliseconds:1500),
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
          child: Image.network('https://i.pinimg.com/originals/f6/b1/1b/f6b11bd53411d94338117381cf9a9b9b.gif',scale:.1,)
        ),
      ),
    );
  }
}
