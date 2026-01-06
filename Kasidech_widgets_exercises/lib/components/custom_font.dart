import 'package:flutter/material.dart';

/*
file where custom font Scaffold is implemented to show custom font in center of screen
by adding custom font in pubspec.yaml and call to use in TextStyle fontFamily property

@author Kasidech Meelarp
@Student ID 663040641-0
@Version 1.0.0
@date 5 Jan 2026
*/

class CustomFont extends StatelessWidget {
  const CustomFont({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Font Example')),
      body: Expanded(
        child: Center(
          child: Container(
            width: 300,
            height: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.lightGreenAccent,
              borderRadius: BorderRadius.circular(16),
            ),
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: EdgeInsets.all(16),

            child: Text(
              'กษิเดช มีลาภ',
              style: TextStyle(
                fontFamily: 'Charm',
                fontSize: 54,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
