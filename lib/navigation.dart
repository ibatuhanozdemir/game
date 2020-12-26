import 'package:flutter/cupertino.dart';
import 'package:game/worker/citizen.dart';
import 'buildings/foodbuildings/food_buildings.dart';
import 'kalip_widgetlar/citizen_widget.dart';
import 'main.dart';
import 'package:game/buildings/industrybuildings/industy_buildings.dart';

class Navigation extends ChangeNotifier {


 static int index =0;


  navigation() {
    if(index==0){
      return ListView.builder(
          itemBuilder: (_, index) {
            return IndstryBuildingWidgeti(index);
          },
          itemCount: IndustryBuilding.industry_building.length);
    }else if(index==1){
      return ListView.builder(
          itemBuilder: (_, index) {
            return FoodBuildingWidgeti(index);
          },
          itemCount: FoodBuilding.food_building.length);
    }else if(index==2){
      return ListView.builder(
          itemBuilder: (_, index) {
            return citizenWidgeti(index);
          },
          itemCount: Citizen.citizen.length);
    }
    notifyListeners();
  }
}
