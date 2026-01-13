import 'package:flutter/material.dart';

class Ratings extends StatelessWidget {
  const Ratings({super.key, required this.defaultColor, required this.ratingColor});

  final Color defaultColor;
  final Color ratingColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: defaultColor),
        Icon(Icons.star, color: defaultColor),
        Icon(Icons.star, color: defaultColor),
        Icon(Icons.star, color: defaultColor),
        Icon(Icons.star, color: ratingColor),
      ]
    );
  }
}