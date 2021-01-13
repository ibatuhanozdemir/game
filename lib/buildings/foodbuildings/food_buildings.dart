import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:game/worker/citizen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodBuilding extends ChangeNotifier {
  static List food_building = [
    {
      'name': 'gatherer/s hut',
      'progres': true,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'workercount': 1,
      'upgradereq': [
        {'name': 'wood', 'count': 20},
        {'name': 'stone', 'count': 50},
        {'name': 'labourcost', 'count': 10},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename':'gatherershut.png'
    },
    {
      'name': 'hunter/s cabin',
      'progres': true,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'workercount': 1,
      'upgradereq': [
        {'name': 'wood', 'count': 20},
        {'name': 'stone', 'count': 50},
        {'name': 'labourcost', 'count': 10},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename':'stone mining.png'
    },
    {
      'name': 'farm field',
      'progres': true,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'workercount': 1,
      'upgradereq': [
        {'name': 'wood', 'count': 20},
        {'name': 'stone', 'count': 50},
        {'name': 'labourcost', 'count': 10},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename':'farm.png'
    },
    {
      'name': 'orchard',
      'progres': true,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'workercount': 1,
      'upgradereq': [
        {'name': 'wood', 'count': 20},
        {'name': 'stone', 'count': 50},
        {'name': 'labourcost', 'count': 10},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename':'orchard.png'
    },
    {
      'name': 'fishing dockk',
      'progres': true,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'workercount': 1,
      'upgradereq': [
        {'name': 'wood', 'count': 20},
        {'name': 'stone', 'count': 50},
        {'name': 'labourcost', 'count': 10},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename':'iron mining.png'
    },
    {
      'name': 'pasture (cow)',
      'progres': true,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'workercount': 1,
      'upgradereq': [
        {'name': 'wood', 'count': 20},
        {'name': 'stone', 'count': 50},
        {'name': 'labourcost', 'count': 10},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename':'pastorEXPAND.png'
    },
    {
      'name': 'pasture (sheep)',
      'progres': true,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'workercount': 1,
      'upgradereq': [
        {'name': 'wood', 'count': 20},
        {'name': 'stone', 'count': 50},
        {'name': 'labourcost', 'count': 10},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename':'iron mining.png'
    },
    {
      'name': 'coop',
      'progres': true,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'workercount': 1,
      'upgradereq': [
        {'name': 'wood', 'count': 20},
        {'name': 'stone', 'count': 50},
        {'name': 'labourcost', 'count': 10},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename':'iron mining.png'
    }
  ];

  void buildstart(int index) {
    food_building[index]['progres'] = false;
    food_building[index]['buildingprosses1'] =
        food_building[index]['upgradereq'][0]['name'] +
            " ";

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
}
