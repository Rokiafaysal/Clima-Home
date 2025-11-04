import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/Constants.dart';
import 'package:smart_home_app/Provider/Provider.dart';
import 'package:smart_home_app/widgets/switch_card.dart';
import 'package:http/http.dart' as http;

class ManualContent extends StatelessWidget {
  final VoidCallback onAddPressed;

  const ManualContent({super.key, required this.onAddPressed});

  @override
  Widget build(BuildContext context) {
    double height = Constants(context: context).ScreenHeight;
    double width = Constants(context: context).ScreenWidth;

    List<Widget> SwitchCards = [
      Consumer<CurrentSate> (builder: (context, provider, _){
        return SwitchCard(title: "Fan",imagePath: "assets/images/fanToggle.png",initialAuto: !provider.fan_State,
        onSwitch: (bool isAuto) {
          openfan(state: isAuto);
          provider.Togglefan();
          });
      }),

      Consumer<CurrentSate> (builder: (context, provider, _){
      return SwitchCard(title: "Light",imagePath: "assets/images/idea.png",initialAuto:!provider.Light_State ,
      onSwitch: (bool isAuto){
        openlight(state: isAuto);
        provider.ToggleLight();
        }
      
        );
    }),

      Consumer<CurrentSate>(builder: (context, provider, _) {
        return SwitchCard(title: "Curtain",imagePath: "assets/images/curtainToggle.png",initialAuto: !provider.Curtain_State,onSwitch: (bool isAuto) {
          opencurtain(state: isAuto);
          provider.ToggleCurtain();

          });
      }),

      Consumer<CurrentSate>(builder: (context, provider, _) {
        return SwitchCard(title: "Garage",imagePath: "assets/images/garageToggle.png",initialAuto: !provider.Garage_State,
        onSwitch: (bool isAuto)  {
          opengarage(state: isAuto);
          provider.ToggleGarage();
          
          });
      })
    ];

    SizedBox Mic =  SizedBox(width: width*(64/390),height: height*(64/871),
            child: FloatingActionButton(backgroundColor: const Color(0xFFBABAF7),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
            onPressed: onAddPressed,child: const Icon(Icons.mic, color: Colors.white, size: 36,)));

    return Column(children: [...SwitchCards,Align(alignment: Alignment.bottomRight,child: Mic)],crossAxisAlignment: CrossAxisAlignment.start,spacing: height * (24 / 871));
  }



  void openfan({required bool state}) async {
    if (state == true) {
      final uri = Uri.parse("http://192.168.1.4/?fan=on");
      final response = await http.get(uri).timeout(const Duration(seconds: 15));
      print(response.request);
    } else {
      final uri = Uri.parse("http://192.168.1.4/?fan=off");
      final response = await http.get(uri).timeout(const Duration(seconds: 15));
      print(response.request);
    }
  }

  void openlight({required bool state}) async {
    if (state == true) {
      final uri = Uri.parse("http://192.168.1.4/?light=on");
      final response = await http.get(uri).timeout(const Duration(seconds: 15));
      print(response.request);
    } else {
      final uri = Uri.parse("http://192.168.1.4/?light=off");
      final response = await http.get(uri).timeout(const Duration(seconds: 15));
      print(response.request);
    }
  }


  void opencurtain({required bool state}) async {
    if (state == true) {
      final uri = Uri.parse("http://192.168.1.4/?curtain=open");
      final response = await http.get(uri).timeout(const Duration(seconds: 15));
      print(response.request);
    } else {
      final uri = Uri.parse("http://192.168.1.4/?curtain=close");
      final response = await http.get(uri).timeout(const Duration(seconds: 15));
      print(response.request);
    }
  }



  void opengarage({required bool state}) async {
    if (state == true) {
      final uri = Uri.parse("http://192.168.1.11/openGarage");
      final response = await http.get(uri).timeout(const Duration(seconds: 15));
      print(response.request);
    } else {
      final uri = Uri.parse("http://192.168.1.11/closeGarage");
      final response = await http.get(uri).timeout(const Duration(seconds: 15));
      print(response.request);
    }
  }




}
