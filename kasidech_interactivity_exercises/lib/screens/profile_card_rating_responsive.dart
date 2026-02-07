import 'package:flutter/material.dart';
import 'package:kasidech_interactivity_exercises/components/interactive_ratings.dart';
import 'package:kasidech_widgets_exercises/components/contact_image.dart';
import 'package:kasidech_widgets_exercises/components/contact_info.dart';

class ProfileCardRatingResponsive extends StatelessWidget {
  const ProfileCardRatingResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ContactImage(imageFile: "assets/images/RYut.jpg", name: "Xa yuut"),
          ContactInfo(addrName: "Xayuut's Place", addrInfo: "333 China", email: "Xayuut@example.com", phone: "+1234567890"),
          InteractiveRatings(activeColor: Theme.of(context).colorScheme.primary, inactiveColor: Theme.of(context).colorScheme.outlineVariant),
        ],
      ),
    );
  }
}