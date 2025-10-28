import 'package:flutter/material.dart';
import 'package:smart_home_app/screens/bottom_nav_page.dart';
import 'package:smart_home_app/screens/control_page.dart';
import 'package:smart_home_app/screens/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Manrope',
       // scaffoldBackgroundColor: Colors.white
 
      ),
      home:  BottomNavScreen(),
    );
  }
}


