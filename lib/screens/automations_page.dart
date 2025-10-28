import 'package:flutter/material.dart';
import 'package:smart_home_app/widgets/automation_card.dart';

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
    return Scaffold(
      backgroundColor: Color(0xffEEE8F0),

      appBar: AppBar(
        backgroundColor: Color(0xffF7F7FB),
        automaticallyImplyLeading: false,

        elevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        title: Text(
          'Automations',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xff0E0E1B),
            letterSpacing: -0.6,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * (16 / 390),
          vertical: height * (24 / 871),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AutomationCard(
              hintText: 'Active when you\'re home',
              text: 'If Temp > 30°C \n→ Fan ON',
              imageName: 'assets/images/fanOn.png',
              onSwitch: (isAuto) {},
            ),
            SizedBox(height: height * (24 / 871)),

            AutomationCard(
              hintText: 'Active 10 PM to 6 AM',
              text: 'If Motion at Night \n→ Light ON',
              imageName: 'assets/images/Motion.png',
              onSwitch: (isAuto) {},
            ),

            SizedBox(height: height * (24 / 871)),

            AutomationCard(
              hintText: 'Always active',
              text: 'If Rain Detected \n→ Curtain CLOSE',
              imageName: 'assets/images/rainDetected.png',
              onSwitch: (isAuto) {},
            ),
            SizedBox(height: height * (24 / 871)),

            AutomationCard(
              hintText: 'Active 06:30 AM to 09:30 AM',
              text: 'If It\'s Sunrise \n→ Curtain OPEN',
              imageName: 'assets/images/Sunrise.png',
              onSwitch: (isAuto) {},
            ),


              SizedBox(height: height * (24 / 871)),

            AutomationCard(
              hintText: 'Always active',
              text: 'If Away from Home \n→ Garage CLOSE',
              imageName: 'assets/images/home.png',
              onSwitch: (isAuto) {},
            ),
          ],
        ),
      ),
    );
  }
}
