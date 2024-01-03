import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:netflix/Api/movie_model.dart';
import 'package:netflix/Api/uri_list.dart';
import 'package:netflix/screens/details_screen.dart';

class CustomCarousal extends StatelessWidget {
  const CustomCarousal(
      {required this.carousalName, required this.carousalList, Key? key})
      : super(key: key);
  final String carousalName;

  final List<Movie> carousalList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  carousalName,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )),
          ),
          CarouselSlider.builder(
              itemCount: carousalList.length,
              itemBuilder:
                  (BuildContext context, int Index, int pageViewIndex) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          title: '${carousalList[Index].title}',
                         
                         date: '${carousalList[Index].releaseDate}',
                         rate:'${carousalList[Index].voteAverage}',
                         imageUrl:  '$baseUrl/${carousalList[Index].backdropPath}' ,
                        overview:  '${carousalList[Index].overview}'
                            )));
                  },
                  child: Image.network(
                     '$baseUrl/${carousalList[Index].posterPath}' ,
                    fit: BoxFit.cover,
                    width: 180,
                  ),
                );
              },
              options: CarouselOptions(
                autoPlay: false,
                aspectRatio: 1.0,
                //  enlargeCenterPage: true,
                height: 220,
                viewportFraction: 0.45,
              ))
        ],
      ),
    );
  }
}
