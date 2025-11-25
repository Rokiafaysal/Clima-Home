import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/screens/Controls_UI/Backend/Provider.dart';
import 'package:smart_home_app/widgets/switch_card.dart';
import 'package:smart_home_app/Constants.dart';

class AutoContent extends StatelessWidget {
  const AutoContent({super.key});

  @override
  Widget build(BuildContext context) {
    double height = Constants(context: context).ScreenHeight;
    
    List<Widget> SwitchCards = [
      Consumer<CurrentState> (builder: (context, provider, _){
        return SwitchCard(title: "Fan",imagePath: "assets/images/fanToggle.png",initialAuto: provider.autoFanState,onSwitch: (isAuto) => provider.toggleFan(context: context,type: "auto"),);
      }),

      Consumer<CurrentState> (builder: (context, provider, _){
      return SwitchCard(title: "Light",imagePath: "assets/images/idea.png",initialAuto:provider.autoLightState ,
      onSwitch: (isAuto) =>provider.toggleLight(context: context,type: "auto")
      );
      }),

      Consumer<CurrentState>(builder: (context, provider, _) {
        return SwitchCard(title: "Curtain",imagePath: "assets/images/curtainToggle.png",initialAuto: provider.autoCurtainState,
        onSwitch: (isAuto) =>provider.toggleCurtain(context: context,type: "auto"));
      }),

      Consumer<CurrentState>(builder: (context, provider, _) {
        return SwitchCard(title: "Garage",imagePath: "assets/images/garageToggle.png",initialAuto: provider.autoGarageState,onSwitch: (isAuto) => provider.toggleGarage(context: context,type: "auto"));
      })
      
      
    ];
    return Column(children: SwitchCards,spacing:height * (24 / 871) ,);
  }
}
