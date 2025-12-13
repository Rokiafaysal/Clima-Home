import 'package:flutter/widgets.dart';


class CurrentIP extends ChangeNotifier {
  String _fanlightip = "192.168.1.1";
  String _garageip = "192.168.1.3";

  String get fanlightip => _fanlightip;
  String get garageip => _garageip;

  void ChangeIP({required String fanlightIP,required String curtainIP,required String garageIP}){
    _fanlightip = fanlightIP;
    _garageip = garageIP;

    notifyListeners();
  }
  
}
