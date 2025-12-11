import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:smart_home_app/Provider/Sensors.dart';
import 'package:smart_home_app/screens/Controls_UI/Backend/IP.dart';
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
    final String ip = Provider.of<CurrentIP>(context, listen: false).fanlightip;
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

  static VlcPlayerController? _vlcController;
  static bool _garage_open_state = false;
  static DateTime _last_garage_action = DateTime.now();
  static bool _isGarageProcessing = false;
  static const int _openDurationSeconds = 10;
    
  static const String _aiApiUrl = "https://salma3bdelaleem-principles-car-model.hf.space/gradio_api/call/predict";

  static VlcPlayerController getGarageController() {
  if (_vlcController == null) {
    _vlcController = VlcPlayerController.network(
      "rtsp://username:password@192.168.1.10:554/stream2",
      // CHANGE THIS:
      hwAcc: HwAcc.disabled, // Software decoding is more stable for hidden views
      autoPlay: true, 
      options: VlcPlayerOptions(),
    );
  }
  return _vlcController!;
}


  static Future<void> FanAutoMode({required BuildContext context}) async {
    try {
      print("hhhhhh");
      final url = Uri.parse("http://${Provider.of<Sensors>(context,listen: false).Light}/");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        double temp = data['temp'];
        String fan_state = temp >= 30? "on": "off" ;
        
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


  static Future<void> GarageAutoMode({required BuildContext context}) async {
    if (_isGarageProcessing) return;
    _isGarageProcessing = true;

    try {
      var controller = getGarageController();

      // === NEW DEBUGGING LOGIC ===
      if (controller.value.hasError) {
        // This will tell you if password is wrong or IP is unreachable
        print("!!! RTSP ERROR: ${controller.value.errorDescription}");
      } else if (!controller.value.isInitialized) {
        print(
          "Garage Camera: Connecting... (Is the screen with the widget visible?)",
        );
      }
      // ============================

      if (controller.value.isInitialized) {
        final Uint8List? imageBytes = await controller.takeSnapshot();
        if (imageBytes != null && imageBytes.isNotEmpty) {
          print("Garage Frame Captured.");
          String label = await _predictImage(imageBytes);
          _processGarageLogic(context, label);
        }
      }
    } catch (e) {
      print("Garage Auto Error: $e");
    } finally {
      _isGarageProcessing = false;
    }
  }

  // Helper: Send image to Hugging Face API
  static Future<String> _predictImage(Uint8List imageBytes) async {
    try {
      String base64Image = "data:image/jpeg;base64,${base64Encode(imageBytes)}";
      var response = await http
          .post(
            Uri.parse(_aiApiUrl),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({
              "data": [base64Image],
            }),
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var data = jsonResponse['data'];

        if (data is List && data.isNotEmpty) {
          if (data[0] is String) return data[0];
          if (data[0] is Map) return data[0]['label'] ?? "none";
        }
      }
      return "none";
    } catch (e) {
      print("AI Prediction Failed: $e");
      return "none";
    }
  }

  // Helper: Decision Making
  static void _processGarageLogic(BuildContext context, String rawLabel) {
    String cleanLabel = rawLabel.toLowerCase().trim();

    // Check if it is a car
    bool isActuallyCar = (cleanLabel == "car" || cleanLabel == "cars");
    if (cleanLabel.contains("non")) isActuallyCar = false;

    DateTime now = DateTime.now();

    // CASE 1: Car detected & Garage is Closed -> OPEN IT
    if (isActuallyCar && !_garage_open_state) {
      print("VALID CAR DETECTED: Opening Garage!");

      // Call your ManualControl class
      ManualControl.opengarage(context: context, state: true);

      _garage_open_state = true;
      _last_garage_action = now;
    }
    // CASE 2: Car detected & Garage is Open -> KEEP OPEN (Reset Timer)
    else if (isActuallyCar && _garage_open_state) {
      print("Car still present. Resetting timer.");
      _last_garage_action = now;
    }
    // CASE 3: No Car & Garage is Open & Time Expired -> CLOSE IT
    else if (_garage_open_state &&
        now.difference(_last_garage_action).inSeconds > _openDurationSeconds) {
      print("TIMEOUT: Closing Garage.");

      // Call your ManualControl class
      ManualControl.opengarage(context: context, state: false);

      _garage_open_state = false;
    }
  }

  // Call this when the app closes or the user leaves the automation screen
  static void disposeGarage() {
    _vlcController?.dispose();
    _vlcController = null;
  }

}






