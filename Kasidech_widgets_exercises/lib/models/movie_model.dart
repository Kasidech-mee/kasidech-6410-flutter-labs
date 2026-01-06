import 'package:flutter/material.dart';

/*
* A model class to represent a movies
*
* @author Kasidech Meelarp
* @Student ID 663040641-0
* @Version 1.0.0
* @date 5 Jan 2026
* */

class MovieModel {
  final String titles;
  final int releaseYear;
  final String genre;
  final String director;
  final double rating;

  const MovieModel({
    required this.titles,
    required this.releaseYear,
    required this.genre,
    required this.director,
    required this.rating,
  });
}
