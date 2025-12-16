//a custom QuoteCard
//
//This widget display quote image with quote author name
//
//@author Kasidech Meelarp
//@version 1.0.0
//@date 10-12-2025
import 'package:flutter/material.dart';

/*
* A Simple quote display that display quote picture and their author
*
* Using Google Search engine AI to help make max width for picture
* Prompt: "Idea to make max height in flutter"
*
* like the exercise before is was setup just like the exercise before
* the changes start after column that i use expanded to make picture full as it can
* and i make a column inside it so i can have multiple child. In column have 2 children Sizedbox and Row
* First Sizedbox is create for adding image in it to make image have max height in aspect radio
* after that i use Row to make name to be line up Horizontal (because in Column make 2 child line up in Vertical)
* and using Sized box to make the text not next to each other
*
* @author Kasidech Meelarp
* @Student ID 663040641-0
* @Version 1.0.0
* @date 8 Dec 2025
* */

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
