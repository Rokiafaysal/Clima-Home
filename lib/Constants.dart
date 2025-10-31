import 'package:flutter/material.dart';



class Constants {

  final BuildContext context;
  Constants({required this.context});



  double get ScreenWidth  => MediaQuery.of(context).size.width; 
  double get ScreenHeight => MediaQuery.of(context).size.height;





}