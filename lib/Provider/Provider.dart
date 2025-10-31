import 'package:flutter/widgets.dart';

class CurrentSate extends ChangeNotifier{
  bool _fan = true;
  bool get fan_State => _fan;


  bool _Light = true;
  bool get Light_State => _Light;

  bool _Curtain = true;
  bool get Curtain_State => _Curtain;

  bool _Garage = true;
  bool get Garage_State => _Garage;


 void Togglefan(){
    if (_fan == false){ _fan = true;}
    else {_fan = false;}
    notifyListeners();
  } 

  void ToggleLight(){
    if (_Light == false){ _Light = true;}
    else {_Light = false;}
    notifyListeners();
  } 


  void ToggleCurtain(){
    if (_Curtain == false){ _Curtain = true;}
    else {_Curtain = false;}
    notifyListeners();
  } 


  void ToggleGarage(){
    if (_Garage == false){ _Garage = true;}
    else {_Garage = false;}
    notifyListeners();
  } 





}