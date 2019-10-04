import 'package:day_4_movies_assignment/movies.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
//import 'dart:io';
import 'dart:convert';

void main() {
  Widget _cr() {
    return CarouselSlider(
      height: 400.0,
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: Colors.amber),
                child: Text(
                  'text $i',
                  style: TextStyle(fontSize: 16.0),
                ));
          },
        );
      }).toList(),
    );
  }

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
    List<String> posterList = [];
    movies.forEach((e) {
      posterList.add(e['poster']);
      //print(e['poster']);
    });
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
          body: Center(
            child: CarouselSlider(
                enlargeCenterPage: true,
                items: posterList.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          height: 600,
//                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 16.0),
                          decoration: BoxDecoration(color: Colors.yellow),
                          child: Image(
                            image: NetworkImage(i),
                            fit: BoxFit.cover,
                          ));
                    },
                  );
                }).toList(),
//              height: 400.0,
                autoPlay: true),
          )
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
