import 'package:flutter/material.dart';
import 'package:kasidech_widgets_exercises/components/contact_image.dart';
import 'package:kasidech_widgets_exercises/components/contact_info.dart';
import 'package:kasidech_widgets_exercises/components/profile_card_rating.dart';
import 'package:kasidech_widgets_exercises/components/ratings.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,

      home: const MainProfileCardRatingResponsive(),
    ),
  );
}

class MainProfileCardRatingResponsive extends StatelessWidget {
  const MainProfileCardRatingResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.portrait) {
      return _buildPortraitLayout();
    } else {
      return _buildLandscapeLayout();
    }
  }

  Widget _buildPortraitLayout() {
    return Scaffold(body: SafeArea(child: ProfileCardRating()));
  }

  Widget _buildLandscapeLayout() {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.orange,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ContactImage(
                      imageFile: "assets/images/peXi.jpg",
                      name: "Lichengkou",
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ContactInfo(
                      addrName: "Lichengkou's Place",
                      addrInfo: "123 Chingchong China",
                      email: "llichengkou@example.com",
                      phone: "+1234567890",
                    ),

                    Ratings(
                      defaultColor: Colors.yellow,
                      ratingColor: Colors.black,
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
