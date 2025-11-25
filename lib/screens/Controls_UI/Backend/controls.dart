import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:smart_home_app/screens/Controls_UI/Backend/IP.dart';


class ManualControl{
  final BuildContext context;
  ManualControl({required this.context});

  static void openfan({required BuildContext context,required bool state}) async {
    if (state == true) {
      final uri = Uri.parse("http://${Provider.of<CurrentIP>(context,listen: false).fanlightip}/?fan=on");
      final response = await http.get(uri).timeout(const Duration(seconds: 15));
      print(response.request);
    } 
    else {
      final uri = Uri.parse("http://${Provider.of<CurrentIP>(context,listen: false).fanlightip}/?fan=off");
      final response = await http.get(uri).timeout(const Duration(seconds: 15));
      print(response.request);
    }
  }

  static void openlight({required BuildContext context,required bool state}) async {
    if (state == true) {
      final uri = Uri.parse("http://${Provider.of<CurrentIP>(context,listen: false).fanlightip}/?light=on");
      final response = await http.get(uri).timeout(const Duration(seconds: 15));
      print(response.request);
    } 
    else {
      final uri = Uri.parse("http://${Provider.of<CurrentIP>(context,listen: false).fanlightip}/?light=off");
      final response = await http.get(uri).timeout(const Duration(seconds: 15));
      print(response.request);
    }
  }


  static void opencurtain({required BuildContext context,required bool state}) async {
    if (state == true) {
      final uri = Uri.parse("http://${Provider.of<CurrentIP>(context,listen: false).curtainip}/?curtain=open");
      await http.get(uri).timeout(const Duration(seconds: 15));
  
      await Future.delayed(const Duration(seconds: 1));
      final uri1 = Uri.parse("http://${Provider.of<CurrentIP>(context,listen: false).curtainip}/?curtain=stop");
      final response1 = await http.get(uri1).timeout(const Duration(seconds: 15));
      print(response1.request);
    } 
    else {
      final uri = Uri.parse("http://${Provider.of<CurrentIP>(context,listen: false).curtainip}/?curtain=close");
      await http.get(uri).timeout(const Duration(seconds: 15));
      await Future.delayed(const Duration(seconds: 1));
      final uri1 = Uri.parse("http://${Provider.of<CurrentIP>(context,listen: false).curtainip}/?curtain=stop");
      final response1 = await http.get(uri1).timeout(const Duration(seconds: 15));
      print(response1.request);
    }
  }



  static void opengarage({required BuildContext context,required bool state}) async {
    if (state == true) {
      final uri = Uri.parse("http://${Provider.of<CurrentIP>(context,listen: false).garageip}/openGarage");
      final response = await http.get(uri).timeout(const Duration(seconds: 15));
      print(response.request);
    } 
    else {
      final uri = Uri.parse("http://${Provider.of<CurrentIP>(context,listen: false).garageip}/closeGarage");
      final response = await http.get(uri).timeout(const Duration(seconds: 15));
      print(response.request);
    }
  }

}




class AutoControl {

  static Future<void> FanAutoMode() async {
    print("Fan auto logic...");
  }


  static Future<void> LightAutoMode() async {
    print("Light auto logic...");
  }


  static Future<void> CurtuinAutoMode() async {
    print("Curtuin auto logic...");
  }


  static Future<void> GarageAutoMode() async {
    print("Garage auto logic...");
  }




}
