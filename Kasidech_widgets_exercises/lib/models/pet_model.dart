import 'package:flutter/material.dart';

/*
* A model class to represent a pet with its properties 
*
* @author Kasidech Meelarp
* @Student ID 663040641-0
* @Version 1.0.0
* @date 2 Jan 2026
* */

class PetModel {
  final String name;
  final String imageUrl;
  final Color backgroundColor;
  final Color textColor;

  PetModel({
    required this.name,
    required this.imageUrl,
    this.backgroundColor = Colors.pinkAccent,
    this.textColor = Colors.white,
  });
}
