import 'package:flutter/material.dart';
import 'package:kasidech_widgets_exercises/components/submit_button_widget.dart';

class ProfileWithButton extends StatelessWidget {
  const ProfileWithButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Kasidech",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "663040641-0",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ), // name and phone number
            Container(
              height: 200,
              decoration: BoxDecoration(),
              child: Image.asset(
                "assets/images/Kasidech_Profile.jpg",
                fit: BoxFit.fill,
              ),
            ),
            Text(
              "Photo Credit: Facebook - กษิเดช มีลาภ",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SubmitButtonWidget(),
          ],
        ),
      ),
    );
  }
}
