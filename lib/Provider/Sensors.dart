import 'package:flutter/widgets.dart';


class Sensors extends ChangeNotifier {
  double _Temperature  = 0.0;
  double _humuidity = 0.0;
  double _Light = 0.0;


  double get Temperature => _Temperature;
  double get humuidity => _humuidity;
  double get Light => _Light;



  void updatetemp({required double newTemp}){
    _Temperature = newTemp;
    notifyListeners();
  }

  void updatehum({required double newHumuidity}){
    _humuidity = newHumuidity;
    notifyListeners();
  }

  void updatelight({required double newLight}){
    _Light = newLight;
    notifyListeners();
  }





  

  
}
