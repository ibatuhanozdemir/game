import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:game/buildings/stroragebuildings/storage_buildings.dart';
import 'package:game/resources/food/food_resources.dart';
import 'package:game/resources/industry/industry_resources.dart';
import 'package:game/worker/citizen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodBuilding extends ChangeNotifier {
  static List food_building = [
    {
      'name': 'GATHERER\'S HUT',
      'progres': true,
      'harvest': false,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'capacityperbuilding': 2,
      'workercount': 0,
      'workeroutput': [
        {'name': 'mushroom', 'output': 3, 'lastdayoutput': 0, 'type': 'food'},
        {'name': 'berries', 'output': 2, 'lastdayoutput': 0, 'type': 'food'}
      ],
      'upgradereq': [
        {'name': 'Wood', 'count': 20, 'progres': 0},
        {'name': 'stone', 'count': 50, 'progres': 0},
        {'name': 'labour', 'count': 10, 'progres': 0},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename': 'food_buildings/gatherer hut.png',
      'explanation' : 'The workers of this building go out in nature and pick whatever food they can find. '
    },
    {
      'name': 'HUNTER\'S CABIN',
      'progres': true,
      'harvest': false,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'capacityperbuilding': 2,
      'workercount': 0,
      'workeroutput': [
        {'name': 'deer meet', 'output': 3, 'lastdayoutput': 0, 'type': 'food'},
        {'name': 'leather', 'output': 2, 'lastdayoutput': 0, 'type': 'industry'}
      ],
      'upgradereq': [
        {'name': 'Wood', 'count': 20, 'progres': 0},
        {'name': 'stone', 'count': 50, 'progres': 0},
        {'name': 'labour', 'count': 10, 'progres': 0},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename': 'food_buildings/HuntingCabin.png',
      'explanation' : 'Workers of this place are responsible for hunting. They will hunt deer. The output of this place is raw meat and leather.'
    },
    {
      'name': 'FARM FIELD',
      'progres': true,
      'harvest': true,
      'buildprogres': 0,
      'quantity': 1,
      'capacity': 2,
      'capacityperbuilding': 2,
      'workercount': 0,
      'workeroutput': [
        {
          'name': 'wheat',
          'workeroutput': 5,
          'output': 3,
          'workercount': 0,
          'lastdayoutput': 0,
          'type': 'industry',
          'outputprogress': 0,
          'totaloutputprogress': 10,
          'estimatedoutput': 0,
          'imagename': 'food_buildings/wheat.png',
        },
        {
          'name': 'corn',
          'workeroutput': 5,
          'output': 2,
          'workercount': 0,
          'lastdayoutput': 0,
          'type': 'food',
          'outputprogress': 0,
          'totaloutputprogress': 10,
          'estimatedoutput': 0,
          'imagename': 'food_buildings/corn.png',
        },
        {
          'name': 'potato',
          'workeroutput': 5,
          'output': 2,
          'workercount': 0,
          'lastdayoutput': 0,
          'type': 'food',
          'outputprogress': 0,
          'totaloutputprogress': 10,
          'estimatedoutput': 0,
          'imagename': 'food_buildings/potato.png',
        },
        {
          'name': 'tomato',
          'workeroutput': 5,
          'output': 2,
          'workercount': 0,
          'lastdayoutput': 0,
          'type': 'food',
          'outputprogress': 0,
          'totaloutputprogress': 10,
          'estimatedoutput': 0,
          'imagename': 'food_buildings/tomatofarm.png',
        },
      ],
      'upgradereq': [
        {'name': 'Wood', 'count': 20, 'progres': 0},
        {'name': 'stone', 'count': 50, 'progres': 0},
        {'name': 'labour', 'count': 10, 'progres': 0},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename': 'food_buildings/farm.png',
      'explanation' : 'To provide nutritional richness you need farm fields. You need explorers to find seeds first. When they find those seeds you can plant and harvest them when ready.'
    },
    {
      'name': 'ORCHARD',
      'progres': true,
      'harvest': true,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'capacityperbuilding': 2,
      'workercount': 0,
      'workeroutput': [
        {
          'name': 'apple',
          'workeroutput': 5,
          'output': 3,
          'workercount': 0,
          'lastdayoutput': 0,
          'type': 'food',
          'outputprogress': 0,
          'totaloutputprogress': 10,
          'estimatedoutput': 0,
          'imagename': 'food_buildings/apple.png',
        },
        {
          'name': 'cherry',
          'workeroutput': 5,
          'output': 2,
          'workercount': 0,
          'lastdayoutput': 0,
          'type': 'food',
          'outputprogress': 0,
          'totaloutputprogress': 10,
          'estimatedoutput': 0,
          'imagename': 'food_buildings/cherry.png',
        },
        {
          'name': 'walnut',
          'workeroutput': 5,
          'output': 2,
          'workercount': 0,
          'lastdayoutput': 0,
          'type': 'food',
          'outputprogress': 0,
          'totaloutputprogress': 10,
          'estimatedoutput': 0,
          'imagename': 'food_buildings/walnut.png',
        },
        {
          'name': 'orange',
          'workeroutput': 5,
          'output': 2,
          'workercount': 0,
          'lastdayoutput': 0,
          'type': 'food',
          'outputprogress': 0,
          'totaloutputprogress': 10,
          'estimatedoutput': 0,
          'imagename': 'food_buildings/orange.png',
        },
      ],
      'upgradereq': [
        {'name': 'Wood', 'count': 20, 'progres': 0},
        {'name': 'stone', 'count': 50, 'progres': 0},
        {'name': 'labour', 'count': 10, 'progres': 0},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename': 'food_buildings/orchard.png',
      'explanation' : 'To provide nutritional richness you need orchards. You need explorers to find seeds first. When they find those seeds you can plant and harvest them when ready. '
    },
    {
      'name': 'FISHING DOCK',
      'progres': true,
      'harvest': false,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'capacityperbuilding': 2,
      'workercount': 0,
      'workeroutput': [
        {'name': 'fish', 'output': 5, 'lastdayoutput': 0, 'type': 'food'}
      ],
      'upgradereq': [
        {'name': 'Wood', 'count': 20, 'progres': 0},
        {'name': 'stone', 'count': 50, 'progres': 0},
        {'name': 'labour', 'count': 10, 'progres': 0},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename': 'food_buildings/fishingson.png',
      'explanation' : 'Must be built to get fish. It is recommended to build some fishing dock to increase the nutritional richness in the early game.'

    },
    {
      'name': 'DAIRY FARM',
      'progres': true,
      'harvest': false,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'capacityperbuilding': 2,
      'workercount': 0,
      'workeroutput': [
        {'name': 'cow meet', 'output': 3, 'lastdayoutput': 0, 'type': 'food'},
        {'name': 'milk', 'output': 2, 'lastdayoutput': 0, 'type': 'food'}
      ],
      'upgradereq': [
        {'name': 'Wood', 'count': 20, 'progres': 0},
        {'name': 'stone', 'count': 50, 'progres': 0},
        {'name': 'labour', 'count': 10, 'progres': 0},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename': 'food_buildings/pastorEXPAND.png',
      'explanation' : 'The output of this place is milk and raw meat. You need explorers to bring cows from unknown areas first.'

    },
    {
      'name': 'SHEEP FARM',
      'progres': true,
      'harvest': false,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'capacityperbuilding': 2,
      'workercount': 0,
      'workeroutput': [
        {'name': 'sheep meet', 'output': 3, 'lastdayoutput': 0, 'type': 'food'},
        {'name': 'wool', 'output': 2, 'lastdayoutput': 0, 'type': 'industry'}
      ],
      'upgradereq': [
        {'name': 'Wood', 'count': 20, 'progres': 0},
        {'name': 'stone', 'count': 50, 'progres': 0},
        {'name': 'labour', 'count': 10, 'progres': 0},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename': 'food_buildings/koyun.png',
      'explanation' : 'The output of this place is wool and raw meat. You need explorers to bring sheep from unknown areas first.'
    },
    {
      'name': 'COOP',
      'progres': true,
      'harvest': false,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'capacityperbuilding': 2,
      'workercount': 0,
      'workeroutput': [
        {
          'name': 'chicken meet',
          'output': 3,
          'lastdayoutput': 0,
          'type': 'food'
        },
        {'name': 'egg', 'output': 2, 'lastdayoutput': 0, 'type': 'food'}
      ],
      'upgradereq': [
        {'name': 'Wood', 'count': 20, 'progres': 0},
        {'name': 'stone', 'count': 50, 'progres': 0},
        {'name': 'labour', 'count': 10, 'progres': 0},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename': 'food_buildings/coop.png',
      'explanation' : 'The output of this place is eggs and raw meat. You need explorers to bring chicken from unknown areas first.'
    }
  ];
//sefgdsfg
  void buildstart(int index) {
    food_building[index]['progres'] = false;
    food_building[index]['buildingprosses1'] =
        food_building[index]['upgradereq'][0]['name'] + " ";

    notifyListeners();
  }

  void buildOnGoing() {
    food_building.forEach((element) {
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

    prefs.setString('food_building', jsonEncode(food_building));
  }

  Future<int> loadFoodBuilding() async {
    final prefs = await SharedPreferences.getInstance();
    final startupNumber = prefs.getString('food_building');

    if (startupNumber == null) {
      food_building = food_building;

      return 0;
    }
    food_building = jsonDecode(startupNumber);

    return 0;
  }

  void collectResource() {
    food_building.forEach((element) {
      double totalWorkerEfficiency = 0;
      if (element['workercount'] >= 1) {
        Citizen.citizen
            .where((element2) => element2['workarea'] == element['name'])
            .toList()
            .forEach((element3) {
          totalWorkerEfficiency = totalWorkerEfficiency + element3['overallef'];
        });

        if (element['harvest'] == false) {
          element['workeroutput'].forEach((element4) {
            int a =
                (element4['output'] * (totalWorkerEfficiency) / 100).round();
            if (element4['type'] == 'food') {
              element4['lastdayoutput'] = 'STORAGE FULL';
              if(StorageBuilding.storage_building.where((element11) => element11['name']=='BARN').toList()[0]['fullness']<StorageBuilding.storage_building.where((element11) => element11['name']=='BARN').toList()[0]['capacity']){

                FoodResources.food_resource_sublist
                    .where((element5) => element5['foodname'] == element4['name'])
                    .toList()[0]['count'] = FoodResources.food_resource_sublist
                    .where((element5) =>
                element5['foodname'] == element4['name'])
                    .toList()[0]['count'] +
                    a;
                element4['lastdayoutput'] = a;
              }

            } else {
              element4['lastdayoutput'] = 'STORAGE FULL';
              if(StorageBuilding.storage_building.where((element11) => element11['name']=='WAREHOUSE').toList()[0]['fullness']<StorageBuilding.storage_building.where((element11) => element11['name']=='WAREHOUSE').toList()[0]['capacity']) {
                IndustryResources.industry_resources
                    .where((element5) => element5['name'] == element4['name'])
                    .toList()[0]['count'] = IndustryResources.industry_resources
                    .where((element5) => element5['name'] == element4['name'])
                    .toList()[0]['count'] +
                    a;
                element4['lastdayoutput'] = a;
              }
            }
          });
        } else {
          element['workeroutput'].forEach((element6) {
            double totalWorkerEfficiency = 0;
            if (element6['workercount'] >= 1) {
              Citizen.citizen
                  .where(
                      (element10) => element10['workarea'] == element['name'])
                  .toList()
                  .where(
                      (element7) => element7['workfield'] == element6['name'])
                  .toList()
                  .forEach((element8) {
                totalWorkerEfficiency =
                    totalWorkerEfficiency + element8['overallef'];
              });

              if (element6['outputprogress'] <
                  element6['totaloutputprogress']) {
                int a =
                    (element6['workeroutput'] * (totalWorkerEfficiency) / 100)
                        .round();
                element6['estimatedoutput'] = element6['estimatedoutput'] + a;
                element6['outputprogress'] = element6['outputprogress'] + 1;
              } else {
                element6['outputprogress'] = 0;
                int a =
                    (element6['workeroutput'] * (totalWorkerEfficiency) / 100)
                        .round();
                element6['estimatedoutput'] = element6['estimatedoutput'] + a;
                element6['lastdayoutput'] = 'STORAGE FULL';
                if (element6['type'] == 'food') {
                  if(StorageBuilding.storage_building.where((element11) => element11['name']=='BARN').toList()[0]['fullness']<StorageBuilding.storage_building.where((element11) => element11['name']=='BARN').toList()[0]['capacity']) {
                    FoodResources.food_resource_sublist
                        .where((element12) =>
                    element12['foodname'] == element6['name'])
                        .toList()[0]['count'] = FoodResources
                        .food_resource_sublist
                        .where((element12) =>
                    element12['foodname'] == element6['name'])
                        .toList()[0]['count'] +
                        element6['estimatedoutput'];
                    element6['lastdayoutput'] = element6['estimatedoutput'];
                  }} else {

                  if(StorageBuilding.storage_building.where((element11) => element11['name']=='WAREHOUSE').toList()[0]['fullness']<StorageBuilding.storage_building.where((element11) => element11['name']=='WAREHOUSE').toList()[0]['capacity']) {
                    IndustryResources.industry_resources
                        .where(
                            (element12) =>
                        element12['name'] == element6['name'])
                        .toList()[0]['count'] = IndustryResources
                        .industry_resources
                        .where((element12) =>
                    element12['name'] == element6['name'])
                        .toList()[0]['count'] +
                        element6['estimatedoutput'];
                    element6['lastdayoutput'] = element6['estimatedoutput'];
                  } }


                element6['estimatedoutput'] = 0;
              }
            }
          });
        }
      }
    });
  }

  void workerCapacity() {
    food_building.forEach((element) {
      element['capacity'] =
          element['capacityperbuilding'] * element['quantity'];
    });
  }

  void farmfieldWorkerAdd(String food_building_name, String field_name) {
    int total_fields_worker_count = 0;
    if (food_building_name == 'FARM FIELD') {
      food_building[2]['workeroutput'].forEach((element) {
        total_fields_worker_count =
            total_fields_worker_count + element['workercount'];
      });
      if (food_building[2]['workercount'] > total_fields_worker_count) {
        food_building[2]['workeroutput']
            .where((element2) => element2['name'] == field_name)
            .toList()[0]['workercount'] = food_building[2]['workeroutput']
                .where((element2) => element2['name'] == field_name)
                .toList()[0]['workercount'] +
            1;
        Citizen.citizen
            .where((element3) => element3['workarea'] == food_building_name)
            .toList()
            .where((element4) => element4['workfield'] == 'unemployed')
            .toList()[0]['workfield'] = field_name;
      }
    } else {
      food_building[3]['workeroutput'].forEach((element) {
        total_fields_worker_count =
            total_fields_worker_count + element['workercount'];
      });
      if (food_building[3]['workercount'] > total_fields_worker_count) {
        food_building[3]['workeroutput']
            .where((element2) => element2['name'] == field_name)
            .toList()[0]['workercount'] = food_building[3]['workeroutput']
                .where((element2) => element2['name'] == field_name)
                .toList()[0]['workercount'] +
            1;
        Citizen.citizen
            .where((element3) => element3['workarea'] == food_building_name)
            .toList()
            .where((element4) => element4['workfield'] == 'unemployed')
            .toList()[0]['workfield'] = field_name;
      }
    }
    notifyListeners();
  }

  void farmfieldWorkerRemove(String food_building_name, String field_name) {
    if (food_building_name == 'FARM FIELD') {
      if (food_building[2]['workeroutput']
              .where((element10) => element10['name'] == field_name)
              .toList()[0]['workercount'] >
          0) {
        food_building[2]['workeroutput']
            .where((element2) => element2['name'] == field_name)
            .toList()[0]['workercount'] = food_building[2]['workeroutput']
                .where((element2) => element2['name'] == field_name)
                .toList()[0]['workercount'] -
            1;
        Citizen.citizen
            .where((element3) => element3['workarea'] == food_building_name)
            .toList()
            .where((element4) => element4['workfield'] == field_name)
            .toList()[0]['workfield'] = 'unemployed';
      }
    } else if (food_building_name == 'ORCHARD') {
      if (food_building[3]['workeroutput']
              .where((element10) => element10['name'] == field_name)
              .toList()[0]['workercount'] >
          0) {
        food_building[3]['workeroutput']
            .where((element2) => element2['name'] == field_name)
            .toList()[0]['workercount'] = food_building[3]['workeroutput']
                .where((element2) => element2['name'] == field_name)
                .toList()[0]['workercount'] -
            1;
        Citizen.citizen
            .where((element3) => element3['workarea'] == food_building_name)
            .toList()
            .where((element4) => element4['workfield'] == field_name)
            .toList()[0]['workfield'] = 'unemployed';
      }
    }
    notifyListeners();
  }

  void workFieldArranger(String food_building_name, String field_name) {
    print(field_name);
    if(field_name != 'unemployed'){
      food_building
          .where((element) => element['name'] == food_building_name)
          .toList()[0]['workeroutput']
          .where((element2) => element2['name'] == field_name)
          .toList()[0]['workercount'] =
          Citizen.citizen
              .where((element3) => element3['workfield'] == field_name)
              .toList()
              .length;

      notifyListeners();
    }
  }
  void workAreaArranger(String food_building_name){
    notifyListeners();
  }
}
