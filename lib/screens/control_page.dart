import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart'; // Import this
import 'package:smart_home_app/Constants.dart';
import 'package:smart_home_app/screens/Controls_UI/auto_content.dart';
import 'package:smart_home_app/screens/Controls_UI/manual_content.dart';
import 'package:smart_home_app/widgets/auto_manual_toggle.dart';
import 'package:smart_home_app/screens/Controls_UI/Backend/controls.dart'; // Import your logic class

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

    // ! ==================== Appbar ==================== 
    AppBar auto_appbar = AppBar(
      backgroundColor: const Color(0xffF7F7FB),
      automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
      ),
      title: const Text(
        'Controls',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Color(0xff0E0E1B),
          letterSpacing: -0.6,
        ),
      ),
    );

    // ! ==================== Controls ==================== 
    List<Widget> PageControls = [
      Padding(
          padding: EdgeInsets.only(top: height * (16 / 871)),
          child: AutoManualToggle(onToggle: _onToggle)),
      Expanded(
          child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) => setState(() => isAuto = index == 0),
              children: [
            const AutoContent(), // <--- This is the UI
            ManualContent(onAddPressed: () {})
          ])),
    ];

    Column Pages = Column(
        spacing: height * (30 / 871), children: PageControls);

    // ! ==================== Scaffold with HIDDEN CAMERA ==================== 
    return Scaffold(
      backgroundColor: const Color(0xffEEE8F0),
      appBar: auto_appbar,
      body: Stack(
        children: [
          // 1. Your Normal UI
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * (16 / 390)),
            child: Pages,
          ),

          // 2. THE HIDDEN CAMERA (Required for AutoControl logic to work)
          Positioned(
            left: 0,
            top: 0,
            child: SizedBox(
              width: 1, 
              height: 1, 
              child: Opacity(
                opacity: 0.01, // Invisible but active
                child: VlcPlayer(
                  // We connect this UI widget to your Logic Class here:
                  controller: AutoControl.getGarageController(), 
                  aspectRatio: 16 / 9,
                  placeholder: const SizedBox(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onToggle(bool value) => setState(() {
        isAuto = value;
        _pageController.animateToPage(value ? 0 : 1,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut);
      });
}