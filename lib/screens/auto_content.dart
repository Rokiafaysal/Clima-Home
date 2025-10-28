import 'package:flutter/material.dart';
import 'package:smart_home_app/widgets/switch_card.dart';

class AutoContent extends StatelessWidget {
  const AutoContent({super.key});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SwitchCard(
          title: "Fan",
          imagePath: "assets/images/fanToggle.png",
          onSwitch: (isAuto) {},
        ),
        SizedBox(height: height * (24 / 871)),
        SwitchCard(
          title: "Light",
          imagePath: "assets/images/idea.png",
          onSwitch: (isAuto) {},
        ),
        SizedBox(height: height * (24 / 871)),

        SwitchCard(
          title: "Curtain",
          imagePath: "assets/images/curtainToggle.png",
          onSwitch: (isAuto) {},
        ),
        SizedBox(height: height * (24 / 871)),
        SwitchCard(
          title: "Garage",
          imagePath: "assets/images/garageToggle.png",
          onSwitch: (isAuto) {},
        ),
      ],
    );
  }
}
