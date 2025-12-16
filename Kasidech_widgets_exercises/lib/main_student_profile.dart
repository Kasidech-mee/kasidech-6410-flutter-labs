import 'package:flutter/material.dart';

/*
* A Simple student profile that display my name and students ID
*
* Doesn't use any AI
*
* Using name and id to contain strings to use in  Text
* returning MaterialApp that using Scaffold that body being Center to make text on the middle of screen
* next using Column to contain multiple Text child and help to make text container top to down
* in Text using textSytle to mak make font size and font style
*
* @author Kasidech Meelarp
* @Student ID 663040641-0
* @Version 1.0.0
* @date 10 Dec 2025
* */

void main() {
  runApp(StudentProfile());
}

class StudentProfile extends StatelessWidget {
  const StudentProfile({super.key});

  @override
  Widget build(BuildContext context) {
    const String name = "Kasidech Meelarp";
    const String id = "663040641-0";
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Student Profile",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: .fromSeed(seedColor: Colors.deepOrangeAccent),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepOrangeAccent,
          foregroundColor: Colors.white,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Student Profile')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                id,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
