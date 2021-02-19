import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:game/daycircle.dart';
import 'package:game/screens/townhall.dart';
import 'package:game/town_services/town_service_building.dart';
import 'package:game/worker/citizen.dart';

import 'buildings/foodbuildings/food_buildings.dart';
import 'buildings/industrybuildings/industy_buildings.dart';
import 'buildings/real_industry_building/real_industry_buildings.dart';
import 'main.dart';

class RandomEvents {
  int month = Daycircle.mounth;
  int evSayisi = TownServiceBuilding.town_service_building[0]['quantity'];

  int toplamHastaneKapasitesi = TownServiceBuilding.town_service_building[3]
          ['quantity'] *
      TownServiceBuilding.town_service_building[3]['capacity'];

  final _random = new Random();
  int next(min, int max) => min + _random.nextInt(max - min);

  eventOccurrence() {
    int prob = next(0, 1001);
    int deciderHot = next(0, 3);
    int deciderCold = next(0, 2);
    if (prob <= 300) {
      if (month > 6 && month <= 9) {
        if (deciderHot == 0) {
          deprem();
        } else if (deciderHot == 1) {
          salgin();
        } else if (deciderHot == 2) {
          yangin();
        }
      } else {
        if (deciderCold == 0) {
          deprem();
        } else if (deciderCold == 1) {
          salgin();
        }
      }
    }
  }

  deprem() {
    TownHall.events.add("Earthquake!");
    double yikilacakEvsayisi = evSayisi < 50 ? evSayisi / 10 : evSayisi / 20;
    int gercekYikimSayisi = yikilacakEvsayisi.toInt();
    TownServiceBuilding.town_service_building[0]['quantity'] =
        TownServiceBuilding.town_service_building[0]['quantity'] -
            gercekYikimSayisi;
    print(evSayisi.toString());
    for (int i = 0; i < gercekYikimSayisi * 3; i++) {
      Citizen.citizen
          .where((element) => element['shelter'] == 'yes')
          .toList()[i]['shelter'] = 'no';
    }
  }

  yangin() {
    TownHall.events.add("Fire");
    //her well 4 tane farm ya da orchard'ı koruyabilir
    int farmSayisi = FoodBuilding.food_building[2]['quantity'];
    int orchardSayisi = FoodBuilding.food_building[3]['quantity'];
    int wellKorumaKapasitesi =
        TownServiceBuilding.town_service_building[4]['quantity'] * 4;

    if (wellKorumaKapasitesi < (farmSayisi + orchardSayisi)) {
      int aciktaKalanlarinSayisi =
          farmSayisi + orchardSayisi - wellKorumaKapasitesi;
      int yanacaklarSayisi = next(0, aciktaKalanlarinSayisi + 1);
      if (yanacaklarSayisi > 0) {
        int farmOrchardDecider = next(2, 4);
        FoodBuilding.food_building[farmOrchardDecider]['quantity'] =
            FoodBuilding.food_building[farmOrchardDecider]['quantity'] -
                yanacaklarSayisi;

        if ((FoodBuilding.food_building[farmOrchardDecider]['quantity'] *
                FoodBuilding.food_building[farmOrchardDecider]['capacity']) <
            FoodBuilding.food_building[farmOrchardDecider]['workercount']) {
          int istenCikarilacaklar = FoodBuilding
                  .food_building[farmOrchardDecider]['workercount'] -
              (FoodBuilding.food_building[farmOrchardDecider]['quantity'] *
                  FoodBuilding.food_building[farmOrchardDecider]['capacity']);
          if (farmOrchardDecider == 2) {
            for (int i = 0; i < istenCikarilacaklar; i++) {
              Citizen.citizen
                  .where((element) => element['workarea'] == 'FARM FIELD')
                  .toList()[i]['workfied'] = 'unemployed';
              Citizen.citizen
                  .where((element) => element['workarea'] == 'FARM FIELD')
                  .toList()[i]['workarea'] = 'unemployed';
            }
          }
          if (farmOrchardDecider == 3) {
            for (int i = 0; i < istenCikarilacaklar; i++) {
              Citizen.citizen
                  .where((element) => element['workarea'] == 'ORCHARD')
                  .toList()[i]['workfied'] = 'unemployed';
              Citizen.citizen
                  .where((element) => element['workarea'] == 'ORCHARD')
                  .toList()[i]['workarea'] = 'unemployed';
            }
          }
        }
      }
    }
  }

  salgin() {
    List deaths = [];
    TownHall.events.add("Contagious disease occurred in town");
    int nufus = Citizen.citizen.length;
    int etkilenenKesim = nufus ~/ 2;
    if (toplamHastaneKapasitesi < etkilenenKesim) {
      int olenler = next(0, (etkilenenKesim - toplamHastaneKapasitesi) + 1);
      if (olenler > 0) {
        for (int i = 0; i < olenler; i++) {
          deaths.add(Citizen.citizen[next(0, Citizen.citizen.length)]);
          print(deaths);
        }
      }
    }
    Citizen.citizen.removeWhere((element) => deaths.contains(element));
    if (nufus - Citizen.citizen.length != 0) {
      int fark = nufus - Citizen.citizen.length;
      for (int i = 0; i < fark; i++) {
        IndustryBuilding.industry_building.forEach((element) {
          if (element['name'] == deaths[i]['workarea']) {
            element['workercount']--;
          }
        });
        RealIndustryBuildings.real_industry_building.forEach((element) {
          if (element['name'] == deaths[i]['workarea']) {
            element['workercount']--;
          }
        });
        TownServiceBuilding.town_service_building.forEach((element) {
          if (element['name'] == deaths[i]['workarea']) {
            element['workercount']--;
          }
        });
        FoodBuilding.food_building.forEach((element) {
          if (element['name'] == deaths[i]['workarea']) {
            element['workercount']--;
            if (deaths[i]['workarea'] == 'FARM FIELD' ||
                deaths[i]['workarea'] == 'ORCHARD') {
              element['workeroutput']
                  .where(
                      (element2) => element2['name'] == deaths[i]['workfield'])
                  .toList()[0]['workercount']--;
            }
          }
        });
      }
    }
    deaths.forEach((element) {
      TownHall.events.add(element['name'] + " Died due to disease");
    });
  }
}
