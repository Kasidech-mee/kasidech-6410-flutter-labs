//a custom QuoteCard
//
//This widget display quote image with quote author name
//
//@author Kasidech Meelarp
//@version 1.0.0
//@date 10-12-2025
import 'package:flutter/material.dart';

//AI using Gemini in google search
//
//Searching "Idea to make max height in flutter"
//
//Ai respones:
//In Flutter, when using the AspectRatio widget, the "max height" is not directly set on the AspectRatio itself in the same way you might set a fixed height on a SizedBox or Container. Instead, the AspectRatio widget works by attempting to maintain a specific width-to-height ratio for its child within the constraints provided by its parent.
// Here's how it works with respect to maximum height:
// Parent Constraints: The AspectRatio widget receives constraints (minimum and maximum width and height) from its parent in the widget tree.
// Aspect Ratio Calculation: It then tries to find a size for its child that satisfies both the parent's constraints and the specified aspectRatio.
// Prioritization: If there's a conflict, the AspectRatio widget prioritizes satisfying the parent's constraints. This means if the parent provides a maximum height constraint that is smaller than what would be required to maintain the aspect ratio with the available width, the AspectRatio will respect the parent's maximum height, and the width will be adjusted accordingly to maintain the ratio as much as possible within those limits.
// To effectively limit the maximum height of a widget wrapped in AspectRatio:
// You need to provide a maximum height constraint to the AspectRatio from its parent. This can be done using widgets like:
// ConstrainedBox: This widget applies its constraints in all cases, regardless of the parent's constraints. You can use it to set a maxHeight for the AspectRatio's parent.
// Code
//
//     ConstrainedBox(
//       constraints: BoxConstraints(maxHeight: 200.0), // Set a max height
//       child: AspectRatio(
//         aspectRatio: 16 / 9,
//         child: Container(color: Colors.blue),
//       ),
//     )
// LimitedBox: This widget limits its size only when it's unconstrained by its parent. If the AspectRatio's parent doesn't provide a maximum height, LimitedBox can step in.
// Code
//
//     LimitedBox(
//       maxHeight: 200.0,
//       child: AspectRatio(
//         aspectRatio: 16 / 9,
//         child: Container(color: Colors.blue),
//       ),
//     )
// SizedBox: If you want a fixed size that also respects an aspect ratio, you can use SizedBox to define the overall dimensions, and AspectRatio will ensure its child maintains the ratio within those bounds.
// Code
//
//     SizedBox(
//       width: 300.0,
//       height: 200.0, // This acts as a max height
//       child: AspectRatio(
//         aspectRatio: 16 / 9,
//         child: Container(color: Colors.blue),
//       ),
//     )
// By wrapping the AspectRatio in one of these constraint-providing widgets, you can control the maximum height that the AspectRatio's child can take, while still allowing the aspect ratio to influence the final dimensions within those limits.

void main() {
  runApp(const QuoteCard());
}

class QuoteCard extends StatelessWidget {
  const QuoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: .fromSeed(seedColor: Colors.deepOrangeAccent),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepOrangeAccent,
          foregroundColor: Colors.white,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('My Favourite quote')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 500,
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Image.asset(
                          'assets/images/quote.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ROBERT",
                          style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "GREENE",
                          style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
