import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:game/buildings/foodbuildings/food_buildings.dart';
import 'package:game/buildings/foodbuildings/gatheres_hut.dart';
import 'package:game/buildings/foodbuildings/hunting_cabin.dart';
import 'package:game/buildings/industrybuildings/industy_buildings.dart';

import 'package:game/resources/food/food_resources.dart';
import 'package:game/savesystem/save_system.dart';
import 'package:game/town_services/town_service_building.dart';
import 'package:game/worker/citizen.dart';

class Daycircle extends ChangeNotifier {
  int daycycle = 1;
  int get value1 => day;
  int get value2 => mounth;
  int get value3 => year;
  String get value4 => abc;
  static int day;
  static int mounth;
  static int year;
  static int stop = 0;
  static String abc = 'adsf';
  void startTimer() {
    const oneSec = const Duration(seconds: 2);
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
              Citizen().incrementAge();
            }
          }

          GatherersHut().collectResources();
          HuntingCabin().collectResources();
          IndustryBuilding().collectResource();
          FoodResources().calculateFood();
          FoodBuilding().buildOnGoing();
          IndustryBuilding().buildOnGoing();
          TownServiceBuilding().buildOnGoing();
          Citizen().calculateGlobalHealth();
          Citizen().citizenCapacityCalculator();
          Citizen().citizenBirth();
          Citizen().citizenDeath();
          SaveSystem().AllSave();
          notifyListeners();
          timer.cancel();
          startTimer();
        }
      } else {
        timer.cancel();
      }
    });
  }

  void stop2() {
    stop = 1;
    notifyListeners();
  }
}
