import 'package:day_4_movies_assignment/movies.dart';
import 'package:flutter/material.dart';
//import 'dart:io';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: MyMovies(),
  ));
}

class MyMovies extends StatefulWidget {
  @override
  _MyMoviesState createState() => _MyMoviesState();
}

class _MyMoviesState extends State<MyMovies> {
  String moviesList = MoviesList.moviesJsonList;
  String link =
      "https://raw.githubusercontent.com/android10/Sample-Data/master/Android-CleanArchitecture-Kotlin/posters/038001.jpg";
  int moviesNumber = 0;
  @override
  Widget build(BuildContext context) {
    List movies = jsonDecode(moviesList);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            'Movies Poster',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.yellow,
        ),
        body: Container(
          color: Colors.yellow.shade200,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 10,
                    child: Image(
//                height: 300,
//                width: 300,
                      image: NetworkImage('$link'),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Card(
                      color: Colors.yellow,
                      child: FlatButton(
                        child: Text('Next Movie'),
                        onPressed: () {
                          setState(() {
                            link = movies[moviesNumber]['poster'];
                            moviesNumber = moviesNumber + 1;
                            if (moviesNumber == movies.length) moviesNumber = 0;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
//        floatingActionButton: FloatingActionButton(
//          child: Icon(Icons.movie),
//          onPressed: () {
//            setState(() {
//              link = movies[moviesNumber]['poster'];
//              moviesNumber = moviesNumber + 1;
//              if (moviesNumber == movies.length) moviesNumber = 0;
//            });
//          },
//        ), // Use stateful widget you created here
      ),
    );
  }
}

// You are given json string of movies list (see file movies.dart)

// Hint:
// Convert the string to List of maps using jsonDecode and then use it

// Create a stateful widget called MoviesPage here
