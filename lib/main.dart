import 'package:flutter/material.dart';
import 'package:smart_home_app/screens/onboarding/welcome_page.dart';
import 'Provider/Provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  runApp(MultiProvider(providers: [ChangeNotifierProvider(create: (context) => CurrentSate())],child: MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Clima Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Manrope',pageTransitionsTheme: PageTransitionsTheme(builders: {TargetPlatform.android:FadeForwardsPageTransitionsBuilder(backgroundColor: Colors.white)})),
      home:  WelcomePage(),
    );
  }
}


