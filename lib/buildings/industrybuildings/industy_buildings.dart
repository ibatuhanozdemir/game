import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:game/resources/industry/industry_resources.dart';
import 'package:game/worker/citizen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IndustryBuilding extends ChangeNotifier {
  static List industry_building = [
    {
      'name': 'WOOD CAMP',
      'progres': true,
      'harvest': false,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'capacityperbuilding': 2,
      'outputname': 'Wood',
      'workeroutput': 5,
      'workercount': 0,
      'lastdayoutput': 0,
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
      'name': 'STONECUTTER',
      'progres': true,
      'harvest': false,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'capacityperbuilding': 2,
      'outputname': 'stone',
      'workeroutput': 5,
      'workercount': 0,
      'lastdayoutput': 0,
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
    },
    {
      'name': 'COAL MINE',
      'progres': true,
      'harvest': false,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'capacityperbuilding': 2,
      'outputname': 'coal',
      'workeroutput': 5,
      'workercount': 0,
      'lastdayoutput': 0,
      'upgradereq': [
        {'name': 'Wood', 'count': 20, 'progres': 0},
        {'name': 'stone', 'count': 50, 'progres': 0},
        {'name': 'labour', 'count': 10, 'progres': 0},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'imagename': 'natural_resources/coal mining.png',
      'explanation':
          'Must be built to get coal. Coal is used in steel tool making and warming in houses.'
    },
    {
      'name': 'IRON MINE',
      'progres': true,
      'harvest': false,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'capacityperbuilding': 2,
      'outputname': 'iron',
      'workeroutput': 5,
      'workercount': 0,
      'lastdayoutput': 0,
      'upgradereq': [
        {'name': 'Wood', 'count': 20, 'progres': 0},
        {'name': 'stone', 'count': 50, 'progres': 0},
        {'name': 'labour', 'count': 10, 'progres': 0},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'imagename': 'natural_resources/iron mining.png',
      'explanation':
          'Must be built to get iron. Iron is used in steel tool making.'
    },
    {
      'name': 'FORESTER',
      'progres': true,
      'harvest': true,
      'outputprogress': 0,
      'totaloutputprogress': 10,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'capacityperbuilding': 2,
      'outputname': 'tree',
      'estimatedoutput': 0,
      'workeroutput': 5,
      'workercount': 0,
      'lastdayoutput': 0,
      'upgradereq': [
        {'name': 'Wood', 'count': 20, 'progres': 0},
        {'name': 'stone', 'count': 50, 'progres': 0},
        {'name': 'labour', 'count': 10, 'progres': 0},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',
      'imagename': 'natural_resources/forester.png',
      'explanation':
          'Workers of forester camp plant saplings. If there is no forester camping or nobody is working here, you might run out of trees to get wood from.'
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

  void workerCapacity() {
    industry_building.forEach((element) {
      element['capacity'] =
          element['capacityperbuilding'] * element['quantity'];
    });
  }

  void workAreaArranger(String workarea_name) {
    notifyListeners();
  }
}
