import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:game/buildings/foodbuildings/gatheres_hut.dart';
import 'package:game/buildings/foodbuildings/hunting_cabin.dart';
import 'package:game/buildings/industrybuildings/stonecutter.dart';
import 'package:game/buildings/industrybuildings/woodcutter.dart';
import 'package:game/resources/food/food_resources.dart';
import 'package:game/savesystem/save_system.dart';

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

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    notifyListeners();
    Timer.periodic(oneSec, (Timer timer) {
      if (stop == 0) {
        if (daycycle < 5) {
          day++;
          if (day > 3) {


            day = 1;
            mounth++;
            if (mounth > 12) {
              mounth = 1;
              year++;
            }
          }
          daycycle = 1;
          SaveSystem().AllSave();
          GatherersHut().collectResources();
          HuntingCabin().collectResources();
          WoodCutter().collectResources();
          StoneCutter().collectResources();
          FoodResources().calculateFood();
          notifyListeners();

          timer.cancel();
          startTimer();
        } else {
          daycycle = daycycle - 1;

          notifyListeners();
        }
      } else {
        timer.cancel();
      }
    });
  }
}
