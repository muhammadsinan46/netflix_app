import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/home_screen.dart';
import 'package:netflix/widgets/custome_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController search = TextEditingController();
  List<dynamic> filteredMovies = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CupertinoSearchTextField(
                controller: search,
                backgroundColor: Colors.grey.withOpacity(0.4),
                prefixInsets: EdgeInsetsDirectional.fromSTEB(6, 0, 0, 3),
                prefixIcon: Icon(CupertinoIcons.search),
                suffixInsets: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 2),
                suffixIcon: Icon(CupertinoIcons.xmark_circle_fill),
                onChanged: (query) {
                  setState(() {
                    if (query.isEmpty) {
                      filteredMovies = allMovies;
                    } else {
                      filteredMovies = allMovies
                          .where((movie) =>
                              movie['title']
                                  .toString()
                                  .toLowerCase()
                                  .contains(query.toLowerCase()) ||
                              movie['poster_path']
                                  .toString()
                                  .toLowerCase()
                                  .contains(query.toLowerCase()))
                          .toList();
                    }
                  });
                },
              ),
            ),
            customText(
              text: "New & All Movie",
              size: 25,
              wight: FontWeight.w800,
            ),
            Expanded(
                child: (search.text.isEmpty)
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
                                'https://image.tmdb.org/t/p/w500/' +
                                    allMovies[index]['poster_path'].toString(),
                              ),
                            ),
                          );
                        },
                      )
                    : (filteredMovies.isNotEmpty)
                        ? GridView.builder(
                            itemCount: filteredMovies.length,
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
                                    'https://image.tmdb.org/t/p/w500/' +
                                        filteredMovies[index]['poster_path']
                                            .toString(),
                                  ),
                                ),
                              );
                            },
                          )
                        : GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 2 / 3,
                              crossAxisCount: 3,
                            ),
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      color: Colors.white24.withOpacity(.02),
                                    ),
                                  ),
                                ],
                              );
                            },
                          )),
          ],
        ),
      ),
    );
  }
}