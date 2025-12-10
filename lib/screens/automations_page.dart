import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/widgets/automation_card.dart';
import 'package:smart_home_app/screens/Controls_UI/Backend/Provider.dart';

class AutomationsPage extends StatefulWidget {
  const AutomationsPage({super.key});

  @override
  State<AutomationsPage> createState() => _AutomationsPageState();
}

class _AutomationsPageState extends State<AutomationsPage> {

   
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    //! ================================================================================== Appbar ======================================= 
    AppBar auto_appbar = AppBar(backgroundColor: Color(0xffF7F7FB),automaticallyImplyLeading: false,elevation: 0,centerTitle: true,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12),),),
        title: Text('Automations',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Color(0xff0E0E1B),letterSpacing: -0.6,),),);

    //! ================================================================================== Column Widgets ======================================= 
    List<Widget> AnimationCardsList = [
            AutomationCard(hintText: 'Always active',text: 'If Temp > 30°C \n→ Fan ON',imageName: 'assets/images/fanOn.png',initialAuto: Provider.of<CurrentState>(context).autoFanState,onSwitch: (isAuto) {},),
            AutomationCard(hintText: 'Active when you\'re home',text: 'If the house lights are dim \n→ Light ON',imageName: 'assets/images/Motion.png',onSwitch: (isAuto) {},initialAuto:Provider.of<CurrentState>(context).autoLightState),
            AutomationCard(hintText: 'Always active',text: 'If Rain Detected \n→ Curtain CLOSE',imageName: 'assets/images/rainDetected.png',onSwitch: (isAuto) {},initialAuto: Provider.of<CurrentState>(context).autoCurtainState,),
            AutomationCard(hintText: 'Always active',text: 'If It\'s Sunrise \n→ Curtain OPEN',imageName: 'assets/images/Sunrise.png',onSwitch: (isAuto) {},initialAuto:Provider.of<CurrentState>(context).autoCurtainState ,),
            AutomationCard(hintText: 'Always active',text: 'If Car Detected \n→ Garage OPEN',imageName: 'assets/images/home.png',onSwitch: (isAuto) {},initialAuto: Provider.of<CurrentState>(context).autoGarageState,),
    ];

    
    Column AutomationCards = Column(children:AnimationCardsList,crossAxisAlignment: CrossAxisAlignment.center,spacing:  height * (24 / 871));
    return Scaffold(backgroundColor: Color(0xffEEE8F0),appBar: auto_appbar,body: Padding(child:AutomationCards,padding: EdgeInsets.symmetric(horizontal: width * (16 / 390),vertical: height * (24 / 871))));
  }
}
