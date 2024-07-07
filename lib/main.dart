import 'package:flutter/material.dart';
import 'package:movies_app/core/services/services_locator.dart';

import 'movies/domain/entities/movie.dart';
import"movies/presentation/screens/movies_screen.dart";

void main() {
  // if we remove const it sill return false even though we override operator & hashCode because of list you can only make list const and it will work
  ServicesLocator().init();
  Movie movie = const Movie(
      backdropPath: "backdropPath",
      genreIds: [0],
      id: 1,
      overview: 'dsa',
      title: 'sda',
      voteAverage: 21,
      releaseDate: '12.9');
  Movie movie1 = const Movie(
      backdropPath: "backdropPath",
      genreIds: [0],
      id: 1,
      overview: 'dsa',
      title: 'sda',
      voteAverage: 21,
      releaseDate: '12.9');
  print(movie == movie1);
  print(movie.hashCode); // this return the address of object in memory
  // if you make your constructor const it will return true if not const return false
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainMoviesScreen(),
    );
  }
}
