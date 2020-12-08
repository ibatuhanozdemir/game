import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'package:game/resources.dart';

import 'package:shared_preferences/shared_preferences.dart';

class daycircle extends ChangeNotifier {
  int daycycle = 1;
  int get value1 => day;
  int get value2 => mounth;
  int get value3 => year;
  static int day;
  static int mounth;
  static int year;
  static int stop = 0;
  Future<void> kaydet() async {
    final prefs = await SharedPreferences.getInstance();
    notifyListeners();
    prefs.setInt('day', day);
    prefs.setInt('mounth', mounth);
    prefs.setInt('year', year);
  }

  Future<int> getIntFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final startupNumberday = prefs.getInt('day');
    final startupNumbermounth = prefs.getInt('mounth');
    final startupNumberyear = prefs.getInt('year');
    if (startupNumberday == null) {
      day = 0;
      year = 0;
      mounth = 0;
      return 0;
    }
    day = startupNumberday;
    mounth = startupNumbermounth;
    year = startupNumberyear;
    return 0;
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    notifyListeners();
    Timer.periodic(oneSec, (Timer timer) {
      if (stop == 0) {
        if (daycycle < 1) {
          day++;
          if (day > 2) {
            Resources().saveResources();
            kaydet();
            day = 0;
            mounth++;
            if (mounth > 2) {
              mounth = 0;
              year++;
            }
          }
          daycycle = 1;
          Resources().updateResources();
          notifyListeners();

          timer.cancel();
          startTimer();
        } else {
          daycycle = daycycle - 1;

          notifyListeners();
        }
      }
      else{timer.cancel();}
    });
  }
}
