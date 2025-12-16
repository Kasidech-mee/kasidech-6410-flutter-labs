import 'package:flutter/material.dart';

class PetCard extends StatelessWidget {
  final String imageUrl;
  final String petName;
  final Color textColor;
  final double fontSize;
  final bool showBorder;
  final Color backgroundColor;

  const PetCard({
    super.key,
    required this.imageUrl,
    required this.petName,
    this.textColor = Colors.white,
    this.fontSize = 24.0,
    this.showBorder = false,
    this.backgroundColor = Colors.pinkAccent,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
            child: Image.network(
              imageUrl,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.0)),
            child: Text(
              "Dog",
              style: TextStyle(fontSize: fontSize, color: textColor),
            ),
          ),
        ],
      ),
    );
  }
}
