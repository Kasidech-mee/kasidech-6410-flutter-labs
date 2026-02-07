import 'package:flutter/material.dart';

class InteractiveRatings extends StatefulWidget {
  final int totalStars;
  final double starSize;
  final double spacing;
  final Color activeColor;
  final Color inactiveColor;
  final int ratings = 0;

  const InteractiveRatings({
    super.key,
    this.totalStars = 5,
    this.starSize = 24.0,
    this.spacing = 4.0,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  State<InteractiveRatings> createState() => _InteractiveRatingsState();
}

class _InteractiveRatingsState extends State<InteractiveRatings> {
  int ratings = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        widget.totalStars,
        (index) => GestureDetector(
          onTap: () => {
            setState(() {
              ratings = index + 1;
            }),
          },
          child: Padding(
            padding: EdgeInsets.all(widget.spacing),
            child: index < ratings
                ? Icon(Icons.star, color: widget.activeColor)
                : Icon(Icons.star, color: widget.inactiveColor),
          ),
        ),
      ),
    );
  }
}
