import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:game/resources/industry/industry_resources.dart';
import 'package:game/worker/citizen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IndustryBuilding extends ChangeNotifier {
  static List industry_building = [
    {
      'name': 'woodcutter',
      'progres': true,
      'harvest': false,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'capacityperbuilding' : 2,
      'outputname': 'wood',
      'workeroutput': 5,
      'workercount': 0,
      'lastdayoutput': 0,
      'upgradereq': [
        {'name': 'wood', 'count': 20},
        {'name': 'stone', 'count': 50},
        {'name': 'labourcost', 'count': 10},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename': 'natural_resources/woodcutter.png'
    },
    {
      'name': 'stonecutter',
      'progres': true,
      'harvest': false,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'capacityperbuilding' : 2,
      'outputname': 'stone',
      'workeroutput': 5,
      'workercount': 0,
      'lastdayoutput': 0,
      'upgradereq': [
        {'name': 'wood', 'count': 20},
        {'name': 'stone', 'count': 50},
        {'name': 'labourcost', 'count': 10},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename': 'natural_resources/stone mining.png'
    },
    {
      'name': 'coal mine',
      'progres': true,
      'harvest': false,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'capacityperbuilding' : 2,
      'outputname': 'coal',
      'workeroutput': 5,
      'workercount': 0,
      'lastdayoutput': 0,
      'upgradereq': [
        {'name': 'wood', 'count': 20},
        {'name': 'stone', 'count': 50},
        {'name': 'labourcost', 'count': 10},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename': 'natural_resources/coal mining.png'
    },
    {
      'name': 'iron mine',
      'progres': true,
      'harvest': false,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'capacityperbuilding' : 2,
      'outputname': 'iron',
      'workeroutput': 5,
      'workercount': 0,
      'lastdayoutput': 0,
      'upgradereq': [
        {'name': 'wood', 'count': 20},
        {'name': 'stone', 'count': 50},
        {'name': 'labourcost', 'count': 10},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename': 'natural_resources/iron mining.png'
    },
    {
      'name': 'forester',
      'progres': true,
      'harvest': true,
      'outputprogress': 0,
      'totaloutputprogress': 10,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'capacityperbuilding' : 2,
      'outputname': 'tree',
      'estimatedoutput': 0,
      'workeroutput': 5,
      'workercount': 0,
      'lastdayoutput': 0,
      'upgradereq': [
        {'name': 'wood', 'count': 20},
        {'name': 'stone', 'count': 50},
        {'name': 'labourcost', 'count': 10},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'buildingprosses2': 0,
      'imagename': 'natural_resources/forester.png'
    }
  ];

  void buildstart(int index) {
    industry_building[index]['progres'] = false;
    industry_building[index]['buildingprosses1'] =
        industry_building[index]['upgradereq'][0]['name'] + " ";

    notifyListeners();
  }

  void buildOnGoing() {
    industry_building.forEach((element) {
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

    prefs.setString('industry_building', jsonEncode(industry_building));
  }

  Future<int> loadIndustryBuilding() async {
    final prefs = await SharedPreferences.getInstance();
    final startupNumber = prefs.getString('industry_building');

    if (startupNumber == null) {
      industry_building = industry_building;

      return 0;
    }
    industry_building = jsonDecode(startupNumber);

    return 0;
  }

  void collectResource() {
    industry_building.forEach((element) {
      double totalWorkerEfficiency = 0;
      if (element['workercount'] >= 1) {
        Citizen.citizen
            .where((element2) => element2['workarea'] == element['name'])
            .toList()
            .forEach((element3) {
          totalWorkerEfficiency = totalWorkerEfficiency + element3['overallef'];
        });

        if (element['harvest'] == false) {
          int a =
              (element['workeroutput'] * (totalWorkerEfficiency) / 100).round();
          IndustryResources.industry_resources
              .where((element4) => element4['name'] == element['outputname'])
              .toList()[0]['count'] = IndustryResources.industry_resources
                  .where(
                      (element4) => element4['name'] == element['outputname'])
                  .toList()[0]['count'] +
              a;
          element['lastdayoutput'] = a;
        } else {
          if (element['outputprogress'] < element['totaloutputprogress']) {
            int a = (element['workeroutput'] * (totalWorkerEfficiency) / 100)
                .round();
            element['estimatedoutput'] = element['estimatedoutput'] + a;
            element['outputprogress'] = element['outputprogress'] + 1;
          } else {
            element['outputprogress'] = 0;
            int a = (element['workeroutput'] * (totalWorkerEfficiency) / 100)
                .round();
            element['estimatedoutput'] = element['estimatedoutput'] + a;
            IndustryResources.industry_resources
                .where((element4) => element4['name'] == element['outputname'])
                .toList()[0]['count'] = IndustryResources.industry_resources
                    .where(
                        (element4) => element4['name'] == element['outputname'])
                    .toList()[0]['count'] +
                element['estimatedoutput'];
            element['lastdayoutput'] = element['estimatedoutput'];
            element['estimatedoutput'] = 0;
          }
        }
      }
    });
  }

  workerCapacity(){
    industry_building.forEach((element) {element['capacity']=element['capacityperbuilding']*element['quantity'];});
  }


}
