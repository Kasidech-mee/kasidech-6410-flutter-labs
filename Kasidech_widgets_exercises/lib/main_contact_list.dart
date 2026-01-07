import 'package:flutter/material.dart';
import 'screens/contact_list_screen.dart';

/* 
Main file to run  Contact list screen 

@author Kasidech Meelarp
@Student ID 663040641-0
@Version 1.0.0
@date 5 Jan 2026
 */

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
      ),
      home: MainContactList(),
    ),
  );
}

class MainContactList extends StatelessWidget {
  const MainContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return const ContactListScreen();
  }
}
