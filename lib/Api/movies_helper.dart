import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:netflix/Api/movie_model.dart';
import 'package:netflix/Api/uri_list.dart';
import 'package:netflix/screens/splash_screen.dart';

Future <List<Movie>> upComingtLoading()async{

  final upcomingResponse = await http.get(Uri.parse(upComing));
  if(upcomingResponse.statusCode==200){
    var upComingData = jsonDecode(upcomingResponse.body);
    final List upComingMovie =upComingData['results'];

    for(var x in upComingMovie){
      upCominglist.add(Movie.fromJson(x));

    }
    return upCominglist;
  }else{
    throw Exception("failed to fetch the data");
  }
}

Future<List<Movie>> popularLoading() async {
  final popularResponse = await http.get(Uri.parse(popular));

  if (popularResponse.statusCode == 200) {
    var popularData = jsonDecode(popularResponse.body);
   final List popularMovie = popularData['results'];

    for(var x in popularMovie){
      popularmovielist.add(Movie.fromJson(x));

    }

  print(popularMovie);
    return popularmovielist;
  } else {
    throw Exception("failed to fetch the data");
  }
}

Future<List<Movie>> topRatedLoading() async {
  final topRatedResponse = await http.get(Uri.parse(topRated));

  if (topRatedResponse.statusCode == 200) {
    var toRatedData = jsonDecode(topRatedResponse.body);
    final List topRatedMovie = toRatedData['results'];
    for (var x in topRatedMovie) {
      topRatedMovielist.add(Movie.fromJson(x));
    }
   // print(topRatedMovie);
    return topRatedMovielist;
  } else {
    throw Exception("fialed to upload the data");
  }
}

Future<List<Movie>> trendigLoading() async {
  var trendingResponse = await http.get(Uri.parse(trending));

  if (trendingResponse.statusCode == 200) {
    var trendingData = jsonDecode(trendingResponse.body);
    final List trendingMovie = trendingData['results'];

    for (var x in trendingMovie) {
      trendinglist.add(Movie.fromJson(x));
    }
    return trendinglist;
  } else {
    throw Exception("failed to get the data");
  }
}
