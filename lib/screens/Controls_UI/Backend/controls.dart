import 'dart:async';
import 'package:http/http.dart' as http;


class ManualControl{

  ManualControl();

  static void openfan({required bool state}) async {
    if (state == true) {
      final uri = Uri.parse("http://192.168.1.4/?fan=on");
      final response = await http.get(uri).timeout(const Duration(seconds: 15));
      print(response.request);
    } 
    else {
      final uri = Uri.parse("http://192.168.1.4/?fan=off");
      final response = await http.get(uri).timeout(const Duration(seconds: 15));
      print(response.request);
    }
  }

  static void openlight({required bool state}) async {
    if (state == true) {
      final uri = Uri.parse("http://192.168.1.4/?light=on");
      final response = await http.get(uri).timeout(const Duration(seconds: 15));
      print(response.request);
    } 
    else {
      final uri = Uri.parse("http://192.168.1.4/?light=off");
      final response = await http.get(uri).timeout(const Duration(seconds: 15));
      print(response.request);
    }
  }


  static void opencurtain({required bool state}) async {
    if (state == true) {
      final uri = Uri.parse("http://192.168.1.3/?curtain=open");
      await http.get(uri).timeout(const Duration(seconds: 15));
  
      await Future.delayed(const Duration(seconds: 1));
      final uri1 = Uri.parse("http://192.168.1.3/?curtain=stop");
      final response1 = await http.get(uri1).timeout(const Duration(seconds: 15));
      print(response1.request);
    } 
    else {
      final uri = Uri.parse("http://192.168.1.3/?curtain=close");
      await http.get(uri).timeout(const Duration(seconds: 15));
      await Future.delayed(const Duration(seconds: 1));
      final uri1 = Uri.parse("http://192.168.1.3/?curtain=stop");
      final response1 = await http.get(uri1).timeout(const Duration(seconds: 15));
      print(response1.request);
    }
  }



  static void opengarage({required bool state}) async {
    if (state == true) {
      final uri = Uri.parse("http://192.168.1.11/openGarage");
      final response = await http.get(uri).timeout(const Duration(seconds: 15));
      print(response.request);
    } 
    else {
      final uri = Uri.parse("http://192.168.1.11/closeGarage");
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
