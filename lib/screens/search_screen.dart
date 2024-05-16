import 'dart:async';
import 'package:flutter/material.dart';
import 'package:netflix/Api/movie_model.dart';
import 'package:netflix/Api/uri_list.dart';
import 'package:netflix/screens/splash_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var _searchController = TextEditingController();
  List<Movie> SearchedMovies = [];
  String searchText = "";
  Timer? debouncer;
  onSearchChange(String value) {
    value = _searchController.text;
    if (debouncer?.isActive ?? false) debouncer?.cancel();
    debouncer = Timer(Duration(milliseconds: 500), () {
      if (this.searchText != _searchController) {
        setState(() {
          SearchedMovies = allMovies
              .where((movie) =>
                  movie.title
                      .toString()
                      .toLowerCase()
                      .contains(value.toLowerCase()) ||
                  movie.posterPath
                      .toString()
                      .toLowerCase()
                      .contains(value.toLowerCase()))
              .toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                    hintText: 'Search....',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                        icon: Icon(
                          Icons.remove_circle,
                        ),
                        onPressed: () => _searchController.clear()),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20))),
                onChanged: (value) {
                  onSearchChange(value);
                },
              ),
            ),
            Expanded(
                child: (_searchController.text.isEmpty)
                    ? GridView.builder(
                        itemCount: allMovies.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 2 / 3,
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              child: Image.network(
                                  '$baseUrl/${allMovies[index].posterPath}'),
                            ),
                          );
                        },
                      )
                    : (SearchedMovies.isNotEmpty)
                        ? GridView.builder(
                            itemCount: SearchedMovies.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 2 / 3,
                              crossAxisCount: 3,
                            ),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  child: Image.network(
                                    '$baseUrl/${SearchedMovies[index].posterPath}',
                                  ),
                                ),
                              );
                            },
                          )
                        : Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 15),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Oops.We haven't got that.",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 25),
                                    ),
                                  ],
                                )),
                          )),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }
}
