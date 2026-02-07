import 'package:flutter/material.dart';
import 'package:kasidech_interactivity_exercises/components/interactive_ratings.dart';
import 'package:kasidech_interactivity_exercises/screens/profile_card_rating_responsive.dart';
import 'package:kasidech_widgets_exercises/components/contact_image.dart';
import 'package:kasidech_widgets_exercises/components/contact_info.dart';

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
      themeMode: ThemeMode.system,
      home: MainInteractivityProfile(),
    ),
  );
}

class MainInteractivityProfile extends StatelessWidget {
  const MainInteractivityProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.portrait) {
      return _buildPortraitLayout();
    } else {
      return Scaffold(
        body: SafeArea(
          child: Container(
            color: Theme.of(context).colorScheme.surface,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ContactImage(
                        imageFile: "assets/images/RYut.jpg",
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
                        addrName: "Xayuut's Place",
                        addrInfo: "333 China",
                        email: "Xayuut@example.com",
                        phone: "+1234567890",
                      ),

                      InteractiveRatings(
                        activeColor: Theme.of(context).colorScheme.primary,
                        inactiveColor: Theme.of(
                          context,
                        ).colorScheme.outlineVariant,
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

  Widget _buildPortraitLayout() {
    return Scaffold(body: SafeArea(child: ProfileCardRatingResponsive()));
  }
}
