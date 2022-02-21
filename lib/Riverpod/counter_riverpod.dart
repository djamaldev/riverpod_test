import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterNotifier extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void incrementValue() async {
    _counter++;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', _counter);
  }

  void resetValue() async {
    _counter = 0;
    notifyListeners();
    //final prefs = await SharedPreferences.getInstance();
    //prefs.setInt('counter', _counter);
  }

  Future<int?> getIntValue(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    _counter = myPrefs.getInt(key)!;
    notifyListeners();
    print(_counter);
    return _counter;
  }
}
