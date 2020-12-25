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
    {'raw meet': 0, 'kaysayı': 1},
  ];

  int foodConsumptionPerCitizen = 20;
  void calculateFood() {
    // tüketim öncesi toplam yemek hesabı
    food_resources_count[0]['food']=0;
    food_resource_sublist_name.forEach((element) {
      int aradeger = food_resource_sublist_count[
              food_resource_sublist_name.indexOf(element)][element] *
          food_resource_sublist_count[
              food_resource_sublist_name.indexOf(element)]['kaysayı'];
      food_resources_count[0]['food'] =food_resources_count[0]['food']+ aradeger;
    });

    List yiyici = []..addAll(Citizen.citizen);//yemek yiyecekler

    Citizen.citizen.forEach((element) {
      int araDeger = next(0, yiyici.length);
      Citizen.citizen.forEach((element) {
        if (element['id'] == yiyici[araDeger]['id']) {
          if (food_resources_count[0]['food'] <= foodConsumptionPerCitizen) {
            element['hunger'] = 'yes'; // yemek yoksa
            if(element['health']>=10){
              element['health']= element['health']-10;
            }

          } else {
            element['hunger'] = 'no'; // yemek varsa
            //yemeklerden düşüm
            food_resource_sublist_count[0]['mushroom'] =
                food_resource_sublist_count[0]['mushroom'] -
                    foodConsumptionPerCitizen;
            food_resource_sublist_count[1]['raw meet'] =
                food_resource_sublist_count[1]['raw meet'] -
                    foodConsumptionPerCitizen;
            if(element['health']<=90){
              element['health']= element['health']+10;
            }
            // toplam food hesabı
            food_resources_count[0]['food']=0;
            food_resource_sublist_name.forEach((element) {
              int aradeger = food_resource_sublist_count[
                      food_resource_sublist_name.indexOf(element)][element] *
                  food_resource_sublist_count[
                      food_resource_sublist_name.indexOf(element)]['kaysayı'];
              food_resources_count[0]['food'] =food_resources_count[0]['food']+ aradeger;
            });

          }
        }
      });
      yiyici.removeAt(araDeger);//yiyenler ayrılsın
    });//tüketim fonksiyonu
  }
}
