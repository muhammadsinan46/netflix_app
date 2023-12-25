import 'package:flutter/material.dart';

import 'package:netflix/screens/details_screen.dart';
import 'package:netflix/widgets/carousal_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:netflix/widgets/custom_button.dart';

List trendingMovies = [];
List topratedMovies = [];
List tvShows = [];
List allMovies = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'images/Nlogo.png',
          scale: 15,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.cast,
              size: 30,
            ),
          )
        ],
      ),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomButton(
                      name: "Tv Shows",
                      icon: Icon(Icons.tv),
                      radius: 30,
                      Bheight: 50,
                      Bwidth: 120,
                      fontSize: 14),
                  CustomButton(
                      name: "Movies",
                      icon: Icon(Icons.movie),
                      radius: 30,
                      Bheight: 50,
                      Bwidth: 120,
                      fontSize: 14),
                  CustomButton(
                      name: "Categories",
                      icon: Icon(Icons.arrow_drop_down),
                      radius: 30,
                      Bheight: 50,
                      Bwidth: 120,
                      fontSize: 14),
                ],
              ),
            )
          ];
        },
        body: ListView(
          children: [
            Column(
              children: [
                Center(
                  child: Card(
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 600,
                          child: CarouselSlider.builder(
                              itemCount: trendingMovies.length,
                              itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => DetailsScreen(
                                                  imageUrl:
                                                      'http://image.tmdb.org/t/p/w500' +
                                                          trendingMovies[
                                                                  itemIndex]
                                                              ['backdrop_path'],
                                                  title:
                                                      trendingMovies[itemIndex]
                                                          ['original_title'],
                                                  date:
                                                      trendingMovies[itemIndex]
                                                          ['release_date'],
                                                  rate:
                                                      trendingMovies[itemIndex]
                                                              ['vote_average']
                                                          .toString(),
                                                  overview:
                                                      trendingMovies[itemIndex]
                                                          ['overview'],
                                                )));
                                  },
                                  child: Image.network(
                                    'http://image.tmdb.org/t/p/w500' +
                                        trendingMovies[itemIndex]
                                            ['poster_path'],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                );
                              },
                              options: CarouselOptions(
                                  autoPlay: true,
                                  aspectRatio: .1,
                                  //  enlaRrgeCenterPage: true,
                                  // height: 220,
                                  viewportFraction: 1)),
                        ),
                        Positioned(
                          top: 520,
                          left: 200,
                          child: Row(
                            children: [
                              CustomButton(
                                  name: "Play",
                                  icon: Icon(Icons.play_arrow),
                                  radius: 10,
                                  Bheight: 50,
                                  Bwidth: 100,
                                  fontSize: 18),
                              CustomButton(
                                  name: "My List",
                                  icon: Icon(Icons.add),
                                  radius: 10,
                                  Bheight: 50,
                                  Bwidth: 100,
                                  fontSize: 18),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                CustomCarousal(
                    carousalName: "Only on Nextfix", topRated: trendingMovies),
                CustomCarousal(
                    carousalName: "Top 10 Tv shows", topRated: topratedMovies),
                CustomCarousal(
                    carousalName: "Continue to watch for User",
                    topRated: topratedMovies),
                CustomCarousal(
                    carousalName: "Award winning film",
                    topRated: topratedMovies),
                CustomCarousal(
                    carousalName: "Acrtions", topRated: topratedMovies),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
