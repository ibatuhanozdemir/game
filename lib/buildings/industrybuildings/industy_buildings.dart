import 'package:flutter/cupertino.dart';
import 'package:game/worker/citizen.dart';

class IndustryBuilding extends ChangeNotifier {
  static List industry_building = [
    {'name': 'woodcutter', 'progres': true,'labourcost':7,'buildprogres':0,'quantity':10},
    {'name': 'stonecutter', 'progres': true,'labourcost':10,'buildprogres':0,'quantity':10}
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
}
