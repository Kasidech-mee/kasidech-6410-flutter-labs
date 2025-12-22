import 'package:flutter/material.dart';

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
