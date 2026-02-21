import 'package:flutter/material.dart';
import 'package:kasidech_widgets_exercises/components/contact_image.dart';
import 'package:kasidech_widgets_exercises/components/contact_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(
      allowList: {'starRating'},
    ),
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
      ),
      home: MainProfileCardRatingPreferences(prefs: prefs),
    ),
  );
}

class MainProfileCardRatingPreferences extends StatefulWidget {
  final SharedPreferencesWithCache prefs;
  const MainProfileCardRatingPreferences({super.key, required this.prefs});

  @override
  State<MainProfileCardRatingPreferences> createState() =>
      _MainProfileCardRatingPreferencesState();
}

class _MainProfileCardRatingPreferencesState
    extends State<MainProfileCardRatingPreferences> {
  int ratings = 0;

  _saveRating(int rating) async {
    await widget.prefs.setInt('starRating', rating);
    setState(() {
      ratings = rating;
    });
  }

  @override
  void initState() {
    super.initState();
    ratings = widget.prefs.getInt('starRating') ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    int totalStars = 5;
    double spacing = 8.0;
    Color activeColor = Theme.of(context).colorScheme.primary;
    Color inactiveColor = Theme.of(context).colorScheme.inversePrimary;

    if (orientation == Orientation.landscape) {
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
                        imageFile: "assets/images/chineseGuys.jpg",
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

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          totalStars,
                          (index) => GestureDetector(
                            onTap: () => {_saveRating(index + 1)},
                            child: Padding(
                              padding: EdgeInsets.all(spacing),
                              child: index < ratings
                                  ? Icon(Icons.star, color: activeColor)
                                  : Icon(Icons.star, color: inactiveColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ContactImage(
                  imageFile: "assets/images/chineseGuys.jpg",
                  name: "Xa yuut",
                ),
                ContactInfo(
                  addrName: "Xayuut's Place",
                  addrInfo: "333 China",
                  email: "Xayuut@example.com",
                  phone: "+1234567890",
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    totalStars,
                    (index) => GestureDetector(
                      onTap: () => {_saveRating(index + 1)},
                      child: Padding(
                        padding: EdgeInsets.all(spacing),
                        child: index < ratings
                            ? Icon(Icons.star, color: activeColor)
                            : Icon(Icons.star, color: inactiveColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
