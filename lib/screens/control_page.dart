import 'package:flutter/material.dart';
import 'package:smart_home_app/widgets/auto_manual_toggle.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({super.key});

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  @override
  Widget build(BuildContext context) {
      double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return 
     Scaffold(
            backgroundColor: Color(0xffEEE8F0),

      appBar: AppBar( backgroundColor: Color(0xffF7F7FB),
        automaticallyImplyLeading: false,

        elevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        title: Text('Controls', style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.w700,color: Color(0xff0E0E1B), letterSpacing: -0.3),)
      ),


      body: Column(
        children: [


           AutoManualToggle(),
          
        ],
      ),
     );
  }
}