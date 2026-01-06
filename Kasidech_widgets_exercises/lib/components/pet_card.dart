import 'package:flutter/material.dart';

/*
A widget that displays a pet card use for multiple places where pet card is needed
using required parameter in PetCard class to make sure that data is provided when creating pet card
using Image.network to load image from url and ClipRRect to make rounded corner for image and container
and using default parameter for textColor, fontSize, backgroundColor to make it optional when creating pet card


@author Kasidech Meelarp
@Student ID 663040641-0
@Version 1.0.0
@date 2 Jan 2026
*/

class PetCard extends StatelessWidget {
  final String imageUrl;
  final String petName;
  final Color textColor;
  final double fontSize;
  final Color backgroundColor;

  const PetCard({
    super.key,
    required this.imageUrl,
    required this.petName,
    this.textColor = Colors.white,
    this.fontSize = 24.0,
    this.backgroundColor = Colors.pinkAccent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Image.network(
              imageUrl,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.0)),
            child: Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(color: backgroundColor),
              child: Text(
                textAlign: TextAlign.center,
                petName,
                style: TextStyle(fontSize: fontSize, color: textColor),
              ),
            ),
          ),
        ],
      );
  }
}
