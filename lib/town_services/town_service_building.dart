import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:game/worker/citizen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TownServiceBuilding extends ChangeNotifier {
  static List town_service_building = [
    {
      'name': 'house',
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
      'imagename':'ev.png'
    },
    {
      'name': 'church',
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
      'imagename':'church.png'
    },
    {
      'name': 'tavern',
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
      'imagename':'saloon.png'
    },
    {
      'name': 'graveyard',
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
      'imagename':'mezar.png'
    }
  ];

  void buildstart(int index) {
    town_service_building[index]['progres'] = false;
    town_service_building[index]['buildingprosses1'] =
        town_service_building[index]['upgradereq'][0]['name'] + " ";

    notifyListeners();
  }

  void buildOnGoing() {
    town_service_building.forEach((element) {
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

    prefs.setString('town_service_building', jsonEncode(town_service_building));
  }

  Future<int> loadTownServiceBuilding() async {
    final prefs = await SharedPreferences.getInstance();
    final startupNumber = prefs.getString('town_service_building');

    if (startupNumber == null) {
      town_service_building = town_service_building;

      return 0;
    }
    town_service_building = jsonDecode(startupNumber);

    return 0;
  }
}
