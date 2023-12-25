import 'package:flutter/material.dart';
import 'package:netflix/screens/home_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var _searchController = TextEditingController();
  List SearchedMovies = [];
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
                  border:
                      OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20))),
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    SearchedMovies = allMovies;
                  } else {
                    SearchedMovies = allMovies
                        .where((movie) =>
                            movie['title']
                                .toString()
                                .toLowerCase()
                                .contains(value.toLowerCase()) ||
                            movie['poster_path']
                                .toString()
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                        .toList();
                  }
                });
              },
                      ),
            ),
            Text("Top Searches"),
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
                                  'https://image.tmdb.org/t/p/w500/' +
                                      allMovies[index]['poster_path'].toString(),
                                ),
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
                                      'https://image.tmdb.org/t/p/w500/' +
                                          SearchedMovies[index]['poster_path']
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
                            )
                            ),
          ],
        ),
      ),
    );
  }

}
