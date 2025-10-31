import 'package:smart_home_app/screens/onboarding/onboarding3_Page.dart';
import 'package:smart_home_app/screens/onboarding/onboarding2_Page.dart';
import 'package:smart_home_app/screens/onboarding/onboarding1_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget{

  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _Onboarding();
}



class _Onboarding extends State<Onboarding>{

  int _selectedIndex = 0;
  late PageController controller ;
  
  @override
  void initState() {
    controller = PageController(initialPage: _selectedIndex);
    super.initState();
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    final Pages = [
    Onboarding1Page(onPressed: () => onswap(1)),
    Onboarding2Page(onPressed: () => onswap(2)),
    Onboarding3Page()
  ];


     //! ====================================================== PageView ==========================================
    PageView pages_view = PageView(controller: controller,children: Pages,onPageChanged: (value) => setState(() => _selectedIndex = value));
    SmoothPageIndicator pages_widget =  SmoothPageIndicator(controller: controller,count:Pages.length,effect:  SwapEffect(dotHeight: 9,dotWidth: 9,activeDotColor: Color(0xffbbbbf7),dotColor: Color(0xffeaeafd)));    
    //! ====================================================== interface body ==========================================

    Stack controls = Stack(alignment: AlignmentGeometry.center,children: [Positioned.fill(child: pages_view),Positioned(child:pages_widget,bottom: 210)]);
    Container main_body = Container(child: controls);
    return Scaffold(body: main_body);
    
  }


  void onswap(int value) => setState(() {
      _selectedIndex = value;
      controller.animateToPage(_selectedIndex ,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
  });




} 