import 'dart:math';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:game/buildings/stroragebuildings/storage_buildings.dart';
import 'package:game/worker/citizen.dart';

class FoodResources {
  final _random = new Random();
  int next(min, int max) => min + _random.nextInt(max - min);
  static int foodCount=0;
  int foodConsumptionPerCitizen = 20;

  static List food_resource_sublist = [
    {'foodname':'mushroom','count': 0, 'katsayı': 1},
    {'foodname':'deer meet','count': 0, 'katsayı': 1},
    {'foodname':'berries','count': 0, 'katsayı': 1},
    {'foodname':'fish','count': 0, 'katsayı': 1},
    {'foodname':'milk','count': 0, 'katsayı': 1},
    {'foodname':'cow meet','count': 0, 'katsayı': 1},
    {'foodname':'sheep meet','count': 0, 'katsayı': 1},
    {'foodname':'chicken meet','count': 0, 'katsayı': 1},
    {'foodname':'egg','count': 0, 'katsayı': 1},
    {'foodname':'apple','count': 0, 'katsayı': 1},
    {'foodname':'orange','count': 0, 'katsayı': 1},
    {'foodname':'corn','count': 0, 'katsayı': 1},
    {'foodname':'potato','count': 0, 'katsayı': 1},
    {'foodname':'tomato','count': 0, 'katsayı': 1},
    {'foodname':'cherry','count': 0, 'katsayı': 1},
    {'foodname':'walnut','count': 0, 'katsayı': 1},
    {'foodname':'orange','count': 0, 'katsayı': 1},


  ];


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
    StorageBuilding.storage_building.where((element) => element['name']=='BARN').toList()[0]['fullness']=foodCount;

  }
}
