import 'dart:math';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:game/worker/citizen.dart';

class FoodResources {
  final _random = new Random();
  int next(min, int max) => min + _random.nextInt(max - min);
  static int foodCount=0;


  static List food_resource_sublist = [
    {'foodname':'mushroom','count': 0, 'katsayı': 1},
    {'foodname':'raw meet','count': 0, 'katsayı': 1}
  ];

  int foodConsumptionPerCitizen = 20;
  void calculateFood() {
    // tüketim öncesi toplam yemek hesabı
    foodCount=0;
    food_resource_sublist.forEach((element) {
      int aradeger = element['count'] * element['katsayı'];
      foodCount =foodCount+ aradeger;
    });

    List yiyici = []..addAll(Citizen.citizen);//yemek yiyecekler

    Citizen.citizen.forEach((element) {
      int araDeger = next(0, yiyici.length);
      Citizen.citizen.forEach((element) {
        if (element['id'] == yiyici[araDeger]['id']) {
          if (foodCount <= foodConsumptionPerCitizen) {
            element['hunger'] = 'yes'; // yemek yoksa
            if(element['health']>=10){
              element['health']= element['health']-10;
            }

          } else {
            element['hunger'] = 'no'; // yemek varsa
            //yemeklerden düşüm
            food_resource_sublist[0]['count'] =
                food_resource_sublist[0]['count'] -
                    foodConsumptionPerCitizen;
            food_resource_sublist[1]['count'] =
                food_resource_sublist[1]['count'] -
                    foodConsumptionPerCitizen;
            if(element['health']<=90){
              element['health']= element['health']+10;
            }
            // toplam food hesabı
            foodCount=0;
            food_resource_sublist.forEach((element) {
              int aradeger = element['count'] * element['katsayı'];
              foodCount =foodCount+ aradeger;
            });

          }
        }
      });
      yiyici.removeAt(araDeger);//yiyenler ayrılsın
    });//tüketim fonksiyonu
  }
}
