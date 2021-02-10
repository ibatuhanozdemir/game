import 'package:flutter/cupertino.dart';
import 'package:game/buildings/real_industry_building/real_industry_buildings_widget.dart';
import 'package:game/buildings/stroragebuildings/storage_buildings.dart';
import 'package:game/buildings/stroragebuildings/storage_buildings_widget.dart';
import 'package:game/screens/townhall.dart';
import 'package:game/town_services/town_service_building.dart';
import 'package:game/town_services/town_service_widget.dart';
import 'package:game/worker/citizen.dart';
import 'buildings/foodbuildings/food_building_widget.dart';
import 'buildings/foodbuildings/food_buildings.dart';
import 'buildings/industrybuildings/industry_buildings_widget.dart';
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
    }else if(index==3){
      return TownHall();
    }else if(index==4){

      return ListView.builder(
          itemBuilder: (_, index) {
            return TownServiceWidget(index);
          },
          itemCount: TownServiceBuilding.town_service_building.length);
    }else if(index==5){
      return ListView.builder(
          itemBuilder: (_, index) {
            return RealIndustryBuildingWidgeti(index);
          },
          itemCount: FoodBuilding.food_building.length);
    }else if(index==6){
      return ListView.builder(
          itemBuilder: (_, index) {
            return StorageBuildingWidgeti(index);
          },
          itemCount: StorageBuilding.storage_building.length);
    }



    notifyListeners();
  }

 void numberswitch(int i){
   Navigation.index = i;
   notifyListeners();
 }
}

