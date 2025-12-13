import 'package:flutter/material.dart';
import 'package:smart_home_app/Constants.dart';
import 'package:smart_home_app/screens/Controls_UI/auto_content.dart';
import 'package:smart_home_app/screens/Controls_UI/manual_content.dart';
import 'package:smart_home_app/widgets/auto_manual_toggle.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({super.key});

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  late PageController _pageController;
  bool isAuto = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    double height = Constants(context: context).ScreenHeight;
    double width = Constants(context: context).ScreenWidth;

    //! ================================================================================== Appbar ======================================= 
    AppBar auto_appbar = AppBar(backgroundColor: Color(0xffF7F7FB),automaticallyImplyLeading: false,elevation: 0,centerTitle: true,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12),),),
        title: Text('Controls',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Color(0xff0E0E1B),letterSpacing: -0.6,),),);

    //! ================================================================================== Controls ======================================= 
    List<Widget> PageControls = [
      Padding(padding: EdgeInsets.only(top: height * (16 / 871)),child: AutoManualToggle(onToggle: _onToggle)),
      Expanded(child: PageView(controller: _pageController,physics: const NeverScrollableScrollPhysics(),onPageChanged: (index) =>setState(() => isAuto = index == 0),children: [const AutoContent(),ManualContent(onAddPressed: () {})])),
    ];

    Column Pages =  Column(spacing:height * (30 / 871),children: PageControls);


    //! ================================================================================== Scafold ======================================= 
    return Scaffold(backgroundColor: const Color(0xffEEE8F0),appBar:auto_appbar ,body: Padding(padding: EdgeInsets.symmetric(horizontal: width * (16 / 390)),child: Pages,));
  }



  void _onToggle(bool value) => setState(() {
      isAuto = value;
      _pageController.animateToPage(value ? 0 : 1,duration: const Duration(milliseconds: 400),curve: Curves.easeInOut);
  });
    
}