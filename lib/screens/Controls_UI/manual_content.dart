import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/Constants.dart';
import 'package:smart_home_app/screens/Controls_UI/Backend/Provider.dart';
import 'package:smart_home_app/widgets/switch_card.dart';


class ManualContent extends StatelessWidget {

  final VoidCallback onAddPressed;
  const ManualContent({super.key, required this.onAddPressed});

  @override
  Widget build(BuildContext context) {
    double height = Constants(context: context).ScreenHeight;
    double width = Constants(context: context).ScreenWidth;

    List<Widget> SwitchCards = [
      Consumer<CurrentState> (builder: (context, provider, _){
        return SwitchCard(title: "Fan",imagePath: "assets/images/fanToggle.png",initialAuto: provider.manualFanState,
        onSwitch: (bool isAuto) => provider.toggleFan(context: context,type: "manual"));
      }),

      Consumer<CurrentState> (builder: (context, provider, _){
      return SwitchCard(title: "Light",imagePath: "assets/images/idea.png",initialAuto:provider.manualLightState ,
      onSwitch: (bool isAuto) =>provider.toggleLight(context: context,type: "manual"));
    }),

      Consumer<CurrentState>(builder: (context, provider, _) {
        return SwitchCard(title: "Curtain",imagePath: "assets/images/curtainToggle.png",initialAuto: provider.manualCurtainState,
        onSwitch: (bool isAuto) => provider.toggleCurtain(context: context,type: "manual"));
      }),

      Consumer<CurrentState>(builder: (context, provider, _) {
        return SwitchCard(title: "Garage",imagePath: "assets/images/garageToggle.png",initialAuto: provider.manualGarageState,
        onSwitch:  (bool isAuto)  =>provider.toggleGarage(context: context,type: "manual"));
      })
    ];

    SizedBox Mic =  SizedBox(width: width*(64/390),height: height*(64/871),
            child: FloatingActionButton(backgroundColor: const Color(0xFFBABAF7),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
            onPressed: onAddPressed,child: const Icon(Icons.mic, color: Colors.white, size: 36,)));

    return Column(children: [...SwitchCards,Align(alignment: Alignment.bottomRight,child: Mic)],crossAxisAlignment: CrossAxisAlignment.start,spacing: height * (24 / 871));
  }

}
