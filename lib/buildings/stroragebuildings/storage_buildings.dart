import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:game/resources/industry/industry_resources.dart';
import 'package:game/resources/real_industry/real_industry_resources.dart';
import 'package:game/worker/citizen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageBuilding extends ChangeNotifier {
  static List storage_building = [
    {
      'name': 'BARN',
      'progres': true,
      'buildprogres': 0,
      'quantity': 1,
      'capacity': 1000,
      'capacityperbuilding': 1000,
      'fullness':500,
      'upgradereq': [
        {'name': 'Wood', 'count': 20, 'progres': 0},
        {'name': 'stone', 'count': 50, 'progres': 0},
        {'name': 'labour', 'count': 10, 'progres': 0},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'imagename': 'natural_resources/woodcutter.png',
      'explanation':
      'A camp where workers cut trees to be used in construction and tool making. Wood is required to produce firewood.'
    },
    {
      'name': 'WAREHOUSE',
      'progres': true,
      'buildprogres': 0,
      'quantity': 1,
      'capacity': 1000,
      'capacityperbuilding': 1000,
      'fullness':500,
      'upgradereq': [
        {'name': 'Wood', 'count': 20, 'progres': 0},
        {'name': 'stone', 'count': 50, 'progres': 0},
        {'name': 'labour', 'count': 10, 'progres': 0},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'imagename': 'natural_resources/stone mining.png',
      'explanation':
      'A camp where workers find stones then carves them into useful shapes. Stone is required for almost any construction work.'
    }
  ];

  void buildstart(int index) {
    storage_building[index]['progres'] = false;
    storage_building[index]['buildingprosses1'] =
        storage_building[index]['upgradereq'][0]['name'] + " ";

    notifyListeners();
  }

  void buildOnGoing() {
    storage_building.forEach((element) {
      if (element['progres'] == false) {

        Citizen.citizen
            .where((element2) =>
        (element2['workarea'].contains('builder' + element['name'])))
            .toList()
            .forEach((element5) {
          if (element['progres'] == false) {

            element['buildingprosses1'] = element['upgradereq']
                .where((element2) => (element2['progres'] != element2['count']))
                .toList()[0]['name'];


            if(element['buildingprosses1']=='labour'){
              element['upgradereq']
                  .where(
                      (element2) => (element2['progres'] != element2['count']))
                  .toList()[0]['progres']++;
              element['buildprogres'] = element['buildprogres'] + 1;

            }else{
              if (IndustryResources.industry_resources
                  .where((element3) =>
              element3['name'] == element['buildingprosses1'])
                  .toList()[0]['count'] >
                  1) {
                IndustryResources.industry_resources
                    .where((element3) =>
                (element3['name'] == element['buildingprosses1']))
                    .toList()[0]['count']--;
                element['upgradereq']
                    .where(
                        (element2) => (element2['progres'] != element2['count']))
                    .toList()[0]['progres']++;
                element['buildprogres'] = element['buildprogres'] + 1;
              }}



            if (element['buildprogres'] >= element['totalupgradereq']) {
              element['buildprogres'] = 0;
              element['progres'] = true;
              element['quantity'] = element['quantity'] + 1;
              element['upgradereq'].forEach((element2) {
                element2['progres'] = 0;
              });
              Citizen.citizen
                  .where((element2) => (element2['workarea']
                  .contains('builder' + element['name'])))
                  .toList()
                  .forEach((element3) {
                element3['workarea'] = 'unemployed';
              });
            }
          }
        });
      }
    });
  }

  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('storage_building', jsonEncode(storage_building));
  }

  Future<int> loadStorageBuilding() async {
    final prefs = await SharedPreferences.getInstance();
    final startupNumber = prefs.getString('storage_building');

    if (startupNumber == null) {
      storage_building = storage_building;

      return 0;
    }
    storage_building = jsonDecode(startupNumber);

    return 0;
  }

  void storageCapacity() {
    storage_building.forEach((element) {
      element['capacity'] =
          element['capacityperbuilding'] * element['quantity'];
    });
  }

  void storageWarehouseFullness(){
    storage_building.where((element2) => element2['name']=='WAREHOUSE').toList()[0]['fullness']=0;
    IndustryResources.industry_resources.forEach((element) {
      storage_building.where((element2) => element2['name']=='WAREHOUSE').toList()[0]['fullness']=storage_building.where((element2) => element2['name']=='WAREHOUSE').toList()[0]['fullness']+element['count'];

    });
    RealIndustryResources.real_industry_resources.forEach((element) {
      storage_building.where((element2) => element2['name']=='WAREHOUSE').toList()[0]['fullness']=storage_building.where((element2) => element2['name']=='WAREHOUSE').toList()[0]['fullness']+element['count'];

    });


  }

}
