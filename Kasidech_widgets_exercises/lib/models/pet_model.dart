import 'package:flutter/material.dart';

/*
* A model class to represent a pet with its properties use in pet card with model
* have required parameter to make sure data is provided when creating pet model
* and have default parameter for backgroundColor and textColor to make it optional when creating pet model
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
