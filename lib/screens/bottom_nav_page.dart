import 'package:flutter/material.dart';
import 'package:smart_home_app/screens/DashBoard_Page.dart';
import 'package:smart_home_app/screens/automations_page.dart';
import 'package:smart_home_app/screens/control_page.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;

    final List<Widget> pages = [
      DashboardPage(),
      ControlPage(),
      AutomationsPage(),
    ];

    return StatefulBuilder(
      builder: (context, setState) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: pages[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            selectedItemColor: const Color(0xFF6A5AE0),
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined,),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/discontrol.png',
                  width: 24,
                  height: 24,
                ),
                activeIcon: Image.asset(
                  'assets/images/control.png',
                  width: 24,
                  height: 24,
                ),
                label: 'Controls',
              ),

              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/disauto.png',
                  width: 24,
                  height: 24,
                ),
                activeIcon: Image.asset(
                  'assets/images/automation.png',
                  width: 24,
                  height: 24,
                ),
                label: 'Automations',
              ),
            ],
          ),
        );
      },
    );
  }
}
