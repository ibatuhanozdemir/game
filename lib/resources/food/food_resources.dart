import 'dart:math';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:game/worker/citizen.dart';

class FoodResources {
  final _random = new Random();
  int next(min, int max) => min + _random.nextInt(max - min);
  static List food_resources_name = ["food"];
  static List food_resources_count = [
    {"food": 0}
  ];

  static List food_resource_sublist_name = ['mushroom', 'raw meet'];
  static List food_resource_sublist_count = [
    {'mushroom': 0, 'kaysayı': 1},
    {'raw meet': 0, 'kaysayı': 2}
  ];

  int foodConsumptionPerCitizen = 5;
  void calculateFood() {
    food_resources_count[0]['food'] = 0;
    food_resource_sublist_name.forEach((element) {
      int aradeger = food_resource_sublist_count[
              food_resource_sublist_name.indexOf(element)][element] *
          food_resource_sublist_count[
              food_resource_sublist_name.indexOf(element)]['kaysayı'];
      food_resources_count[0]['food'] =
          food_resources_count[0]['food'] + aradeger;
    });

    List yiyici = Citizen.citizen;
    Citizen.citizen.forEach((element) {
      int araDeger = next(0, yiyici.length);
      Citizen.citizen.forEach((element) {
        if(element['id']==yiyici[araDeger]['id']){
          if(food_resources_count[0]['food'] <= foodConsumptionPerCitizen) {
            element['hunger'] = 'yes';
          }else{
            element['hunger'] = 'no';
          }
        }
      });





      //yiyici.removeAt(araDeger);
    });

  }



}
