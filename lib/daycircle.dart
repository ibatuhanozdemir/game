import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:game/buildings/foodbuildings/gatheres_hut.dart';
import 'package:game/buildings/foodbuildings/hunting_cabin.dart';
import 'package:game/buildings/industrybuildings/industy_buildings.dart';
import 'package:game/buildings/industrybuildings/stonecutter.dart';
import 'package:game/buildings/industrybuildings/woodcutter.dart';
import 'package:game/resources/food/food_resources.dart';
import 'package:game/savesystem/save_system.dart';
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
  static String abc='adsf';
  void startTimer() {
    const oneSec = const Duration(seconds: 2);
    notifyListeners();
    Timer.periodic(oneSec, (Timer timer) {
      if (stop == 0) {
        if (daycycle < 5) {
          day++;
          if (day > 3) {


            //Citizen().citizenBirth();
            day = 1;
            mounth++;
            if (mounth > 12) {
              mounth = 1;
              year++;
              Citizen().incrementAge();
            }
          }
          SaveSystem().AllSave();
          GatherersHut().collectResources();
          HuntingCabin().collectResources();
          WoodCutter().collectResources();
          StoneCutter().collectResources();
          FoodResources().calculateFood();
          IndustryBuilding().buildOnGoing();
          Citizen().calculateGlobalHealth();
          Citizen().citizenDeath();
          notifyListeners();
          timer.cancel();
          startTimer();
        }
      } else {
        timer.cancel();
      }
    });
  }

    void stop2(){
        stop=1;
        notifyListeners();
    }


    void numberswitch(int i){
    abc=i.toString();
    notifyListeners();
  }
}
