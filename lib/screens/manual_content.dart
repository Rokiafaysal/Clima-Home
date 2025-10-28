import 'package:flutter/material.dart';
import 'package:smart_home_app/widgets/switch_card.dart';

class ManualContent extends StatelessWidget {
  final VoidCallback onAddPressed;

  const ManualContent({super.key, required this.onAddPressed});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchCard(
              title: "Fan",
              imagePath: "assets/images/fanToggle.png",
              onSwitch: (isAuto) {
              },
            ),
            SizedBox(height: height * (24/871)),
            SwitchCard(
              title: "Light",
              imagePath: "assets/images/idea.png",
              onSwitch: (isAuto) {
              },
            ),
            SizedBox(height: height * (24/871)),

            SwitchCard(
              title: "Curtain",
              imagePath: "assets/images/curtainToggle.png",
              onSwitch: (isAuto) {
              },
            ),
            SizedBox(height: height * (24/871)),
            SwitchCard(
              title: "Garage",
              imagePath: "assets/images/garageToggle.png",
              onSwitch: (isAuto) {
              },
            ),
          ],
        ),
            SizedBox(height: height * (60/871)),

        Align(
          alignment: Alignment.bottomRight,
          child: SizedBox(
            width: width*(64/390),
            height: height*(64/871),
            child: FloatingActionButton(
              backgroundColor: const Color(0xFFBABAF7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(999),
              ),
              onPressed: onAddPressed,
              child: const Icon(Icons.mic, color: Colors.white, size: 36,),
            ),
          ),
        ),
      ],
    );
  }
}
