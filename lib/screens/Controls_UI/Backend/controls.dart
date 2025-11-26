import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:smart_home_app/Provider/Sensors.dart';
import 'package:smart_home_app/screens/Controls_UI/Backend/IP.dart';
import 'dart:convert';
import 'dart:io';
import 'package:smart_home_app/widgets/CoustomWidget.dart';



class ManualControl{
  final BuildContext context;
  ManualControl({required this.context});

  

  static void openfan({required BuildContext context, required bool state}) async {
    try {
      final String ip = Provider.of<CurrentIP>(context, listen: false).fanlightip;
      String command = state ? "on" : "off";
      final uri = Uri.parse("http://$ip/?fan=$command");    
      final response = await http.get(uri).timeout(const Duration(seconds: 15));
      print("Fan $command request sent: ${response.request}");
    } 
    on SocketException catch (_) {if (context.mounted) {Customwidgets.showCustomSnackBar(context: context, message: "Failed to connect! Check Fan WiFi/IP.", isError: true);}} 
    on TimeoutException catch (_) {if (context.mounted) {Customwidgets.showCustomSnackBar(context: context, message: "Fan connection Timed Out!", isError: true);}}
    catch (e) {if (context.mounted) {Customwidgets.showCustomSnackBar(context: context, message: "Error controlling Fan!", isError: true);}}
  }

  static void openlight({required BuildContext context, required bool state}) async {
  try {
    final String ip = Provider.of<CurrentIP>(context, listen: false).fanlightip;
    String command = state ? "on" : "off";
    final uri = Uri.parse("http://$ip/?light=$command");
    final response = await http.get(uri).timeout(const Duration(seconds: 15));
    print("Light $command request sent: ${response.request}");
  } 
    
    on SocketException catch (_) {if (context.mounted) {Customwidgets.showCustomSnackBar(context: context, message: "Failed to connect! Check Light WiFi/IP.", isError: true);}} 
    on TimeoutException catch (_) {if (context.mounted) {Customwidgets.showCustomSnackBar(context: context, message: "Light connection Timed Out!", isError: true);}}
    catch (e) {if (context.mounted) {Customwidgets.showCustomSnackBar(context: context, message: "Error controlling Light!", isError: true);}}
  }

  static void opencurtain({required BuildContext context, required bool state}) async {
  try {
    final String ip = Provider.of<CurrentIP>(context, listen: false).curtainip;
    final String baseUrl = "http://$ip";
    String command = state ? "open" : "close";
    final moveUri = Uri.parse("$baseUrl/?curtain=$command");
    await http.get(moveUri).timeout(const Duration(seconds: 15));
    await Future.delayed(const Duration(seconds: 1));
    final stopUri = Uri.parse("$baseUrl/?curtain=stop");
    final responseStop = await http.get(stopUri).timeout(const Duration(seconds: 15));
    print("Curtain stopped. Response: ${responseStop.request}");
  } 
  
  on SocketException catch (_) {if (context.mounted) {Customwidgets.showCustomSnackBar(context: context, message: "Failed to connect! Check Curtain WiFi/IP.", isError: true);}} 
  on TimeoutException catch (_) {if (context.mounted) {Customwidgets.showCustomSnackBar(context: context, message: "Curtain connection Timed Out!", isError: true);}}
  catch (e) {if (context.mounted) {Customwidgets.showCustomSnackBar(context: context, message: "Error controlling Curtain!", isError: true);}}
}



  static void opengarage({required BuildContext context, required bool state}) async {
  try {
    final String ip = Provider.of<CurrentIP>(context, listen: false).garageip;
    String command = state ? "openGarage" : "closeGarage";
    final uri = Uri.parse("http://$ip/$command");
    final response = await http.get(uri).timeout(const Duration(seconds: 15));
    print("Garage request sent: ${response.request}");
  } 
  
  on SocketException catch (_) {if (context.mounted) {Customwidgets.showCustomSnackBar(context: context, message: "Failed to connect! Check Garage WiFi/IP.", isError: true);}} 
  on TimeoutException catch (_) {if (context.mounted) {Customwidgets.showCustomSnackBar(context: context, message: "Garage connection Timed Out!", isError: true);}}
  catch (e) {if (context.mounted) {Customwidgets.showCustomSnackBar(context: context, message: "Error controlling Garage!", isError: true);}}}

}




class AutoControl {

  AutoControl();

  static var prev_fan_state = null;
  static var prev_curtain_state = null;
  static var prev_light_state = null;


  static Future<void> FanAutoMode({required BuildContext context}) async {
    try {
      print("hhhhhh");
      final url = Uri.parse("http://${Provider.of<Sensors>(context,listen: false).Light}/");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        double temp = data['temp'];
        String fan_state = temp >= 29? "on": "off" ;
        
      if(fan_state!= prev_curtain_state){
        final url = Uri.parse("http://${Provider.of<Sensors>(context).Light}/?fan=${fan_state}");
        await http.get(url);
        prev_fan_state = fan_state;
        }
         
      } 
      else {
        Customwidgets.showCustomSnackBar(context: context, message: "Check Your Internet Connection!",isError: true);
      }
    } 
    on SocketException catch (_) {if (context.mounted) {Customwidgets.showCustomSnackBar(context: context, message: "Failed to connect! Check WiFi or ESP IP.", isError: true);}}
    on TimeoutException catch (_) {if (context.mounted) {Customwidgets.showCustomSnackBar(context: context, message: "Connection Timed Out!", isError: true);}}
    catch (e) {Customwidgets.showCustomSnackBar(context: context, message: "Something wrong in ESP!",isError: true);}
  }
    

  


  static Future<void> LightAutoMode({required BuildContext context}) async {
     try {

      final url = Uri.parse("http://${Provider.of<Sensors>(context).Light}/");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        double ldr = data['ldr'];
        double motion = data['motion'];
        String light_state = ldr <= 5000 && motion == 1? "on":"off" ;

      if(light_state != prev_light_state){
        final url = Uri.parse("http://${Provider.of<Sensors>(context).Light}/?light=${light_state}");
        await http.get(url);
        prev_light_state = light_state;

        }
         
      } 
      else {
        Customwidgets.showCustomSnackBar(context: context, message: "Check Your Internet Connection!",isError: true);
      }
    } 
    on SocketException catch (_) {if (context.mounted) {Customwidgets.showCustomSnackBar(context: context, message: "Failed to connect! Check WiFi or ESP IP.", isError: true);}}
    on TimeoutException catch (_) {if (context.mounted) {Customwidgets.showCustomSnackBar(context: context, message: "Connection Timed Out!", isError: true);}}
    catch (e) {Customwidgets.showCustomSnackBar(context: context, message: "Something wrong in ESP!",isError: true);}
  }


  static Future<void> CurtuinAutoMode({required BuildContext context}) async {
     try {

      final url = Uri.parse("http://${Provider.of<Sensors>(context).Light}/");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        double ldr = data['ldr'];
        String curtain_state = ldr >= 2500? "open":"close";
      if(curtain_state != prev_curtain_state){
        final url = Uri.parse("http://${Provider.of<Sensors>(context).Light}/?curtain=${curtain_state}");
        await http.get(url);
        prev_curtain_state = curtain_state;
        }
      } 
      else {
        Customwidgets.showCustomSnackBar(context: context, message: "Check Your Internet Connection!",isError: true);
      }
    } 
    on SocketException catch (_) {if (context.mounted) {Customwidgets.showCustomSnackBar(context: context, message: "Failed to connect! Check WiFi or ESP IP.", isError: true);}}
    on TimeoutException catch (_) {if (context.mounted) {Customwidgets.showCustomSnackBar(context: context, message: "Connection Timed Out!", isError: true);}}
    catch (e) {Customwidgets.showCustomSnackBar(context: context, message: "Something wrong in ESP!",isError: true);}
  }


  static Future<void> GarageAutoMode() async {
    print("Garage auto logic...");
  }




}

