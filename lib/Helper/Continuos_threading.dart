import 'dart:async';


class AsyncFunction {
  static final Map<String, Timer> _timers = {};
  static final Map<String, bool> _runningStates = {};

  static void startAutoMode({required String device,required bool isAutoMode,required Future<void> Function() task,}) {
    if (isAutoMode) {
      if (_runningStates[device] == true) return;
      _runningStates[device] = true;
      print("Auto mode started for $device");

      _timers[device] = Timer.periodic(const Duration(seconds: 2), (timer) async {
        if (_runningStates[device] != true) {
          timer.cancel();
          print("Auto mode stopped for $device");
          return;
        }
        await task();
      });
      
    } else {
      _runningStates[device] = false;
      _timers[device]?.cancel();
      print("Auto mode disabled manually for $device");
    }
  }
}



class AsyncFunction2 {
  static Timer? _autoTimer;
  static bool _isAutoRunning = false;

  static void startAutoMode({required bool isAutoMode, required Future<void> Function() task}) {
    if (isAutoMode) {
      if (_isAutoRunning) return; 
      _isAutoRunning = true;
      print("Auto mode started");

      _autoTimer = Timer.periodic(const Duration(seconds: 2), (timer) async {
        if (!_isAutoRunning) {
          timer.cancel();
          print("Auto mode stopped");
          return;
        }
        await task();
      });
    } else {
      _isAutoRunning = false;
      _autoTimer?.cancel();
      print("Auto mode disabled manually");
    }
  }

  
}

