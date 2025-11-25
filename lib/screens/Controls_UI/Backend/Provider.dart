import 'package:flutter/widgets.dart';
import 'package:smart_home_app/Helper/Continuos_threading.dart';
import 'package:smart_home_app/screens/Controls_UI/Backend/controls.dart';
// import 'package:smart_home_app/screens/Controls_UI/Backend/controls.dart';

class CurrentState extends ChangeNotifier {
  bool _manualFan = false;
  bool _autoFan = false;
  bool get manualFanState => _manualFan;
  bool get autoFanState => _autoFan;

  bool _manualLight = false;
  bool _autoLight = false;
  bool get manualLightState => _manualLight;
  bool get autoLightState => _autoLight;

  bool _manualCurtain = false;
  bool _autoCurtain = false;
  bool get manualCurtainState => _manualCurtain;
  bool get autoCurtainState => _autoCurtain;

  bool _manualGarage = false;
  bool _autoGarage = false;
  bool get manualGarageState => _manualGarage;
  bool get autoGarageState => _autoGarage;


  void toggleFan({required BuildContext context,required String type}) {
    if (type == "auto") {
      _autoFan = !_autoFan;
      _manualFan = false; 
      ManualControl.openfan(context: context,state: _manualFan);
      // openfan(state: _manualFan);
      AsyncFunction.startAutoMode(device: "fan",isAutoMode: _autoFan, task: () async {await AutoControl.FanAutoMode();});
    } 
    else if (type == "manual") {
      _manualFan = !_manualFan;
      _autoFan = false;
      ManualControl.openfan(context: context,state: _manualFan);
      // openfan(state: _manualFan);
      AsyncFunction.startAutoMode(device: "fan",isAutoMode: _autoFan, task: () async {await AutoControl.FanAutoMode();});

    }
    notifyListeners();
  }

  void toggleLight({required BuildContext context,required String type}) {
    if (type == "auto") {
      _autoLight = !_autoLight;
      _manualLight = false;
      ManualControl.openlight(context: context,state: _autoLight);
      // openlight(state: _autoLight);
      AsyncFunction.startAutoMode(device: "light",isAutoMode: _autoLight, task: () async{await AutoControl.LightAutoMode();});
    } 
    else if (type == "manual") {
      _manualLight = !_manualLight;
      _autoLight = false;
      ManualControl.openlight(context: context,state: _autoLight);
      // openlight(state: _autoLight);
      AsyncFunction.startAutoMode(device: "light",isAutoMode: _autoLight, task: () async{await AutoControl.LightAutoMode();});
    }
    notifyListeners();
  }

  void toggleCurtain({required BuildContext context,required String type}) {
  if (type == "auto") {
    _autoCurtain = !_autoCurtain;
    _manualCurtain = false;
    // opencurtain(state: _manualCurtain);
    ManualControl.opencurtain(context: context,state: _manualCurtain);
    AsyncFunction.startAutoMode(device: "curtain",isAutoMode: _autoCurtain,task: () async{ await AutoControl.CurtuinAutoMode();});
  } 
  else if (type == "manual") {
    _manualCurtain = !_manualCurtain;
    _autoCurtain = false;
    // opencurtain(state: _manualCurtain);
    ManualControl.opencurtain(context: context,state: _manualCurtain);
    AsyncFunction.startAutoMode(device: "curtain",isAutoMode: _autoCurtain,task: () async{ await AutoControl.CurtuinAutoMode();});
  }

  notifyListeners();
}


  void toggleGarage({required BuildContext context,required String type}) {
    if (type == "auto") {
      _autoGarage = !_autoGarage;
      _manualGarage = false;
      ManualControl.opengarage(context: context,state: _manualGarage);
      // opengarage(state: _manualGarage);
      AsyncFunction.startAutoMode(device: "garage",isAutoMode: _autoGarage, task: ()async{await AutoControl.GarageAutoMode() ;});
    } 
    else if (type == "manual") {
      _manualGarage = !_manualGarage;
      _autoGarage = false;
      ManualControl.opengarage(context: context,state: _manualGarage);
      // opengarage(state: _manualGarage);
      AsyncFunction.startAutoMode(device: "garage",isAutoMode: _autoGarage, task: ()async{await AutoControl.GarageAutoMode() ;});
    }
    notifyListeners();
  }
}




  void openfan({required bool state}) async {
    if (state == true) {
      print("fan is activitead");
    } else {
      print("fan is not activitead");

    }
  }

  void openlight({required bool state}) async {
    if (state == true) {
      print("light is activitead");
    } else {
      print("light is not activitead");

    }
  }


  void opencurtain({required bool state}) async {
    if (state == true) {
      print("curtain is activitead");
    } else {
      print("curtain is not activitead");

    }
  }



  void opengarage({required bool state}) async {
    if (state == true) {
      print("garage is activitead");
    } else {
      print("garage is not activitead");

    }
  }
