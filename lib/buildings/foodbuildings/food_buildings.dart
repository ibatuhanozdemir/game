import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:game/resources/food/food_resources.dart';
import 'package:game/resources/industry/industry_resources.dart';
import 'package:game/worker/citizen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodBuilding extends ChangeNotifier {
  static List food_building = [
    {
      'name': 'gatherer/s hut',
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
        {'name': 'Wood', 'count': 20},
        {'name': 'stone', 'count': 50},
        {'name': 'labourcost', 'count': 10},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename': 'food_buildings/gatherer hut.png'
    },
    {
      'name': 'hunter/s cabin',
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
        {'name': 'Wood', 'count': 20},
        {'name': 'stone', 'count': 50},
        {'name': 'labourcost', 'count': 10},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename': 'food_buildings/HuntingCabin.png'
    },
    {
      'name': 'farm field',
      'progres': true,
      'harvest': true,
      'buildprogres': 0,
      'quantity': 10,
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
          'imagename': 'food_buildings/farm.png',
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
          'imagename': 'food_buildings/farm.png',
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
          'imagename': 'food_buildings/farm.png',
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
          'imagename': 'food_buildings/farm.png',
        },
      ],
      'upgradereq': [
        {'name': 'Wood', 'count': 20},
        {'name': 'stone', 'count': 50},
        {'name': 'labourcost', 'count': 10},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename': 'food_buildings/farm.png'
    },
    {
      'name': 'orchard',
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
          'imagename': 'food_buildings/farm.png',
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
          'imagename': 'food_buildings/farm.png',
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
          'imagename': 'food_buildings/farm.png',
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
          'imagename': 'food_buildings/farm.png',
        },
      ],
      'upgradereq': [
        {'name': 'Wood', 'count': 20},
        {'name': 'stone', 'count': 50},
        {'name': 'labourcost', 'count': 10},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename': 'food_buildings/orchard.png'
    },
    {
      'name': 'fishing dock',
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
        {'name': 'Wood', 'count': 20},
        {'name': 'stone', 'count': 50},
        {'name': 'labourcost', 'count': 10},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename': 'food_buildings/fishingson.png'
    },
    {
      'name': 'pasture (cow)',
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
        {'name': 'Wood', 'count': 20},
        {'name': 'stone', 'count': 50},
        {'name': 'labourcost', 'count': 10},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename': 'food_buildings/pastorEXPAND.png'
    },
    {
      'name': 'pasture (sheep)',
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
        {'name': 'Wood', 'count': 20},
        {'name': 'stone', 'count': 50},
        {'name': 'labourcost', 'count': 10},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename': 'food_buildings/koyun.png'
    },
    {
      'name': 'coop',
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
        {'name': 'Wood', 'count': 20},
        {'name': 'stone', 'count': 50},
        {'name': 'labourcost', 'count': 10},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename': 'food_buildings/coop.png'
    }
  ];

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
            element['buildprogres'] = element['buildprogres'] + 1;
            if (element['buildprogres'] >= element['totalupgradereq']) {
              element['buildprogres'] = 0;
              element['progres'] = true;
              element['quantity'] = element['quantity'] + 1;
              element['buildingprosses2'] = 0;
              Citizen.citizen
                  .where((element2) => (element2['workarea']
                      .contains('builder' + element['name'])))
                  .toList()
                  .forEach((element3) {
                element3['workarea'] = 'unemployed';
              });
            }

            int buildstatus = 0;
            for (int i = 0; i <= element['buildingprosses2']; i++) {
              buildstatus = buildstatus + element['upgradereq'][i]['count'];
            }

            if (buildstatus <= element['buildprogres']) {
              element['buildingprosses2'] = element['buildingprosses2'] + 1;
              print(element['buildingprosses2']);

              if (element['buildingprosses2'] ==
                  element['upgradereq'].length - 1) {
                element['buildingprosses1'] = 'Building ';
              } else {
                element['buildingprosses1'] = element['upgradereq']
                        [element['buildingprosses2']]['name'] +
                    " ";
              }
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
              FoodResources.food_resource_sublist
                  .where((element5) => element5['foodname'] == element4['name'])
                  .toList()[0]['count'] = FoodResources.food_resource_sublist
                      .where((element5) =>
                          element5['foodname'] == element4['name'])
                      .toList()[0]['count'] +
                  a;
            } else {
              IndustryResources.industry_resources
                  .where((element5) => element5['name'] == element4['name'])
                  .toList()[0]['count'] = IndustryResources.industry_resources
                      .where((element5) => element5['name'] == element4['name'])
                      .toList()[0]['count'] +
                  a;
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
                if (element6['type'] == 'food') {
                  FoodResources.food_resource_sublist
                      .where((element12) =>
                          element12['foodname'] == element6['name'])
                      .toList()[0]['count'] = FoodResources
                          .food_resource_sublist
                          .where((element12) =>
                              element12['foodname'] == element6['name'])
                          .toList()[0]['count'] +
                      element6['estimatedoutput'];
                } else {
                  IndustryResources.industry_resources
                      .where(
                          (element12) => element12['name'] == element6['name'])
                      .toList()[0]['count'] = IndustryResources
                          .industry_resources
                          .where((element12) =>
                              element12['name'] == element6['name'])
                          .toList()[0]['count'] +
                      element6['estimatedoutput'];
                }

                element6['lastdayoutput'] = element6['estimatedoutput'];
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
    if (food_building_name == 'farm field') {
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
    if (food_building_name == 'farm field') {
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
    } else if (food_building_name == 'orchard') {
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
}
