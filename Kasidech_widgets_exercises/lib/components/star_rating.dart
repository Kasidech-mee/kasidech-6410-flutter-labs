import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  const StarRating({super.key, required this.starCount});

  final double starCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [ // AI help full star append +1 beause i forgot to i+1 when checking codition
        for (int i = 0; i < 5; i++)
          if (starCount >= i + 1)
            Icon(Icons.star, color: Colors.amber)
          else if (starCount > i)
            Icon(Icons.star_half, color: Colors.amber)
          else
            Icon(Icons.star_border, color: Colors.amber),
      ],
    );
  }
}
