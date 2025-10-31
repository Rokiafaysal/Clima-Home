import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/Provider/Provider.dart';
import 'package:smart_home_app/widgets/switch_card.dart';
import 'package:smart_home_app/Constants.dart';

class AutoContent extends StatelessWidget {
  const AutoContent({super.key});

  @override
  Widget build(BuildContext context) {
    double height = Constants(context: context).ScreenHeight;
    
    List<Widget> SwitchCards = [
      Consumer<CurrentSate> (builder: (context, provider, _){
        return SwitchCard(title: "Fan",imagePath: "assets/images/fanToggle.png",initialAuto: !provider.fan_State,onSwitch: (isAuto) => provider.Togglefan(),);
      }),

      Consumer<CurrentSate> (builder: (context, provider, _){
      return SwitchCard(title: "Light",imagePath: "assets/images/idea.png",initialAuto:!provider.Light_State ,onSwitch: (isAuto) => provider.ToggleLight());
      }),

      Consumer<CurrentSate>(builder: (context, provider, _) {
        return SwitchCard(title: "Curtain",imagePath: "assets/images/curtainToggle.png",initialAuto: !provider.Curtain_State,onSwitch: (isAuto) =>provider.ToggleCurtain());
      }),

      Consumer<CurrentSate>(builder: (context, provider, _) {
        return SwitchCard(title: "Garage",imagePath: "assets/images/garageToggle.png",initialAuto: !provider.Garage_State,onSwitch: (isAuto) => provider.ToggleGarage());
      })
      
      
    ];
    return Column(children: SwitchCards,spacing:height * (24 / 871) ,);
  }
}
