import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:game/worker/citizen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IndustryBuilding extends ChangeNotifier {
  static List industry_building = [
    {'name': 'woodcutter', 'progres': true,'labourcost':7,'buildprogres':0,'quantity':10,'capacity':2,'workercount':1},
    {'name': 'stonecutter', 'progres': true,'labourcost':10,'buildprogres':0,'quantity':10,'capacity':2,'workercount':1}
  ];

  void buildstart(int index) {
    IndustryBuilding.industry_building[index]['progres'] = false;

    notifyListeners();
  }
  void buildOnGoing(){
    industry_building.forEach((element) {
      if(element['progres']==false){
        element['buildprogres']=element['buildprogres']+Citizen.citizen.where((element2) => (element2['workarea'].contains('builder'+element['name']))).toList().length;

        if(element['buildprogres']>=element['labourcost']){
          element['buildprogres']=0;
          element['progres']=true;
          element['quantity']=element['quantity']+1;
          Citizen.citizen.where((element2) => (element2['workarea'].contains('builder'+element['name']))).toList().forEach((element3) { element3['workarea']='unemployed';});
        }
      }

    });

  }

  Future<void> save( )async{
    final prefs= await SharedPreferences.getInstance();

    prefs.setString('industry_building',jsonEncode(industry_building) );


  }
  Future<int> loadIndustryBuilding() async {

    final prefs = await SharedPreferences.getInstance();
    final startupNumber =  prefs.getString('industry_building');



    if (startupNumber == null) {
      industry_building=industry_building;

      return 0;

    }
    industry_building=jsonDecode(startupNumber);
    industry_building.forEach((element3) { element3['workercount']=Citizen.citizen
        .where((element) => (element['workarea'].contains(element3['name'])))
        .toList().length;

    });


    return 0;
  }





}
