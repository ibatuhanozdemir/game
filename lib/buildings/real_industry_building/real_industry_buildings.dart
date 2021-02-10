import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:game/buildings/stroragebuildings/storage_buildings.dart';
import 'package:game/resources/industry/industry_resources.dart';
import 'package:game/resources/real_industry/real_industry_resources.dart';
import 'package:game/worker/citizen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RealIndustryBuildings extends ChangeNotifier {

  static List real_industry_building = [
    {
      'name': 'FIREWOOD CAMP',
      'progres': true,
      'harvest': false,
      'oneoutput': true,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'capacityperbuilding': 2,
      'outputname': 'Firewood',
      'resourceconsumption': [
        {'name': 'Wood', 'count': 3, 'type': 'industry'}
      ],
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
      'explanation' : 'Uses wood and turns it into firewood. Firewood is used in warming and tool making.'
    },
    {
      'name': 'WORKSHOP',
      'progres': true,
      'harvest': true,
      'oneoutput': false,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'capacityperbuilding': 2,
      'outputname': [
        {
          'name': 'Wooden Tool',
          'select': true,
          'outputprogress': 0,
          'totaloutputprogress': 10,
          'resourceconsumption': [
            {
              'name': 'Wood',
              'count': 3,
              'type':'industry'
            }
          ]
        },
        {
          'name': 'Stone Tool',
          'select': false,
          'outputprogress': 0,
          'totaloutputprogress': 10,
          'resourceconsumption': [
            {
              'name': 'Wood',
              'count': 3,
              'type':'industry'
            },
            {
              'name': 'stone',
              'count': 3,
              'type':'industry'
            }
          ]
        }
      ],
      'workeroutput': 1,
      'workercount': 0,
      'lastdayoutput': 0,
      'upgradereq': [
        {'name': 'Wood', 'count': 20, 'progres': 0},
        {'name': 'stone', 'count': 50, 'progres': 0},
        {'name': 'labour', 'count': 10, 'progres': 0},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',

      'dropdownitemvalue':0,
      'imagename': 'natural_resources/stone mining.png',
      'explanation' : 'Uses wood and stone to produce wood or stone tools'
    },
    {
      'name': 'TAILOR',
      'progres': true,
      'harvest': true,
      'oneoutput': false,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'outputname': [
        {
          'name': 'Leather Clothes',
          'select': true,
          'outputprogress': 0,
          'totaloutputprogress': 10,
          'resourceconsumption': [
            {
              'name': 'leather',
              'count': 3,
              'type':'industry'
            }
          ]
        },
        {
          'name': 'Wool Clothes',
          'select': false,
          'outputprogress': 0,
          'totaloutputprogress': 10,
          'resourceconsumption': [
            {
              'name': 'wool',
              'count': 3,
            'type':'industry'
            },
          ]
        },
        {
          'name': 'Warm Clothes',
          'select': false,
          'outputprogress': 0,
          'totaloutputprogress': 10,
          'resourceconsumption': [
            {
              'name': 'leather',
              'count': 3,
              'type':'industry'
            },
            {
              'name': 'wool',
              'count': 3,
              'type':'industry'
            }
          ]
        }
      ],
      'capacityperbuilding': 2,
      'workeroutput': 1,
      'workercount': 0,
      'lastdayoutput': 0,
      'upgradereq': [
        {'name': 'Wood', 'count': 20, 'progres': 0},
        {'name': 'stone', 'count': 50, 'progres': 0},
        {'name': 'labour', 'count': 10, 'progres': 0},
      ],
      'totalupgradereq': 80,
      'buildingprosses1': '',

      'dropdownitemvalue':0,
      'imagename': 'natural_resources/coal mining.png',
      'explanation' : 'Uses wool or leather to produce clothes. Clothing improves efficiency.'

    },
    {
      'name': 'BLACKSMITH',
      'progres': true,
      'harvest': true,
      'oneoutput': false,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'outputname': [
        {
          'name': 'Iron Tool',
          'select': true,
          'outputprogress': 0,
          'totaloutputprogress': 10,
          'resourceconsumption': [
            {
              'name': 'Wood',
              'count': 3,

            },{
              'name': 'iron',
              'count': 3,

            },

          ]
        },
        {
          'name': 'Steel Tool',
          'select': false,
          'outputprogress': 0,
          'totaloutputprogress': 10,
          'resourceconsumption': [
            {
              'name': 'iron',
              'count': 3,

            },
            {
              'name': 'coal',
              'count': 3,

            },
          ]
        },
      ],
      'capacityperbuilding': 2,
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

      'dropdownitemvalue':0,
      'imagename': 'natural_resources/iron mining.png',
      'explanation' : 'Uses iron and coal to produce iron or steel tools. '
    },
    {
      'name': 'BREWERY',
      'progres': true,
      'harvest': false,
      'oneoutput': true,
      'outputprogress': 0,
      'totaloutputprogress': 10,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'capacityperbuilding': 2,
      'outputname': 'Beer',
      'resourceconsumption': [
        {'name': 'wheat', 'count': 3, 'type': 'industry'}
      ],
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
      'explanation' : 'Uses wheat to produce beer. Beer is used in taverns.'
    },
    {
      'name': 'MILL',
      'progres': true,
      'harvest': false,
      'oneoutput': true,
      'outputprogress': 0,
      'totaloutputprogress': 10,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'capacityperbuilding': 2,
      'outputname': 'Flour',
      'resourceconsumption': [
        {'name': 'wheat', 'count': 3, 'type': 'industry'}
      ],
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
      'explanation' : 'Uses wheat to produce flour. Flour is used in bakeries.'
    },
    {
      'name': 'BAKERY',
      'progres': true,
      'harvest': false,
      'oneoutput': true,
      'outputprogress': 0,
      'totaloutputprogress': 10,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'capacityperbuilding': 2,
      'outputname': 'Bread',
      'resourceconsumption': [
        {'name': 'Flour', 'count': 3, 'type': 'realindustry'}
      ],
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
      'explanation' : 'Uses wheat to produce bread'
    },
    {
      'name': 'STABLE',
      'progres': true,
      'harvest': true,
      'oneoutput': true,
      'outputprogress': 0,
      'totaloutputprogress': 10,
      'buildprogres': 0,
      'quantity': 10,
      'capacity': 2,
      'capacityperbuilding': 2,
      'outputname': 'Horse',
      'resourceconsumption': [
        {'name': 'wheat', 'count': 3, 'type': 'industry'}
      ],
      'estimatedoutput': 0, // TODO : kaldırılacak widget düzenlendikten sonra
      'workeroutput': 1,
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
      'explanation' : 'Requires horses. Improves efficiency of explorers dramatically.'
    }
  ];

  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString(
        'real_industry_building', jsonEncode(real_industry_building));
  }

  Future<int> loadRealIndustryBuilding() async {
    final prefs = await SharedPreferences.getInstance();
    final startupNumber = prefs.getString('real_industry_building');

    if (startupNumber == null) {
      real_industry_building = real_industry_building;

      return 0;
    }
    real_industry_building = jsonDecode(startupNumber);

    return 0;
  }

  void buildstart(int index) {
    real_industry_building[index]['progres'] = false;
    real_industry_building[index]['buildingprosses1'] =
        real_industry_building[index]['upgradereq'][0]['name'] + " ";

    notifyListeners();
  }

  void buildOnGoing() {
    real_industry_building.forEach((element) {
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

  void collectResource() {
    real_industry_building.forEach((element) {
      if (element['workercount'] >= 1) {
        if (element['oneoutput'] == true) {
          if (element['resourceconsumption'][0]['type'] == 'industry') {
            if (element['resourceconsumption'][0]['count'] *
                    element['workercount'] <=
                IndustryResources.industry_resources
                    .where((element2) =>
                        element2['name'] ==
                        element['resourceconsumption'][0]['name'])
                    .toList()[0]['count']) {
              double totalWorkerEfficiency = 0;
              Citizen.citizen
                  .where((element2) => element2['workarea'] == element['name'])
                  .toList()
                  .forEach((element3) {
                totalWorkerEfficiency =
                    totalWorkerEfficiency + element3['overallef'];
              });
              if (element['harvest'] == false) {
                int a =
                    (element['workeroutput'] * (totalWorkerEfficiency) / 100)
                        .round();
                element['lastdayoutput'] = 'STORAGE FULL';
                if(StorageBuilding.storage_building.where((element11) => element11['name']=='WAREHOUSE').toList()[0]['fullness']<StorageBuilding.storage_building.where((element11) => element11['name']=='WAREHOUSE').toList()[0]['capacity']) {
                RealIndustryResources.real_industry_resources
                    .where(
                        (element4) => element4['name'] == element['outputname'])
                    .toList()[0]['count'] = RealIndustryResources
                        .real_industry_resources
                        .where((element4) =>
                            element4['name'] == element['outputname'])
                        .toList()[0]['count'] +
                    a;
                element['lastdayoutput'] = a;}
              } else {
                if (element['outputprogress'] <
                    element['totaloutputprogress']) {
                  element['outputprogress'] = element['outputprogress'] + 1;
                } else {
                  element['outputprogress'] = 0;
                  int a =
                      (element['workeroutput'] * (totalWorkerEfficiency) / 100)
                          .round();
                  if (a < 1) {
                    a = 1;
                  }
                  element['lastdayoutput'] = 'STORAGE FULL';
                  if(StorageBuilding.storage_building.where((element11) => element11['name']=='WAREHOUSE').toList()[0]['fullness']<StorageBuilding.storage_building.where((element11) => element11['name']=='WAREHOUSE').toList()[0]['capacity']) {
                    RealIndustryResources.real_industry_resources
                        .where((element4) =>
                    element4['name'] == element['outputname'])
                        .toList()[0]['count'] = RealIndustryResources
                        .real_industry_resources
                        .where((element4) =>
                    element4['name'] == element['outputname'])
                        .toList()[0]['count'] +
                        a;
                    element['lastdayoutput'] = a;
                  }}
              }
              IndustryResources.industry_resources
                  .where((element2) =>
                      element2['name'] ==
                      element['resourceconsumption'][0]['name'])
                  .toList()[0]['count'] = IndustryResources.industry_resources
                      .where((element2) =>
                          element2['name'] ==
                          element['resourceconsumption'][0]['name'])
                      .toList()[0]['count'] -
                  element['resourceconsumption'][0]['count'] *
                      element['workercount'];
            }
          } else if (element['resourceconsumption'][0]['type'] ==
              'realindustry') {
            if (element['resourceconsumption'][0]['count'] *
                    element['workercount'] <=
                RealIndustryResources.real_industry_resources
                    .where((element2) =>
                        element2['name'] ==
                        element['resourceconsumption'][0]['name'])
                    .toList()[0]['count']) {
              double totalWorkerEfficiency = 0;
              Citizen.citizen
                  .where((element2) => element2['workarea'] == element['name'])
                  .toList()
                  .forEach((element3) {
                totalWorkerEfficiency =
                    totalWorkerEfficiency + element3['overallef'];
              });
              if (element['harvest'] == false) {
                int a =
                    (element['workeroutput'] * (totalWorkerEfficiency) / 100)
                        .round();
                element['lastdayoutput'] = 'STORAGE FULL';
                if(StorageBuilding.storage_building.where((element11) => element11['name']=='WAREHOUSE').toList()[0]['fullness']<StorageBuilding.storage_building.where((element11) => element11['name']=='WAREHOUSE').toList()[0]['capacity']) {
                  RealIndustryResources.real_industry_resources
                      .where(
                          (element4) =>
                      element4['name'] == element['outputname'])
                      .toList()[0]['count'] = RealIndustryResources
                      .real_industry_resources
                      .where((element4) =>
                  element4['name'] == element['outputname'])
                      .toList()[0]['count'] +
                      a;
                  element['lastdayoutput'] = a;
                }} else {
                if (element['outputprogress'] <
                    element['totaloutputprogress']) {
                  element['outputprogress'] = element['outputprogress'] + 1;
                } else {
                  element['outputprogress'] = 0;
                  int a =
                      (element['workeroutput'] * (totalWorkerEfficiency) / 100)
                          .round();
                  if (a < 1) {
                    a = 1;
                  }
                  element['lastdayoutput'] = 'STORAGE FULL';
                  if(StorageBuilding.storage_building.where((element11) => element11['name']=='WAREHOUSE').toList()[0]['fullness']<StorageBuilding.storage_building.where((element11) => element11['name']=='WAREHOUSE').toList()[0]['capacity']) {
                    RealIndustryResources.real_industry_resources
                        .where((element4) =>
                    element4['name'] == element['outputname'])
                        .toList()[0]['count'] = RealIndustryResources
                        .real_industry_resources
                        .where((element4) =>
                    element4['name'] == element['outputname'])
                        .toList()[0]['count'] +
                        a;
                    element['lastdayoutput'] = a;
                  } }
              }
              RealIndustryResources.real_industry_resources
                  .where((element2) =>
                      element2['name'] ==
                      element['resourceconsumption'][0]['name'])
                  .toList()[0]['count'] = RealIndustryResources
                      .real_industry_resources
                      .where((element2) =>
                          element2['name'] ==
                          element['resourceconsumption'][0]['name'])
                      .toList()[0]['count'] -
                  element['resourceconsumption'][0]['count'] *
                      element['workercount'];
            }
          }
        }
        else if(element['oneoutput'] == false){
          int harcanacak_toplam=element['outputname'].where((element2)=> element2['select']==true).toList()[0]['resourceconsumption'].length;
          int b = 0;
          element['outputname'].where((element2)=> element2['select']==true).toList()[0]['resourceconsumption'].forEach((element3){
            if(element3['count']*element['workercount']<=IndustryResources.industry_resources.where((element4) => element4['name']==element3['name']).toList()[0]['count']){b=b+1;}
          });
          if(harcanacak_toplam==b){
            double totalWorkerEfficiency = 0;
            Citizen.citizen
                .where((element2) => element2['workarea'] == element['name'])
                .toList()
                .forEach((element3) {
              totalWorkerEfficiency =
                  totalWorkerEfficiency + element3['overallef'];
            });

            if (element['outputname'].where((element2)=> element2['select']==true).toList()[0]['outputprogress'] <
                element['outputname'].where((element2)=> element2['select']==true).toList()[0]['totaloutputprogress']) {
              element['outputname'].where((element2)=> element2['select']==true).toList()[0]['outputprogress'] = element['outputname'].where((element2)=> element2['select']==true).toList()[0]['outputprogress'] + 1;
            } else {
              element['outputname'].where((element2)=> element2['select']==true).toList()[0]['outputprogress'] = 0;
              int a =
              (element['workeroutput'] * (totalWorkerEfficiency) / 100)
                  .round();
              if (a < 1) {
                a = 1;
              }
              element['lastdayoutput'] = 'STORAGE FULL';
              if(StorageBuilding.storage_building.where((element11) => element11['name']=='WAREHOUSE').toList()[0]['fullness']<StorageBuilding.storage_building.where((element11) => element11['name']=='WAREHOUSE').toList()[0]['capacity']) {
                RealIndustryResources.real_industry_resources
                    .where((element4) =>
                element4['name'] == element['outputname']
                    .where((element2) => element2['select'] == true)
                    .toList()[0]['name'])
                    .toList()[0]['count'] = RealIndustryResources
                    .real_industry_resources
                    .where((element4) =>
                element4['name'] == element['outputname']
                    .where((element2) => element2['select'] == true)
                    .toList()[0]['name'])
                    .toList()[0]['count'] +
                    a;
                element['lastdayoutput'] = a;
              } }
            element['outputname'].where((element2)=> element2['select']==true).toList()[0]['resourceconsumption'].forEach((element3){
              IndustryResources.industry_resources.where((element4) => element4['name']==element3['name']).toList()[0]['count']=IndustryResources.industry_resources.where((element4) => element4['name']==element3['name']).toList()[0]['count']-element3['count']*element['workercount'];



            });

          }





        }
      }
    });
  }

  void customDropDownChanger(int value,String building_name){

    RealIndustryBuildings.real_industry_building.where((element) => element['name']==building_name).toList()[0]['dropdownitemvalue']=value;
    notifyListeners();

  }
  void customDropSubProdutcSelector(String building_name,String sub_product_name){

    real_industry_building.where((element) => element['name']==building_name).toList()[0]['outputname'].forEach((element2){element2['select']=false;});
    real_industry_building.where((element) => element['name']==building_name).toList()[0]['outputname'].where((element2)=>element2['name']==sub_product_name).toList()[0]['select']=true;
    notifyListeners();
    print(real_industry_building.where((element) => element['name']==building_name).toList()[0]['outputname']);
  }
}
